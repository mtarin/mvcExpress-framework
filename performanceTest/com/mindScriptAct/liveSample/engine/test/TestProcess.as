package com.mindScriptAct.liveSample.engine.test {
//import com.mindScriptAct.liveSample.view.main.ViewObject;
import com.mindScriptAct.liveSample.view.test.ViewObject;
import flash.geom.Point;
import org.mvcexpress.live.Process;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class TestProcess extends Process {
	static public const NAME:String = "TestProcess";
	
	[Inject]
	public var testData:Point;
	
	[Inject]
	public var testVector:Vector.<int>;
	
	[Inject]
	public var testVector2:Vector.<TestVO>;
	
	[Inject]
	public var testViewObject:ViewObject;
	
	override public function init():void {
		trace("RenderProcess.init");
	}
	
	override public function run(timer:int):void {
		//trace("RenderProcess.run > timer : " + timer);
	
		testData.x++;
		
		if (testData.x > 200) {
			testData.x = 0
		}
		
		testViewObject.x = testData.x;
		
	}
	
	override public function dispose():void {
		
	}

}
}