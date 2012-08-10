package org.mvcexpress.core.traceObjects {
import flash.display.DisplayObject;
import org.mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class TraceCommand_sendMessage extends TraceObj_SendMessage {
	
	public var type:String;
	public var params:Object;
	
	public function TraceCommand_sendMessage(action:String, moduleName:String, commandObject:Command, type:String, params:Object) {
		super(action, moduleName);
		this.commandObject = commandObject;
		this.type = type;
		this.params = params;
	}

}
}