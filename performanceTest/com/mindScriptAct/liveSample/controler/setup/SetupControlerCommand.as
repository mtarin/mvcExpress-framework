package com.mindScriptAct.liveSample.controler.setup {
import com.mindScriptAct.liveSample.controler.playArea.HandleMainClickCommand;
import com.mindScriptAct.liveSample.controler.playArea.RemoveBlobCommand;
import com.mindScriptAct.liveSample.controler.test.TestCommand;
import com.mindScriptAct.liveSample.messages.EngineMsg;
import com.mindScriptAct.liveSample.messages.Msg;
import com.mindScriptAct.liveSample.messages.ViewMsg;
import org.mvcexpress.mvc.Command;

/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author
 */
public class SetupControlerCommand extends Command {
	
	public function execute(blank:Object):void {
		trace("SetupControlerCommand.execute > blank : " + blank);
		
		// map a command to message string.
		// command class will be executed then messange with that string is sent.
		commandMap.map(Msg.TEST, TestCommand);
		commandMap.map(ViewMsg.MAIN_CLICKED, HandleMainClickCommand);
		
		commandMap.map(EngineMsg.DESTROY_BLOB, RemoveBlobCommand);
	}

}
}