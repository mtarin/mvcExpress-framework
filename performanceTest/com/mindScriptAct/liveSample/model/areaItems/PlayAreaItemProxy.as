package com.mindScriptAct.liveSample.model.areaItems{
import com.mindScriptAct.liveSample.messages.DataMsg;
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius
 */
public class PlayAreaItemProxy extends Proxy {
	
	private var blobs:Vector.<BlobVO> = new Vector.<BlobVO>();
	
	
	public function PlayAreaItemProxy() {
		
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function addBlob(blobLocation:Point):void {
		var blob:BlobVO = new BlobVO();
		blob.location = blobLocation;
		sendMessage(DataMsg.ADD_BLOB, blobLocation);
	}

}
}