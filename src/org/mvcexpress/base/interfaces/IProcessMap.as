package org.mvcexpress.base.interfaces {

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public interface IProcessMap {
	
	function injectTo(processClass:Class, name:String = "", ... injects:Array):void;
}
}