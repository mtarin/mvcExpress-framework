package com.mindScriptAct.liveSample.view.playArea.components {
	import flash.display.Shape;
	import flash.display.Sprite;
	
	
/**
 * COMMENT
 * @author Raimundas Banevicius
 */
public class Blob extends Shape {
	
	public function Blob() {
		this.graphics.beginFill(0x0000FF);
		this.graphics.drawCircle(0, 0, 5);
		this.graphics.endFill();
	}
	
}
}