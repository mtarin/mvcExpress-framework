package com.mindScriptAct.liveSample.view.playArea.components {
import flash.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class PingCircle extends Sprite {
	
	public function PingCircle() {
	
	}
	
	public function setColor(redPerc:Number, greenPerc:Number, bluePerc:Number):void {
		this.graphics.clear();
		var color:uint = 0xFF * redPerc << 16 | 0xFF * greenPerc << 8 | 0xFF * bluePerc;
		this.graphics.lineStyle(5, color);
		this.graphics.drawCircle(0, 0, 100);
	}

}
}