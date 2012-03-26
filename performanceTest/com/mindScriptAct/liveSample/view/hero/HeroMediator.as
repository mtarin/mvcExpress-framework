package com.mindScriptAct.liveSample.view.hero {
import com.mindScriptAct.liveSample.messages.DataMsg;
import flash.geom.Point;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class HeroMediator extends Mediator {
	
	[Inject]
	public var view:Hero;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		addHandler(DataMsg.HERO_POS_CHANGED, handleHeroPosition);
	}
	
	private function handleHeroPosition(position:Point):void {
		view.x = position.x;
		view.y = position.y;
	}
	
	override public function onRemove():void {
	
	}

}
}