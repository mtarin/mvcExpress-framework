package com.mindScriptAct.liveSample.view.main {
	import flash.display.Shape;
	import flash.display.Sprite;
	
	
/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class ViewObject extends Sprite {
	
	public function ViewObject() {
		
		
		var rectangle:Shape = new Shape();
		rectangle.graphics.lineStyle(0.1, 0xFF0000);
		rectangle.graphics.beginFill(0x0000FF);
		rectangle.graphics.drawRect(0, 0, 100, 100);
		rectangle.graphics.endFill();
		this.addChild(rectangle);
	}
	
}
}