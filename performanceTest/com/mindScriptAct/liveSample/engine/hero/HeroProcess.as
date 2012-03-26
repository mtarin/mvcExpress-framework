package com.mindScriptAct.liveSample.engine.hero {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.view.hero.Hero;
import flash.geom.Point;
import org.mvcexpress.live.Process;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class HeroProcess extends Process {
	static public const NAME:String = "HeroProcess";
	
	[Inject(name='heroPosition')]
	public var heroPosition:Point;
	
	[Inject(name='heroDirection')]
	public var heroDirection:Point;
	
	[Inject]
	public var hero:Hero;
	
	override public function init():void {
		trace("HeroProcess.init");
	
	}
	
	override public function run(timer:int):void {
		trace("HeroProcess.run > timer : " + timer);
		
		// move
		heroPosition.x += heroDirection.x;
		heroPosition.y += heroDirection.y;
		
		// check screen boundaries..
		if (heroPosition.x < 0) {
			heroPosition.x = -heroPosition.x;
			heroDirection.x *= -1;
		}
		if (heroPosition.x > MainConfig.PLAY_AREA_WIDTH) {
			var xOver:int = heroPosition.x - MainConfig.PLAY_AREA_WIDTH;
			heroPosition.x = MainConfig.PLAY_AREA_WIDTH - xOver;
			heroDirection.x *= -1;
		}
		if (heroPosition.y < 0) {
			heroPosition.y = -heroPosition.y;
			heroDirection.y *= -1;
		}
		if (heroPosition.y > MainConfig.PLAY_AREA_HEIGHT) {
			var yOver:int = heroPosition.y - MainConfig.PLAY_AREA_HEIGHT;
			heroPosition.y = MainConfig.PLAY_AREA_HEIGHT - yOver;
			heroDirection.y *= -1;
		}
		
		// render
		hero.x = heroPosition.x;
		hero.y = heroPosition.y;
	
	}
	
	override public function dispose():void {
	
	}

}
}