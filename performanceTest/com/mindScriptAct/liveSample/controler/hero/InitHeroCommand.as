package com.mindScriptAct.liveSample.controler.hero {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.model.hero.HeroProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class InitHeroCommand extends Command {
	
	[Inject]
	public var heroProxy:HeroProxy;
	
	public function execute(blank:Object):void {
		
		heroProxy.moveHero(MainConfig.PLAY_AREA_WIDTH / 2, MainConfig.PLAY_AREA_HEIGHT / 2);
		
		var dirX:int = 5 + Math.random() * 5;
		if (Math.random() < 0.5) {
			dirX *= -1;
		}
		var dirY:int = 5 + Math.random() * 5;
		if (Math.random() < 0.5) {
			dirY *= -1;
		}
		heroProxy.setHeroDirection(dirX, dirY);
	
	}

}
}