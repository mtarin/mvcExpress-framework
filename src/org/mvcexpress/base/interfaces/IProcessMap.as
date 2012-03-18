package org.mvcexpress.base.interfaces {

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public interface IProcessMap {
	
	function injectTo(processClass:Class, processName:String, injectObject:Object, injectName:String = "", ... morInjects:Array):void;
}
}