package com.mindScriptAct.modularSample.modules.console.view {
import com.mindScriptAct.modularSample.modules.console.Console;
import com.mindScriptAct.modularSample.modules.console.msg.ConsoleDataMsg;
import com.mindScriptAct.modularSample.modules.console.msg.ConsoleViewMsg;
import flash.events.MouseEvent;
import org.mvcexpress.mvc.Mediator;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class ConsoleMediator extends Mediator {
	
	[Inject]
	public var view:Console;
	
	override public function onRegister():void {
		trace("ConsoleMediator.onRegister");
		
		view.init();
		view.inputBtn.addEventListener(MouseEvent.CLICK, handleInputText);
	}
	
	private function handleInputText(event:MouseEvent):void {
		trace("Console.handleTextInput > event : " + event);
		if (view.inputTf.text) {
			
			sendMessage(ConsoleViewMsg.INPUT_MESSAGE, view.inputTf.text);
			
			view.inputTf.text = "";
			
		}
	}
	
	[Handler(message=ConsoleDataMsg.MESSAGE_ADDED)]
	//[Handler(message="messageAdded")]
	public function handleMessageAdded(message:String):void {
		view.outputTf.appendText(message + "\n");
	}

}
}