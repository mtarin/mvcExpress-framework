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
		trace("AreaItemProcess.init");
	}
	
	override public function run(timer:int):void {
		//trace("HeroProcess.run > timer : " + timer +"   "+ (lastRunTime-timer));
		
		for (var k:int = 0; k < bricksView.length; k++) {
			bricksView[k].alpha = 1;
		}
		
		for (var i:int = 0; i < bricksData.length; i++) {
			var brickVo:BrickVO = bricksData[i];
			// move
			brickVo.position.x += brickVo.direction.x;
			brickVo.position.y += brickVo.direction.y;
			
			// check screen boundaries..
			if (brickVo.position.x < brickVo.radius) {
				brickVo.position.x = 2 * brickVo.radius - brickVo.position.x;
				brickVo.direction.x *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(0, blobsData[i].position.y));
			}
			if (brickVo.position.x > MainConfig.PLAY_AREA_WIDTH - brickVo.radius) {
				brickVo.position.x = 2 * (MainConfig.PLAY_AREA_WIDTH - brickVo.radius) - brickVo.position.x;
				brickVo.direction.x *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(MainConfig.PLAY_AREA_WIDTH, blobsData[i].position.y));
			}
			if (brickVo.position.y < brickVo.radius) {
				brickVo.position.y = 2 * brickVo.radius - brickVo.position.y;
				brickVo.direction.y *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(blobsData[i].position.x, 0));
			}
			if (brickVo.position.y > MainConfig.PLAY_AREA_HEIGHT - brickVo.radius) {
				brickVo.position.y = 2 * (MainConfig.PLAY_AREA_HEIGHT - brickVo.radius) - brickVo.position.y;
				brickVo.direction.y *= -1;
					//sendMessage(EngineMsg.BORDER_HIT, new Point(blobsData[i].position.x, MainConfig.PLAY_AREA_HEIGHT));
			}
			
			// check collision detection
			
			for (var j:int = i + 1; j < bricksData.length; j++) {
				var nextBrickVo:BrickVO = bricksData[j];
				
				var left1:int = brickVo.position.x - brickVo.radius;
				var left2:int = nextBrickVo.position.x - nextBrickVo.radius;
				var right1:int = brickVo.position.x + brickVo.radius;
				var right2:int = nextBrickVo.position.x + nextBrickVo.radius;
				var top1:int = brickVo.position.y - brickVo.radius;
				var top2:int = nextBrickVo.position.y - nextBrickVo.radius;
				var bottom1:int = brickVo.position.y + brickVo.radius;
				var bottom2:int = nextBrickVo.position.y + nextBrickVo.radius;
				
				var difX:int = brickVo.position.x - nextBrickVo.position.x;
				var difY:int = brickVo.position.y - nextBrickVo.position.y;
				
				if (bottom1 > top2 && top1 < bottom2 && right1 > left2 && left1 < right2) {
					// hit
					bricksView[i].alpha = 0.5;
					bricksView[j].alpha = 0.5;
					
					if (difX * difX > difY * difY) {
						if (brickVo.position.x < nextBrickVo.position.x) {
							if (right1 > left2) {
								if (brickVo.direction.x > 0) {
									brickVo.direction.x *= -1;
								}
								if (nextBrickVo.direction.x < 0) {
									nextBrickVo.direction.x *= -1;
								}
							}
						} else {
							if (left1 < right2) {
								if (brickVo.direction.x < 0) {
									brickVo.direction.x *= -1;
								}
								if (nextBrickVo.direction.x > 0) {
									nextBrickVo.direction.x *= -1;
								}
							}
						}
					} else {
						if (brickVo.position.y < nextBrickVo.position.y) {
							if (bottom1 > top2) {
								if (brickVo.direction.y > 0) {
									brickVo.direction.y *= -1;
								}
								if (nextBrickVo.direction.y < 0) {
									nextBrickVo.direction.y *= -1;
								}
							}
						} else {
							if (top1 < bottom2) {
								if (brickVo.direction.y < 0) {
									brickVo.direction.y *= -1;
								}
								if (nextBrickVo.direction.y > 0) {
									nextBrickVo.direction.y *= -1;
								}
							}
						}
					}
				}
			}
			
			// render
			bricksView[i].x = brickVo.position.x;
			bricksView[i].y = brickVo.position.y;
			
		}
	}
	
	override public function dispose():void {
	
	}

}
}