package com.mindScriptAct.liveSample.view.playArea {
import com.mindScriptAct.liveSample.constants.FrameTickerId;
//import com.mindScriptAct.liveSample.engine.areaItem.BlobItemProcess;
//import com.mindScriptAct.liveSample.engine.areaItem.BrickItemProcess;
//import com.mindScriptAct.liveSample.engine.areaItem.PingAnimProcess;
//import com.mindScriptAct.liveSample.engine.hero.HeroProcess;
//import com.mindScriptAct.liveSample.engine.itemSpanwer.ItemSpawnProcess;
import com.mindScriptAct.liveSample.messages.DataMsg;
import com.mindScriptAct.liveSample.messages.EngineMsg;
import com.mindScriptAct.liveSample.messages.Msg;
import com.mindScriptAct.liveSample.messages.ViewMsg;
import com.mindScriptAct.liveSample.model.areaItems.BlobVO;
import com.mindScriptAct.liveSample.model.areaItems.PlayAreaItemProxy;
import com.mindScriptAct.liveSample.view.hero.Hero;
import com.mindScriptAct.liveSample.view.playArea.components.Blob;
import com.mindScriptAct.liveSample.view.playArea.components.Brick;
import com.mindScriptAct.liveSample.view.playArea.components.CrossMark;
import com.mindScriptAct.liveSample.view.playArea.components.PingCircle;
import flash.events.MouseEvent;
import flash.geom.Point;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class PlayAreaMediator extends Mediator {
	private var hero:Hero;
	
	[Inject]
	public var view:PlayArea;
	
	private var blobs:Vector.<Blob>;
	
	private var bricks:Vector.<Brick>;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	private var cross:CrossMark;
	private var increasePings:Vector.<PingCircle>;
	private var decreasePings:Vector.<PingCircle>;
	private var idlePings:Vector.<PingCircle>;
	
	override public function onRegister():void {
		hero = new Hero();
		
		mediatorMap.mediate(hero);
		//processMap.injectTo(HeroProcess, HeroProcess.NAME, hero);
		//processMap.injectTo(ItemSpawnProcess, ItemSpawnProcess.NAME, hero);
		
		cross = new CrossMark();
		view.addChild(cross);
		
		blobs = new Vector.<Blob>();
		//processMap.injectTo(BlobItemProcess, BlobItemProcess.NAME, blobs);
		
		bricks = new Vector.<Brick>();
		//processMap.injectTo(BrickItemProcess, BrickItemProcess.NAME, bricks);
		
		increasePings = new Vector.<PingCircle>();
		//processMap.injectTo(PingAnimProcess, PingAnimProcess.NAME, increasePings, "increasePings");
		
		decreasePings = new Vector.<PingCircle>();
		//processMap.injectTo(PingAnimProcess, PingAnimProcess.NAME, decreasePings, "decreasePings");
		
		idlePings = new Vector.<PingCircle>();
		
		addHandler(EngineMsg.BORDER_HIT, handleBorderHit);
		addHandler(DataMsg.ADD_BLOB, handleAddBlob);
		addHandler(DataMsg.REMOVE_BLOB, handleRemoveBlob);
		addHandler(DataMsg.ADD_BRICK, handleAddBrick);
		
		addHandler(EngineMsg.REMOVE_DECREASE_PING, handleDecreosePingRemove);
		addHandler(EngineMsg.REMOVE_INCREASE_PING, handleIncreasePingRemove);
		
		view.addEventListener(MouseEvent.CLICK, handlePlayAreaClick);
		
		addHandler(Msg.ADD_HERO, handleAddHero);
	}
	
	public function handleIncreasePingRemove(ping:PingCircle):void {
		for (var i:int = 0; i < increasePings.length; i++) {
			if (increasePings[i] == ping) {
				increasePings.splice(i, 1);
				view.removeChild(ping);
				idlePings.push(ping);
				break;
			}
		}
	}
	
	private function handleDecreosePingRemove(ping:PingCircle):void {
		for (var i:int = 0; i < decreasePings.length; i++) {
			if (decreasePings[i] == ping) {
				decreasePings.splice(i, 1);
				view.removeChild(ping);
				idlePings.push(ping);
				break;
			}
		}
	}
	
	public function handleRemoveBlob(blobId:int):void {
		for (var i:int = 0; i < blobs.length; i++) {
			if (blobs[i].id == blobId) {
				
				//
				var increasePing:PingCircle = getPing();
				increasePing.setColor(1, 0, 0);
				increasePing.x = blobs[i].x;
				increasePing.y = blobs[i].y;
				increasePing.scaleX = 0;
				increasePing.scaleY = 0;
				increasePings.push(increasePing);
				view.addChild(increasePing);
				//
				view.removeChild(blobs[i]);
				blobs.splice(i, 1);
				break;
			}
		}
	}
	
	private function handleAddHero(blank:Object):void {
		view.addChild(hero);
		removeHandler(Msg.ADD_HERO, handleAddHero);
	}
	
	public function handlePlayAreaClick(event:MouseEvent):void {
		sendMessage(ViewMsg.MAIN_CLICKED, new Point(view.mouseX, view.mouseY));
	}
	
	public function handleBorderHit(hitPoint:Point):void {
		cross.x = hitPoint.x;
		cross.y = hitPoint.y;
	}
	
	public function handleAddBlob(blobVo:BlobVO):void {
		var blob:Blob = new Blob();
		blob.id = blobVo.id;
		blobs.push(blob);
		view.addChild(blob);
		blob.x = blobVo.position.x;
		blob.y = blobVo.position.y;
		//
		var decreasePing:PingCircle = getPing();
		decreasePing.setColor(0, 0, 1);
		decreasePing.x = blobVo.position.x;
		decreasePing.y = blobVo.position.y;
		decreasePing.scaleX = 1;
		decreasePing.scaleY = 1;
		decreasePings.push(decreasePing);
		view.addChild(decreasePing);
	}
	
	private function getPing():PingCircle {
		if (idlePings.length) {
			return idlePings.pop();
		} else {
			return new PingCircle();
		}
	}
	
	public function handleAddBrick(addPoint:Point):void {
		var brick:Brick = new Brick();
		bricks.push(brick);
		view.addChild(brick);
		brick.x = addPoint.x;
		brick.y = addPoint.y;
	}
	
	override public function onRemove():void {
	
	}

}
}