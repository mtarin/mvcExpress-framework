package com.mindScriptAct.liveSample.controler.playArea {
import com.mindScriptAct.liveSample.model.areaItems.PlayAreaItemProxy;
import flash.geom.Point;
import org.mvcexpress.mvc.Command;
	
/**
 * TODO:CLASS COMMENT
 * @author 
 */
public class HandleMainClickCommand extends Command {
	
	[Inject]
	public var playAreaItemProxy:PlayAreaItemProxy;
	
	public function execute(clickLocation:Point):void {
		playAreaItemProxy.addBlob(clickLocation);
	}
	
}
}