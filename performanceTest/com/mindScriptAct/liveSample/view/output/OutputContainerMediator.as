package com.mindScriptAct.liveSample.view.output {
import com.mindScriptAct.liveSample.messages.DataMsg;
import com.mindScriptAct.liveSample.model.areaItems.BlobVO;
import com.mindScriptAct.liveSample.model.areaItems.PlayAreaItemProxy;
import flash.geom.Point;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Object
 */
public class OutputContainerMediator extends Mediator {
	
	[Inject]
	public var view:OutputContainer;
	
	[Inject]
	public var playAreaItemProxy:PlayAreaItemProxy;
	
	override public function onRegister():void {
		addHandler(DataMsg.ADD_BLOB, handleBlobAdded);
		addHandler(DataMsg.REMOVE_BLOB, handleBlobRemoved);
	}
	
	private function handleBlobRemoved(blobID:int):void {
		view.outputTF.text = "Blobs:" + playAreaItemProxy.getBlobCount();
	}
	
	private function handleBlobAdded(blobVo:BlobVO):void {
		view.outputTF.text = "Blobs:" + playAreaItemProxy.getBlobCount();
	}
	
	override public function onRemove():void {
	
	}

}
}