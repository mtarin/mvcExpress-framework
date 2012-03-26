package com.mindScriptAct.liveSample.controler.setup {
import com.mindScriptAct.liveSample.LiveAppTest;
import com.mindScriptAct.liveSample.view.hero.Hero;
import com.mindScriptAct.liveSample.view.hero.HeroMediator;
import com.mindScriptAct.liveSample.view.main.LiveAppMediator;
import com.mindScriptAct.liveSample.view.playArea.PlayArea;
import com.mindScriptAct.liveSample.view.playArea.PlayAreaMediator;
import org.mvcexpress.mvc.Command;

/**
 * Initial set up of maping mediator class to view class.
 * mediatorMap.map(viewClass:Class, mediatorClass:Class);
 * @author
 */
public class SetupViewCommand extends Command {
	
	public function execute(blank:Object):void {
		trace("SetupViewCommand.execute > blank : " + blank);
		
		// Will map mediator class to view class.
		// Mediator(MainMediator) will be automaticaly created every time you will try to mediatorMap.mediate() viewObject of mapped class(Main).
		
		mediatorMap.map(LiveAppTest, LiveAppMediator);
		mediatorMap.map(PlayArea, PlayAreaMediator);
		mediatorMap.map(Hero, HeroMediator);
	}

}
}