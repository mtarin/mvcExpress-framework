// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.mvc {
import org.mvcexpress.base.CommandMap;
import org.mvcexpress.base.MediatorMap;
import org.mvcexpress.base.ProcessMap;
import org.mvcexpress.base.ProxyMap;
import org.mvcexpress.messenger.Messenger;
import org.mvcexpress.namespace.pureLegsCore;

/**
 * For commands that handles buisness logic of your application. 
 * <b><p>
 * It MUST cantain execute(params:Object) function. Parameter can be typed as you wish.
 * </p></b>
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
dynamic public class Command {
	
	public var commandMap:CommandMap;
	public var processMap:ProcessMap;
	public var mediatorMap:MediatorMap;
	public var proxyMap:ProxyMap;
	
	/** @private */
	pureLegsCore var messenger:Messenger;
	
	/**
	 * Sends a message with optional params object.
	 * @param	type	type of the message for Commands and handle function to react to.
	 * @param	params	Object that will be passed to Command execute() function and to handle functions.
	 */
	protected function sendMessage(type:String, params:Object = null):void {
		pureLegsCore::messenger.send(type, params);
	}	

}
}