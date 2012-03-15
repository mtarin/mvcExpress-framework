package org.mvcexpress.live {
import org.mvcexpress.namespace.pureLegsCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class Process {
	
	static pureLegsCore var canConstruct:Boolean;
	
	pureLegsCore var injects:Array = [];
	
	public function Process() {
		use namespace pureLegsCore
		if (!Process.canConstruct) {
			throw Error("Processes can be constructed only by framework. (it is constructed automaticaly then needed.) Use processMap functions to manage your processes.");
		}
	}
	
	pureLegsCore function appendInjects(newInjects:Array):void {
		use namespace pureLegsCore;
		for (var i:int = 0; i < newInjects.length; i++) {
			this.injects.push(newInjects[i]);
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