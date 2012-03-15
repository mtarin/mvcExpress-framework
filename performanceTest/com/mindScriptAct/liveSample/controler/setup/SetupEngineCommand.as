package com.mindScriptAct.liveSample.controler.setup {
import com.bit101.components.Accordion;
import com.mindScriptAct.liveSample.engine.RenderProcess;
import com.mindScriptAct.liveSample.engine.TickProcess;
import flash.geom.Point;
import org.mvcexpress.mvc.Command;
	
/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class SetupEngineCommand extends Command{
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	public function execute(blank:Object):void{
		
		var testData:Point = new Point(12, 20);
		
		
		processMap.injectTo(RenderProcess, RenderProcess.NAME, testData);
		 
		
		
		
		
		
		
		
		
		
		//processMap.addTimerProcess(TickProcess);
		
		processMap.addFrameProcess(RenderProcess);
		
		//trace(processMap.hasProcess(RenderProcess));
		
		//processMap.removeProcess(RenderProcess);
		
		
		
	}
	
}
}