package com.mindScriptAct.liveSample.view.main {
import com.mindScriptAct.liveSample.engine.test.TestProcess;
import com.mindScriptAct.liveSample.LiveAppTest;
import com.mindScriptAct.liveSample.view.playArea.PlayArea;
import com.mindScriptAct.liveSample.view.test.ViewObject;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class LiveAppMediator extends Mediator {
	
	[Inject]
	public var view:LiveAppTest;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		var playScreen:PlayArea = new PlayArea();
		view.addChild(playScreen);
		mediatorMap.mediate(playScreen);
		playScreen.x = 50;
		playScreen.y = 50;
		
		var testObj:ViewObject = new ViewObject();
		processMap.injectTo(TestProcess, TestProcess.NAME, testObj);
		view.addChild(testObj);
	}
	
	override public function onRemove():void {
	
	}

}
}