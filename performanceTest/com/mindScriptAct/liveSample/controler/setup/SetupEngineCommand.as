package com.mindScriptAct.liveSample.controler.setup {
import com.bit101.components.Accordion;
import com.mindScriptAct.liveSample.engine.RenderProcess;
import com.mindScriptAct.liveSample.engine.TestVO;
import com.mindScriptAct.liveSample.engine.TickProcess;
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
		
		var testVector:Vector.<int> = new Vector.<int>();
		testVector.push(1);
		testVector.push(2);
		testVector.push(3);
		testVector.push(4);
		testVector.push(5);
		
		processMap.injectTo(RenderProcess, RenderProcess.NAME, testVector);
		
		var testVector2:Vector.<TestVO> = new Vector.<TestVO>();
		testVector2.push(new TestVO());
		
		processMap.injectTo(RenderProcess, RenderProcess.NAME, testVector2);
		
		//processMap.addTimerProcess(TickProcess);
		
		processMap.addFrameProcess(RenderProcess, RenderProcess.NAME);
	
		//trace(processMap.hasProcess(RenderProcess));
	
		//processMap.removeProcess(RenderProcess);
	
		
		
		
	}

}
}