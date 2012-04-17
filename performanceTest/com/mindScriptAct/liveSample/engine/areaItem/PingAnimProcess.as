package com.mindScriptAct.liveSample.engine.areaItem {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.messages.EngineMsg;
import com.mindScriptAct.liveSample.model.areaItems.BlobVO;
import com.mindScriptAct.liveSample.model.areaItems.BrickVO;
import com.mindScriptAct.liveSample.view.playArea.components.Blob;
import com.mindScriptAct.liveSample.view.playArea.components.Brick;
import com.mindScriptAct.liveSample.view.playArea.components.PingCircle;
import flash.geom.Point;
import org.mvcexpress.live.Process;

/**
 * COMMENT
 * @author Raimundas Banevicius
 */
public class PingAnimProcess extends Process {
	static public const NAME:String = "PingAnimProcess";
	
	[Inject(name='increasePings')]
	public var increasePings:Vector.<PingCircle>
	
	[Inject(name='decreasePings')]
	public var decreasePings:Vector.<PingCircle>;
	
	override public function init():void {
		trace("PingAnimProcess.init");
	}
	
	override public function run(timer:int):void {
		//trace("PingAnimProcess.run > timer : " + timer);
		var timePassed:int = timer - lastRunTime;
		var scaleSize:Number = (timePassed / MainConfig.PING_ANIM_SIZEING_SPEED);
		for (var i:int = 0; i < increasePings.length; i++) {
			increasePings[i].scaleX += scaleSize;
			increasePings[i].scaleY += scaleSize;
			if (increasePings[i].scaleX > 1) {
				sendPostMessage(EngineMsg.REMOVE_INCREASE_PING, increasePings[i]);
			}
		}
		for (var j:int = 0; j < decreasePings.length; j++) {
			decreasePings[j].scaleX -= scaleSize;
			decreasePings[j].scaleY -= scaleSize;
			if (decreasePings[j].scaleX < 0) {
				sendPostMessage(EngineMsg.REMOVE_DECREASE_PING, decreasePings[j]);
			}
		}		
		
	}
	
	override public function dispose():void {
	
	}

}
}