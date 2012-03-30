package com.mindScriptAct.liveSample.controler.setup {
import com.bit101.components.Accordion;
import com.mindScriptAct.liveSample.constants.FrameTickerId;
import com.mindScriptAct.liveSample.engine.areaItem.AreaItemProcess;
import com.mindScriptAct.liveSample.engine.hero.HeroProcess;
import com.mindScriptAct.liveSample.engine.test.TestProcess;
import com.mindScriptAct.liveSample.engine.test.TestVO;

import flash.geom.Point;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class SetupEngineCommand extends Command {
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	public function execute(blank:Object):void {
		trace("SetupEngineCommand.execute > blank : " + blank);
		
		/*
		var testVector:Vector.<int> = new Vector.<int>();
		testVector.push(1);
		testVector.push(2);
		testVector.push(3);
		testVector.push(4);
		testVector.push(5);
		
		processMap.injectTo(FrameTickerId.RENDER, TestProcess, TestProcess.NAME, testVector);
		
		var testVector2:Vector.<TestVO> = new Vector.<TestVO>();
		testVector2.push(new TestVO());
		
		processMap.injectTo(FrameTickerId.RENDER, TestProcess, TestProcess.NAME, testVector2);
		
		//processMap.addTimerProcess(TickProcess);
		
		processMap.addFrameProcess(FrameTickerId.RENDER, TestProcess, TestProcess.NAME);
		
		//trace(processMap.hasProcess(TestProcess`));
		
		//processMap.removeProcess(TestProcess`);
		
		//*/
		
		processMap.addFrameProcess(FrameTickerId.RENDER, HeroProcess, HeroProcess.NAME);
		processMap.addFrameProcess(FrameTickerId.RENDER, AreaItemProcess, AreaItemProcess.NAME);
	
	}

}
}