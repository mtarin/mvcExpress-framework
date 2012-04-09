package com.mindScriptAct.liveSample.model.hero {
import com.mindScriptAct.liveSample.messages.DataMsg;
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class HeroProxy extends Proxy{
	
	public var size:int;
	private var position:Point = new Point();
	private var direction:Point = new Point();
	
	
	public function HeroProxy(heroPosition:Point, heroDirection:Point){
		this.position = heroPosition;
		this.direction = heroDirection;
	}
	
	public function moveHero(posX:int, posY:int):void {
		position.x = posX;
		position.y = posY;
		sendMessage(DataMsg.HERO_POS_CHANGED, position);
	}
	
	public function setHeroDirection(dirX:int, dirY:int):void {
		direction.x = dirX;
		direction.y = dirY;
		// ???
	}
	
	override protected function onRegister():void{
	
	}
	
	override protected function onRemove():void{
	
	}

}
}