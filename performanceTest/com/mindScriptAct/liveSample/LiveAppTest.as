package com.mindScriptAct.liveSample {
import flash.display.Sprite;
import flash.events.Event;

/**
 */

public class LiveAppTest extends Sprite {
	
	private var module:LiveAppModule
	
	public function LiveAppTest():void {
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
	}
}
}