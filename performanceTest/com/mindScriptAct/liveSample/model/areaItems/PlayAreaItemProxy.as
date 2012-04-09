package com.mindScriptAct.liveSample.model.areaItems {
import com.mindScriptAct.liveSample.constants.MainConfig;
import com.mindScriptAct.liveSample.messages.DataMsg;
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius
 */
public class PlayAreaItemProxy extends Proxy {
	
	private var blobs:Vector.<BlobVO>;
	private var bricks:Vector.<BrickVO>;
	
	public function PlayAreaItemProxy(blobs:Vector.<BlobVO>, bricks:Vector.<BrickVO>) {
		this.blobs = blobs;
		this.bricks = bricks;
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function addBlob(position:Point):void {
		var blobVo:BlobVO = new BlobVO();
		blobVo.position = position;
		blobVo.radius = MainConfig.BLOB_SIZE / 2;
		
		var dirX:int = 6 + Math.random() * 6;
		if (Math.random() < 0.5) {
			dirX *= -1;
		}
		var dirY:int = 6 + Math.random() * 6;
		if (Math.random() < 0.5) {
			dirY *= -1;
		}
		blobVo.direction = new Point(dirX, dirY);
		
		blobVo.damagePoints = 0;
		blobVo.totalLife = MainConfig.BLOB_LIFE;

		blobVo.id = BlobVO.BLOB_COUNT++;
		
		blobs.push(blobVo);
		
		
		sendMessage(DataMsg.ADD_BLOB, blobVo);
	}
	
	public function addBrick(position:Point):void {
		var brickVo:BrickVO = new BrickVO();
		brickVo.position = position;
		brickVo.radius = MainConfig.BRICK_SIZE / 2;
		
		var dirX:int = 3 + Math.random() * 3;
		if (Math.random() < 0.5) {
			dirX *= -1;
		}
		var dirY:int = 3 + Math.random() * 3;
		if (Math.random() < 0.5) {
			dirY *= -1;
		}
		
		brickVo.direction = new Point(dirX, dirY);
		
		bricks.push(brickVo);
		
		sendMessage(DataMsg.ADD_BRICK, position);
	}
	
	public function getBlobCount():int {
		return blobs.length;
	}
	
	public function removeBlob(blobId:int):void {
		for (var i:int = 0; i < blobs.length; i++) {
			if (blobs[i].id == blobId) {
				blobs.splice(i, 1);
				sendMessage(DataMsg.REMOVE_BLOB, blobId);
				break;
			}
		}
	}

}
}