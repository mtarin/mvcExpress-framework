package com.mindScriptAct.liveSample.view.output {
import flash.display.Sprite;
import flash.text.TextField;
	
/**
 * COMMENT
 * @author Object
 */
public class OutputContainer extends Sprite {
	
	public var outputTF:TextField;
	
	public function OutputContainer() {
		outputTF = new TextField();
		this.addChild(outputTF);
		outputTF.text = '...';
		outputTF.border = true;
		outputTF.width = 150;
		outputTF.height = 400;
	}
	
}
}