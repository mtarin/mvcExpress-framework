package com.mindScriptAct.liveSample.view.main {
import com.mindScriptAct.liveSample.constants.FrameTickerId;
//import com.mindScriptAct.liveSample.engine.test.TestProcess;
import com.mindScriptAct.liveSample.LiveAppTest;
import com.mindScriptAct.liveSample.view.output.OutputContainer;
import com.mindScriptAct.liveSample.view.playArea.PlayArea;
import com.mindScriptAct.liveSample.view.test.ViewObject;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class MainMediator extends Mediator {
	
	[Inject]
	public var view:LiveAppTest;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	public var outputContainer:OutputContainer;
	
	override public function onRegister():void {
		var playScreen:PlayArea = new PlayArea();
		view.addChild(playScreen);
		mediatorMap.mediate(playScreen);
		playScreen.x = 180;
		playScreen.y = 120;
		
		//var testObj:ViewObject = new ViewObject();
		//processMap.injectTo(FrameTickerId.RENDER, TestProcess, TestProcess.NAME, testObj);
		//view.addChild(testObj);
		
		outputContainer = new OutputContainer();
		view.addChild(outputContainer);
		mediatorMap.mediate(outputContainer);
		outputContainer.y = 110;
		
	}
	
	override public function onRemove():void {
	
	}

}
}