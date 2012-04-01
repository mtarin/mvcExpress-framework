package com.mindScriptAct.liveSample.view.playArea.components {
	import flash.display.Sprite;
	
/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class Brick extends Sprite{
	
	public function Brick() {
		this.graphics.lineStyle(0.1, 0x000000);
		this.graphics.beginFill(0xFF00FF);
		this.graphics.drawRect(-50, -50, 100, 100);
		this.graphics.endFill();
	}
	
}
}