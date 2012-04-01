package com.mindScriptAct.liveSample.engine.areaItem {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.model.areaItems.BlobVO;
import com.mindScriptAct.liveSample.model.areaItems.BrickVO;
import com.mindScriptAct.liveSample.view.playArea.components.Blob;
import com.mindScriptAct.liveSample.view.playArea.components.Brick;
import flash.geom.Point;
import org.mvcexpress.live.Process;
	
	
/**
 * COMMENT
 * @author Raimundas Banevicius
 */
public class BrickItemProcess extends Process {
	static public const NAME:String = "BrickItemProcess";
	
	
	[Inject]
	public var bricksData:Vector.<BrickVO>
	
	[Inject]
	public var bricksView:Vector.<Brick>;
	
	
	//[Inject]
	//public var blobVoList:BlobVoList;

	
	override public function init():void {
		trace( "AreaItemProcess.init" );
	}
	
	override public function run(timer:int):void {
		//trace("HeroProcess.run > timer : " + timer +"   "+ (lastRunTime-timer));
		
		for (var i:int = 0; i < bricksData.length; i++) {
			
			// move
			bricksData[i].position.x += bricksData[i].direction.x;
			bricksData[i].position.y += bricksData[i].direction.y;
			
			
			
			// check screen boundaries..
			if (bricksData[i].position.x < 0) {
				bricksData[i].position.x = -bricksData[i].position.x;
				bricksData[i].direction.x *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(0, blobsData[i].position.y));
			}
			if (bricksData[i].position.x > MainConfig.PLAY_AREA_WIDTH) {
				var xOver:int = bricksData[i].position.x - MainConfig.PLAY_AREA_WIDTH;
				bricksData[i].position.x = MainConfig.PLAY_AREA_WIDTH - xOver;
				bricksData[i].direction.x *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(MainConfig.PLAY_AREA_WIDTH, blobsData[i].position.y));
			}
			if (bricksData[i].position.y < 0) {
				bricksData[i].position.y = -bricksData[i].position.y;
				bricksData[i].direction.y *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(blobsData[i].position.x, 0));
			}
			if (bricksData[i].position.y > MainConfig.PLAY_AREA_HEIGHT) {
				var yOver:int = bricksData[i].position.y - MainConfig.PLAY_AREA_HEIGHT;
				bricksData[i].position.y = MainConfig.PLAY_AREA_HEIGHT - yOver;
				bricksData[i].direction.y *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(blobsData[i].position.x, MainConfig.PLAY_AREA_HEIGHT));
			}
			
			
			
			// render
			bricksView[i].x = bricksData[i].position.x;
			bricksView[i].y = bricksData[i].position.y;
		
		}
	}
	
	override public function dispose():void {
	
	}
	
	
}
}