package com.mindScriptAct.liveSample.view.playArea.components {
import com.mindScriptAct.liveSample.constants.MainConfig;
import flash.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class Brick extends Sprite {
	
	public function Brick() {
		this.graphics.lineStyle(0.1, 0x000000);
		this.graphics.beginFill(0xFFFF00);
		this.graphics.drawRect(-MainConfig.BRICK_SIZE / 2, -MainConfig.BRICK_SIZE / 2, MainConfig.BRICK_SIZE, MainConfig.BRICK_SIZE);
		this.graphics.endFill();
	}

}
}