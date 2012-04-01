package com.mindScriptAct.liveSample.engine.areaItem {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.model.areaItems.BlobVO;
import com.mindScriptAct.liveSample.view.playArea.components.Blob;
import flash.geom.Point;
import org.mvcexpress.live.Process;
	
	
/**
 * COMMENT
 * @author Raimundas Banevicius
 */
public class BlobItemProcess extends Process {
	static public const NAME:String = "BlobItemProcess";
	
	
	[Inject]
	public var blobsData:Vector.<BlobVO>
	
	[Inject]
	public var blobsView:Vector.<Blob>;
	
	
	//[Inject]
	//public var blobVoList:BlobVoList;
	
	override public function init():void {
		trace( "AreaItemProcess.init" );
	}
	
	override public function run(timer:int):void {
		//trace("HeroProcess.run > timer : " + timer +"   "+ (lastRunTime-timer));
		
		for (var i:int = 0; i < blobsData.length; i++) {
			
			// move
			blobsData[i].position.x += blobsData[i].direction.x;
			blobsData[i].position.y += blobsData[i].direction.y;
			
			
			
			// check screen boundaries..
			if (blobsData[i].position.x < 0) {
				blobsData[i].position.x = -blobsData[i].position.x;
				blobsData[i].direction.x *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(0, blobsData[i].position.y));
			}
			if (blobsData[i].position.x > MainConfig.PLAY_AREA_WIDTH) {
				var xOver:int = blobsData[i].position.x - MainConfig.PLAY_AREA_WIDTH;
				blobsData[i].position.x = MainConfig.PLAY_AREA_WIDTH - xOver;
				blobsData[i].direction.x *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(MainConfig.PLAY_AREA_WIDTH, blobsData[i].position.y));
			}
			if (blobsData[i].position.y < 0) {
				blobsData[i].position.y = -blobsData[i].position.y;
				blobsData[i].direction.y *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(blobsData[i].position.x, 0));
			}
			if (blobsData[i].position.y > MainConfig.PLAY_AREA_HEIGHT) {
				var yOver:int = blobsData[i].position.y - MainConfig.PLAY_AREA_HEIGHT;
				blobsData[i].position.y = MainConfig.PLAY_AREA_HEIGHT - yOver;
				blobsData[i].direction.y *= -1;
				//sendMessage(EngineMsg.BORDER_HIT, new Point(blobsData[i].position.x, MainConfig.PLAY_AREA_HEIGHT));
			}
			
			
			
			// render
			blobsView[i].x = blobsData[i].position.x;
			blobsView[i].y = blobsData[i].position.y;
		
		}
	}
	
	override public function dispose():void {
	
	}
	
	
}
}