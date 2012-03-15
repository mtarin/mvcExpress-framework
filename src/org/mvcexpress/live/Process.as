package org.mvcexpress.live {
import org.mvcexpress.namespace.pureLegsCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class Process {
	
	pureLegsCore var canConstruct:Boolean;
	
	public function Process() {
		
		if (!pureLegsCore::canConstruct) {
			throw Error("Processes can be constructed only by framework. (it is constructed automaticaly then needed.) Use processMap functions to manage your processes.");
		}
	}
	
	// start process
	public function init():void {
		// override to start process
	}
	
	public function run(timer:int):void {
		// override to run process on timer tick/frame render.
	}
	
	public function dispose():void {
		// override to dispose your process.
	}
	
	protected function addProcess():void {
		// TODO : add child process... (experimental..) 
	}
	
	// TODO : add messsage to send stack. Messages will be send then process will finish running. (experimental)
	protected function addMessageSender():void {
	
	}

}
}