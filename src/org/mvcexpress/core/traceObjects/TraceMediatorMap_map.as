package org.mvcexpress.core.traceObjects {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class TraceMediatorMap_map extends TraceObj {
	
	public var viewClass:Class;
	public var mediatorClass:Class;
	
	public function TraceMediatorMap_map(action:String, moduleName:String, viewClass:Class, mediatorClass:Class) {
		super(action, moduleName);
		this.viewClass = viewClass;
		this.mediatorClass = mediatorClass;
	}
	
	override public function toString():String {
		return "§§§+ MediatorMap.map > viewClass : " + viewClass + ", mediatorClass : " + mediatorClass;
	}

}
}