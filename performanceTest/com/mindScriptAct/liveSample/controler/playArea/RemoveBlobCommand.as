package com.mindScriptAct.liveSample.controler.playArea {
import com.mindScriptAct.liveSample.model.areaItems.PlayAreaItemProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class RemoveBlobCommand extends Command {
	
	[Inject]
	public var playAreaItemProxy:PlayAreaItemProxy;
	
	public function execute(blobId:int):void {
		//trace( "RemoveBlobCommand.execute > blobId : " + blobId );
		playAreaItemProxy.removeBlob(blobId);
	}

}
}