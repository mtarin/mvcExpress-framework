package com.mindScriptAct.liveSample.view.playArea {
import com.mindScriptAct.liveSample.constants.FrameTickerId;
import com.mindScriptAct.liveSample.engine.hero.HeroProcess;
import com.mindScriptAct.liveSample.messages.DataMsg;
import com.mindScriptAct.liveSample.messages.EngineMsg;
import com.mindScriptAct.liveSample.view.hero.Hero;
import com.mindScriptAct.liveSample.view.playArea.components.CrossMark;
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
	
	private var cross:CrossMark;
	
	override public function onRegister():void {
		hero = new Hero();
		view.addChild(hero);
		mediatorMap.mediate(hero);
		processMap.injectTo(HeroProcess, HeroProcess.NAME, hero);
		
		cross = new CrossMark();
		view.addChild(cross);
		
		addHandler(EngineMsg.BORDER_HIT, handleBorderHit);
	}

	public function handleBorderHit(hitPoint:Point):void {
		cross.x = hitPoint.x;
		cross.y = hitPoint.y;
	}
	
	
	override public function onRemove():void {
	
	}

}
}