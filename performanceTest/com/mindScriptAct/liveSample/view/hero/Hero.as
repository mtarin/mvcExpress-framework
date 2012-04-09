package com.mindScriptAct.liveSample.view.hero {
import flash.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class Hero extends Sprite {
	
	public function Hero() {
		
		this.graphics.lineStyle(0.1, 0xFF0000);
		this.graphics.beginFill(0x00FF00);
		this.graphics.drawCircle(0, 0, 20);
		this.graphics.endFill();
	}

}
}