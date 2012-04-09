package com.mindScriptAct.liveSample.view.playArea.components {
import com.mindScriptAct.liveSample.constants.MainConfig;
import flash.display.Shape;
import flash.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius
 */
public class Blob extends Shape {
	public var id:int;
	
	public function Blob() {
		
		setColor(0, 0, 1);
	}
	
	public function setColor(redPerc:Number, greenPerc:Number, bluePerc:Number):void {
		this.graphics.clear();
		var color:uint = 0xFF * redPerc << 16 | 0xFF * greenPerc << 8 | 0xFF * bluePerc;
		this.graphics.beginFill(color);
		this.graphics.drawCircle(0, 0, MainConfig.BLOB_SIZE / 2);
		this.graphics.endFill();
	}

}
}