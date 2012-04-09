package com.mindScriptAct.liveSample.controler.test {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.messages.Msg;
import com.mindScriptAct.liveSample.model.areaItems.PlayAreaItemProxy;
import com.mindScriptAct.liveSample.model.hero.HeroProxy;
import com.mindScriptAct.liveSample.model.test.TestProxy;
import flash.geom.Point;
import org.mvcexpress.mvc.Command;

/**
 * Test command to show execution.
 */
public class TestCommand extends Command {
	
	[Inject]
	public var playAreaItemProxy:PlayAreaItemProxy;
	
	[Inject]
	public var heroProxy:HeroProxy;
	
	public function execute(testData:Point):void {
		// add bricks..
		
		var quarterWidth:int = MainConfig.PLAY_AREA_WIDTH / 4;
		var quarterHeight:int = MainConfig.PLAY_AREA_HEIGHT / 4;
		
		playAreaItemProxy.addBrick(new Point(quarterWidth * 1, quarterHeight * 1));
		playAreaItemProxy.addBrick(new Point(quarterWidth * 1, quarterHeight * 3));
		playAreaItemProxy.addBrick(new Point(quarterWidth * 3, quarterHeight * 1));
		playAreaItemProxy.addBrick(new Point(quarterWidth * 3, quarterHeight * 3));
		
		
		//playAreaItemProxy.addBrick(new Point(300, 300));		
		//playAreaItemProxy.addBrick(new Point(500, 400));
		//playAreaItemProxy.addBrick(new Point(500, 550));

		
		// hero
		heroProxy.moveHero(MainConfig.PLAY_AREA_WIDTH / 2, MainConfig.PLAY_AREA_HEIGHT / 2);
		
		var dirX:int = 10 + Math.random() * 10;
		if (Math.random() < 0.5) {
			dirX *= -1;
		}
		var dirY:int = 10 + Math.random() * 10;
		if (Math.random() < 0.5) {
			dirY *= -1;
		}
		heroProxy.setHeroDirection(dirX, dirY);
		
		sendMessage(Msg.ADD_HERO);
	}

}
}