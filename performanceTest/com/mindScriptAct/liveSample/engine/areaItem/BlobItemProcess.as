package com.mindScriptAct.liveSample.engine.areaItem {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.model.areaItems.BlobVO;
import com.mindScriptAct.liveSample.model.areaItems.BrickVO;
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
	public var bricksData:Vector.<BrickVO>
	
	[Inject]
	public var blobsData:Vector.<BlobVO>
	
	[Inject]
	public var blobsView:Vector.<Blob>;
	
	//[Inject]
	//public var blobVoList:BlobVoList;
	
	override public function init():void {
		trace("AreaItemProcess.init");
	}
	
	override public function run(timer:int):void {
		//trace("HeroProcess.run > timer : " + timer +"   "+ (lastRunTime-timer));
		
		for (var i:int = 0; i < blobsData.length; i++) {
			
			var blobVo:BlobVO = blobsData[i];
			
			// move
			blobVo.position.x += blobVo.direction.x;
			blobVo.position.y += blobVo.direction.y;
			
			// check screen boundaries..
			if (blobVo.position.x < 0) {
				blobVo.position.x = -blobVo.position.x;
				blobVo.direction.x *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(0, blobVo.position.y));
			}
			if (blobVo.position.x > MainConfig.PLAY_AREA_WIDTH) {
				var xOver:int = blobVo.position.x - MainConfig.PLAY_AREA_WIDTH;
				blobVo.position.x = MainConfig.PLAY_AREA_WIDTH - xOver;
				blobVo.direction.x *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(MainConfig.PLAY_AREA_WIDTH, blobVo.position.y));
			}
			if (blobVo.position.y < 0) {
				blobVo.position.y = -blobVo.position.y;
				blobVo.direction.y *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(blobVo.position.x, 0));
			}
			if (blobVo.position.y > MainConfig.PLAY_AREA_HEIGHT) {
				var yOver:int = blobVo.position.y - MainConfig.PLAY_AREA_HEIGHT;
				blobVo.position.y = MainConfig.PLAY_AREA_HEIGHT - yOver;
				blobVo.direction.y *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(blobVo.position.x, MainConfig.PLAY_AREA_HEIGHT));
			}
			
			// check collision detection
			
			for (var j:int = 0; j < bricksData.length; j++) {
				var nextBrickVo:BrickVO = bricksData[j];
				
				var left1:int = blobVo.position.x - blobVo.radius;
				var left2:int = nextBrickVo.position.x - nextBrickVo.radius;
				var right1:int = blobVo.position.x + blobVo.radius;
				var right2:int = nextBrickVo.position.x + nextBrickVo.radius;
				var top1:int = blobVo.position.y - blobVo.radius;
				var top2:int = nextBrickVo.position.y - nextBrickVo.radius;
				var bottom1:int = blobVo.position.y + blobVo.radius;
				var bottom2:int = nextBrickVo.position.y + nextBrickVo.radius;
				
				var difX:int = blobVo.position.x - nextBrickVo.position.x;
				var difY:int = blobVo.position.y - nextBrickVo.position.y;
				
				if (bottom1 > top2 && top1 < bottom2 && right1 > left2 && left1 < right2) {
					// hit
					
					if (difX * difX > difY * difY) {
						if (blobVo.position.x < nextBrickVo.position.x) {
							if (right1 > left2) {
								if (blobVo.direction.x > 0) {
									blobVo.direction.x *= -1;
								}
								//if (nextBrickVo.direction.x < 0) {
									//nextBrickVo.direction.x *= -1;
								//}
							}
						} else {
							if (left1 < right2) {
								if (blobVo.direction.x < 0) {
									blobVo.direction.x *= -1;
								}
								//if (nextBrickVo.direction.x > 0) {
									//nextBrickVo.direction.x *= -1;
								//}
							}
						}
					} else {
						if (blobVo.position.y < nextBrickVo.position.y) {
							if (bottom1 > top2) {
								if (blobVo.direction.y > 0) {
									blobVo.direction.y *= -1;
								}
								//if (nextBrickVo.direction.y < 0) {
									//nextBrickVo.direction.y *= -1;
								//}
							}
						} else {
							if (top1 < bottom2) {
								if (blobVo.direction.y < 0) {
									blobVo.direction.y *= -1;
								}
								//if (nextBrickVo.direction.y > 0) {
									//nextBrickVo.direction.y *= -1;
								//}
							}
						}
					}
				}
			}
			
			// render
			blobsView[i].x = blobVo.position.x;
			blobsView[i].y = blobVo.position.y;
			
		}
	}
	
	override public function dispose():void {
	
	}

}
}