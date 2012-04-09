// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.live {
import com.adobe.ac.util.service.ILocalConnection;
import flash.utils.Dictionary;
import org.mvcexpress.namespace.pureLegsCore;
import org.mvcexpress.messenger.Messenger;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class Process {
	
	static pureLegsCore var canConstruct:Boolean;
	
	/** @private */
	pureLegsCore var messanger:Messenger;
	
	pureLegsCore var isRunning:Boolean = false;
	
	pureLegsCore var isInited:Boolean = false;
	
	pureLegsCore var injects:Dictionary = new Dictionary();
	
	pureLegsCore var injectCount:int = 0;
	
	pureLegsCore var postMessageTypes:Vector.<String> = new Vector.<String>();
	pureLegsCore var postMessageParams:Vector.<Object> = new Vector.<Object>();
	
	public var lastRunTime:int = 0;
	
	public function Process() {
		use namespace pureLegsCore
		if (!Process.canConstruct) {
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
	
	/**
	 * Sends a message with optional params object.
	 * @param	type	type of the message for Commands and handle function to react to.
	 * @param	params	Object that will be passed to Command execute() function and to handle functions.
	 */
	protected function sendMessage(type:String, params:Object = null):void {
		use namespace pureLegsCore;
		messanger.send(type, params);
	}
	
	protected function sendPostMessage(type:String, params:Object = null):void {
		use namespace pureLegsCore;
		postMessageTypes.push(type);
		postMessageParams.push(params);
	}
	
	pureLegsCore function postSend():void {
		use namespace pureLegsCore;
		while (postMessageTypes.length) {
			messanger.send(postMessageTypes.pop(), postMessageParams.pop());
		}
	}

}
}