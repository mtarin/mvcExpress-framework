package com.mindScriptAct.liveSample {
import com.mindScriptAct.liveSample.controler.hero.InitHeroCommand;
import com.mindScriptAct.liveSample.controler.setup.SetupControlerCommand;
import com.mindScriptAct.liveSample.controler.setup.SetupEngineCommand;
import com.mindScriptAct.liveSample.controler.setup.SetupModelCommand;
import com.mindScriptAct.liveSample.controler.setup.SetupViewCommand;
import com.mindScriptAct.liveSample.messages.DataMsg;
import com.mindScriptAct.liveSample.messages.Msg;
import com.mindScriptAct.liveSample.messages.ViewMsg;
import flash.geom.Point;
import org.mvcexpress.core.ModuleCore;
import org.mvcexpress.utils.checkClassStringConstants;

/**
 * Main application module.
 * Sets up application and starts it.
 */
public class LiveAppModule extends ModuleCore {
	
	override protected function onInit():void {
		//trace("MainModule.onInit");
		
		// little utility to prevent accidental message constant dublications.
		CONFIG::debug {
			checkClassStringConstants(Msg, DataMsg, ViewMsg);
		}
		
		// map commands (you can map them here.. or move it to command.)
		commandMap.execute(SetupControlerCommand);
		//
		// map proxies (and services)(you can map them here.. or move it to command.)
		commandMap.execute(SetupModelCommand);
		//
		// map mediators(you can map them here.. or move it to command.)
		commandMap.execute(SetupViewCommand);
		
		commandMap.execute(SetupEngineCommand)
		
	}
	
	public function start(main:LiveAppTest):void {
		//trace("MainModule.start > main : " + LiveAppTest);
		
		// mediate main view.
		mediatorMap.mediate(main);
		
		// send a message for execution test.
		// messages can be sent from models, commands, proxies and mediators.
		// messages can execute commands, and be handled by mediators.
		// params object is optional.
		//sendMessage(Msg.TEST, new Point(1, 5));
		
		trace("Hello mvcExpress!!!");
		
		commandMap.execute(InitHeroCommand);
		
		
		processMap.startEnterFrame();
	}

}
}