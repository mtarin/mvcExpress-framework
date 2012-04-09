package com.mindScriptAct.liveSample.engine.itemSpanwer {
	import com.mindScriptAct.liveSample.messages.ViewMsg;
	import com.mindScriptAct.liveSample.view.hero.Hero;
	import flash.geom.Point;
	import org.mvcexpress.live.Process;
	
	
/**
 * COMMENT
 * @author Raimundas Banevicius
 */
public class ItemSpawnProcess extends Process {
	static public const NAME:String = "ItemSpawnProcess";
	
	
	[Inject]
	public var hero:Hero;
	
	
	override public function init():void {
		//trace( "ItemSpawnProcess.init" );
	}
	
	override public function run(timer:int):void {
		//trace( "ItemSpawnProcess.run > timer : " + timer );
		sendMessage(ViewMsg.MAIN_CLICKED, new Point(hero.x, hero.y));
	}
	
	override public function dispose():void {
		
	}
	
	
}
}