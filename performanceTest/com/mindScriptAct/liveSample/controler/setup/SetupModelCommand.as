package com.mindScriptAct.liveSample.controler.setup {
import com.mindScriptAct.liveSample.constants.FrameTickerId;
import com.mindScriptAct.liveSample.engine.hero.HeroProcess;
import com.mindScriptAct.liveSample.model.hero.HeroProxy;
import com.mindScriptAct.liveSample.model.test.TestProxy;
import flash.geom.Point;
import org.mvcexpress.mvc.Command;

/**
 * Initial set up of maping proxies to proxy class and name for injection.
 * proxyMap.mapClass(proxyClass:Class, injectClass:Class = null, name:String = "");
 * proxyMap.mapObject(proxyObject:Proxy, injectClass:Class = null, name:String = "");
 * @author
 */
public class SetupModelCommand extends Command {
	
	public function execute(blank:Object):void {
		trace( "SetupModelCommand.execute > blank : " + blank);
		
		proxyMap.map(new TestProxy());
		
		var heroPosition:Point = new Point();
		var heroDirection:Point = new Point();
		
		processMap.injectTo(HeroProcess, HeroProcess.NAME, heroPosition, "heroPosition", heroDirection, "heroDirection");
		proxyMap.map(new HeroProxy(heroPosition, heroDirection));
	}

}
}