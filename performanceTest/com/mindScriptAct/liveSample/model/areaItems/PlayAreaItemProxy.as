package com.mindScriptAct.liveSample.model.areaItems {
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
		
		var dirX:int = 5 + Math.random() * 5;
		if (Math.random() < 0.5) {
			dirX *= -1;
		}
		var dirY:int = 5 + Math.random() * 5;
		if (Math.random() < 0.5) {
			dirY *= -1;
		}
		blobVo.direction = new Point(dirX, dirY);
		
		blobs.push(blobVo);
		
		sendMessage(DataMsg.ADD_BLOB, position);
	}
	
	public function addBrick(position:Point):void {
		var brickVo:BrickVO = new BrickVO();
		brickVo.position = position;
		
		var dirX:int = 5 + Math.random() * 5;
		if (Math.random() < 0.5) {
			dirX *= -1;
		}
		var dirY:int = 5 + Math.random() * 5;
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

}
}