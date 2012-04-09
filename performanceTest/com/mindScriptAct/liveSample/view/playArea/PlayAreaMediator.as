package com.mindScriptAct.liveSample.view.playArea {
import com.mindScriptAct.liveSample.constants.FrameTickerId;
import com.mindScriptAct.liveSample.engine.areaItem.BlobItemProcess;
import com.mindScriptAct.liveSample.engine.areaItem.BrickItemProcess;
import com.mindScriptAct.liveSample.engine.hero.HeroProcess;
import com.mindScriptAct.liveSample.engine.itemSpanwer.ItemSpawnProcess;
import com.mindScriptAct.liveSample.messages.DataMsg;
import com.mindScriptAct.liveSample.messages.EngineMsg;
import com.mindScriptAct.liveSample.messages.Msg;
import com.mindScriptAct.liveSample.messages.ViewMsg;
import com.mindScriptAct.liveSample.model.areaItems.PlayAreaItemProxy;
import com.mindScriptAct.liveSample.view.hero.Hero;
import com.mindScriptAct.liveSample.view.playArea.components.Blob;
import com.mindScriptAct.liveSample.view.playArea.components.Brick;
import com.mindScriptAct.liveSample.view.playArea.components.CrossMark;
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
	
	override public function onRegister():void {
		hero = new Hero();
		
		mediatorMap.mediate(hero);
		processMap.injectTo(HeroProcess, HeroProcess.NAME, hero);
		processMap.injectTo(ItemSpawnProcess, ItemSpawnProcess.NAME, hero);
		
		cross = new CrossMark();
		view.addChild(cross);
		
		blobs = new Vector.<Blob>();
		processMap.injectTo(BlobItemProcess, BlobItemProcess.NAME, blobs);
		
		bricks = new Vector.<Brick>();
		processMap.injectTo(BrickItemProcess, BrickItemProcess.NAME, bricks);
		
		addHandler(EngineMsg.BORDER_HIT, handleBorderHit);
		addHandler(DataMsg.ADD_BLOB, handleAddBlob);
		addHandler(DataMsg.ADD_BRICK, handleAddBrick);
		
		view.addEventListener(MouseEvent.CLICK, handlePlayAreaClick);
		
		addHandler(Msg.ADD_HERO, handleAddHero);
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
	
	public function handleAddBlob(addPoint:Point):void {
		var blob:Blob = new Blob();
		blobs.push(blob);
		view.addChild(blob);
		blob.x = addPoint.x;
		blob.y = addPoint.y;
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