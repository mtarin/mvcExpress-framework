package org.mvcexpress.core.traceObjects {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class TraceModuleManager_disposeModule extends TraceObj {
	
	public function TraceModuleManager_disposeModule(action:String, moduleName:String) {
		super(action, moduleName);
	}
	
	override public function toString():String {
		return "#####- ModuleManager.disposeModule > moduleName : " + moduleName;
	}

}
}