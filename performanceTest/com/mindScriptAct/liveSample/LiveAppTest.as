package com.mindScriptAct.liveSample {
import flash.display.Sprite;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.StatusEvent;
import utils.debug.Stats;

/**
 */

public class LiveAppTest extends Sprite {
	
	private var module:LiveAppModule
	
	public function LiveAppTest():void {
		this.stage.scaleMode = StageScaleMode.NO_SCALE;
		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	private function init(event:Event = null):void {
		trace("Main.init > event : " + event);
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// entry point
		module = new LiveAppModule();
		module.start(this);
		
		
		this.addChild(new Stats(1000));
	}
}
}