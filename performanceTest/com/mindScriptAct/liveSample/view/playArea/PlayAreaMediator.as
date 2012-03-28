package com.mindScriptAct.liveSample.view.playArea {
import com.mindScriptAct.liveSample.constants.FrameTickerId;
import com.mindScriptAct.liveSample.engine.hero.HeroProcess;
import com.mindScriptAct.liveSample.messages.DataMsg;
import com.mindScriptAct.liveSample.view.hero.Hero;
import flash.geom.Point;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class PlayAreaMediator extends Mediator {
	private var hero:Hero;
	
	[Inject]
	public var view:PlayArea;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		hero = new Hero();
		view.addChild(hero);
		mediatorMap.mediate(hero);
		processMap.injectTo(HeroProcess, HeroProcess.NAME, hero);

		
		
	}

	
	override public function onRemove():void {
	
	}

}
}