package org.mvcexpress.core.traceObjects {
import flash.display.DisplayObject;
import org.mvcexpress.core.ModuleBase;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class TraceModuleBase_sendMessage extends TraceObj_SendMessage {
	
	public var type:String;
	public var params:Object;
	
	public function TraceModuleBase_sendMessage(action:String, moduleName:String, moduleObject:ModuleBase, type:String, params:Object) {
		super(action, moduleName);
		this.moduleObject = moduleObject;
		this.type = type;
		this.params = params;
	}

}
}