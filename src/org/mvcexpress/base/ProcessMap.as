package org.mvcexpress.base {
import flash.geom.Point;
import com.mindScriptAct.liveSample.engine.TickProcess;
import org.mvcexpress.messenger.Messenger;

/**
 * Handles live processes
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class ProcessMap {
	private var messenger:Messenger;
	
	public function ProcessMap(messenger:Messenger) {
		this.messenger = messenger;
	
	}
	
	//----------------------------------
	//     process set up
	//----------------------------------
	
	public function addTimerProcess(processClass:Class, name:String = ""):void {
		trace("ProcessMap.addTimerProcess > processClass : " + processClass + ", name : " + name);
	
	}
	
	public function addFrameProcess(processClass:Class, name:String = ""):void {
		trace("ProcessMap.addFrameProcess > processClass : " + processClass + ", name : " + name);
	
	}
	
	public function removeProcess(processClass:Class, name:String = ""):void {
		trace("ProcessMap.removeProcess > processClass : " + processClass + ", name : " + name);
	
	}
	
	public function hasProcess(processClass:Class, name:String = ""):Boolean {
		trace("ProcessMap.hasProcess > processClass : " + processClass + ", name : " + name);
		
		return false;
	}
	
	// TODO : function to trace current processes. (experimantal)
	public function printProcesses():void {
	
	}
	
	public function injectTo(processClass:Class, name:String = "", ... injects:Array):void {
		trace("ProcessMap.injectTo > processClass : " + processClass + ", name : " + name + ", injects : " + injects);
	
	}
	
	//----------------------------------
	//    timer funcions 
	//----------------------------------
	
	public function startTimer():void {
	
	}
	
	public function stopTimer():void {
	
	}
	
	public function goToTimer():void {
	
	}
	
	public function reverseTimer():void {
	
	}
	
	//----------------------------------
	//    enter frame funcions 
	//----------------------------------	
	
	public function startEnterFrame():void {
	
	}
	
	public function stopEnterFrame():void {
	
	}

}
}