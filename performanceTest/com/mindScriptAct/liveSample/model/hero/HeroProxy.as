package com.mindScriptAct.liveSample.model.hero {
import com.mindScriptAct.liveSample.messages.DataMsg;
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class HeroProxy extends Proxy{
	
	private var heroPosition:Point = new Point();
	private var heroDirection:Point = new Point();
	
	
	public function HeroProxy(heroPosition:Point, heroDirection:Point){
		this.heroPosition = heroPosition;
		this.heroDirection = heroDirection;
	}
	
	public function moveHero(posX:int, posY:int):void {
		heroPosition.x = posX;
		heroPosition.y = posY;
		sendMessage(DataMsg.HERO_POS_CHANGED, heroPosition);
	}
	
	public function setHeroDirection(dirX:int, dirY:int):void {
		heroDirection.x = dirX;
		heroDirection.y = dirY;
		// ???
	}
	
	override protected function onRegister():void{
	
	}
	
	override protected function onRemove():void{
	
	}

}
}