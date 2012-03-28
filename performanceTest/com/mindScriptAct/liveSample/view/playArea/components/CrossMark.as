package com.mindScriptAct.liveSample.view.playArea.components {
	import flash.display.Shape;
	
	
/**
 * COMMENT
 * @author Object
 */
public class CrossMark extends Shape {
	
	public function CrossMark() {
		this.graphics.lineStyle(5, 0x008000);
		this.graphics.moveTo( -10, -10);
		this.graphics.lineTo( 10, 10);
		this.graphics.moveTo( 10, -10);
		this.graphics.lineTo( -10, 10);		
	}
	
}
}