package com.mindScriptAct.liveSample.view.playArea {
	import com.mindScriptAct.liveSample.constants.MainConfig;
	import flash.display.Sprite;
	
/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class PlayArea extends Sprite {
	
	public function PlayArea() {
		
		this.graphics.lineStyle(0.1, 0xFF0000);
		this.graphics.beginFill(0xF4F4F4);
		this.graphics.drawRect(0, 0, MainConfig.PLAY_AREA_WIDTH, MainConfig.PLAY_AREA_HEIGHT);
		this.graphics.endFill();
		
	}
	
}
}