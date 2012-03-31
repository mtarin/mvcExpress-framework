package com.mindScriptAct.liveSample.model.areaItems{
import com.mindScriptAct.liveSample.messages.DataMsg;
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius
 */
public class PlayAreaItemProxy extends Proxy {
	
	private var blobs:Vector.<BlobVO>;
	
	
	public function PlayAreaItemProxy(blobs:Vector.<BlobVO>) {
		this.blobs = blobs;
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function addBlob(blobLocation:Point):void {
		var blob:BlobVO = new BlobVO();
		blob.position = blobLocation;
		
		var dirX:int = 5 + Math.random() * 5;
		if (Math.random() < 0.5) {
			dirX *= -1;
		}
		var dirY:int = 5 + Math.random() * 5;
		if (Math.random() < 0.5) {
			dirY *= -1;
		}
		blob.direction = new Point(dirX, dirY);
		
		blobs.push(blob);
		
		sendMessage(DataMsg.ADD_BLOB, blobLocation);
	}
	
	
	public function getBlobCount():int {
		return blobs.length;
	}

}
}