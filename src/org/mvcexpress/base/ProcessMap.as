package org.mvcexpress.base {
import flash.display.MovieClip;
import flash.events.AsyncErrorEvent;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.geom.Point;
import com.mindScriptAct.liveSample.engine.TickProcess;
import flash.utils.describeType;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import org.mvcexpress.base.inject.InjectRuleVO;
import org.mvcexpress.base.interfaces.IProcessMap;
import org.mvcexpress.live.Process;
import org.mvcexpress.messenger.Messenger;
import org.mvcexpress.namespace.pureLegsCore;

/**
 * Handles live processes
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class ProcessMap implements IProcessMap {
	private var messenger:Messenger;
	
	/** */
	private var processRegistry:Dictionary = new Dictionary();
	
	/** */
	private var classInjectRules:Dictionary = new Dictionary();
	
	private var test_enterFrameProcesses:Vector.<Process> = new Vector.<Process>();
	private var test_enterFrameTicker:MovieClip;
	
	public function ProcessMap(messenger:Messenger) {
		this.messenger = messenger;
	
	}
	
	//----------------------------------
	//     process set up
	//----------------------------------
	
	private function createProcess(processClass:Class, name:String):Process {
		var className:String = getQualifiedClassName(processClass);
		use namespace pureLegsCore;
		Process.canConstruct = true;
		var process:Process = new processClass() as Process;
		Process.canConstruct = false;
		if (!process) {
			throw Error("Process creation failed. processClass must extend Procoss class.");
		}
		classInjectRules[processClass] = getInjectRules(processClass);
		processRegistry[className + name] = process;
		return process;
	}
	
	// TODO : consider adding named timer instances.. (to have many of them at same time)
	public function addTimerProcess(processClass:Class, name:String = ""):void {
		trace("ProcessMap.addTimerProcess > processClass : " + processClass + ", name : " + name);
	
	}
	
	// TODO : consider adding named EnterFrame instances.. (to have many of them at same time)
	public function addFrameProcess(processClass:Class, name:String = ""):void {
		trace("ProcessMap.addFrameProcess > processClass : " + processClass + ", name : " + name);
		var className:String = getQualifiedClassName(processClass);
		var process:Process = processRegistry[className + name] as Process;
		if (!process) {
			process = createProcess(processClass, name);
		}
		test_enterFrameProcesses.push(process);
	}
	
	public function removeProcess(processClass:Class, name:String = ""):void {
		trace("ProcessMap.removeProcess > processClass : " + processClass + ", name : " + name);
	
	}
	
	public function hasProcess(processClass:Class, name:String = ""):Boolean {
		trace("ProcessMap.hasProcess > processClass : " + processClass + ", name : " + name);
		
		return false;
	}
	
	// TODO : function to trace current processes. (experimantal)
	public function printProcesses():void {
	
	}
	
	// TODO : implement inject object + name pairs for injection.
	public function injectTo(processClass:Class, name:String = "", ... injects:Array):void {
		trace("ProcessMap.injectTo > processClass : " + processClass + ", name : " + name + ", injects : " + injects);
		var className:String = getQualifiedClassName(processClass);
		var process:Process = processRegistry[className + name] as Process;
		if (!process) {
			process = createProcess(processClass, name);
		}
		use namespace pureLegsCore;
		process.appendInjects(injects);
	
	}
	
	//----------------------------------
	//    timer funcions 
	//----------------------------------
	
	public function startTimer():void {
		trace("ProcessMap.startTimer");
	
	}
	
	public function stopTimer():void {
		trace("ProcessMap.stopTimer");
	
	}
	
	public function goToTimer():void {
		trace("ProcessMap.goToTimer");
	
	}
	
	public function reverseTimer():void {
		trace("ProcessMap.reverseTimer");
	
	}
	
	//----------------------------------
	//    enter frame funcions 
	//----------------------------------	
	
	public function startEnterFrame():void {
		trace("ProcessMap.startEnterFrame");
		use namespace pureLegsCore;
		
		// check if processes is inited.. if not - init them.
		
		// TODO : optimize... create vector of NOT inited processes of ticker.
		for (var i:int = 0; i < test_enterFrameProcesses.length; i++) {
			if (!test_enterFrameProcesses[i].isInited) {
				// handle injections.
				initInjections(test_enterFrameProcesses[i]);
				// init
				test_enterFrameProcesses[i].init();
				
				test_enterFrameProcesses[i].isInited = true;
			}
		}
		
		// TODO : add ticker name... 
		test_enterFrameTicker = new MovieClip();
		test_enterFrameTicker.addEventListener(Event.ENTER_FRAME, handleFrameTick);
	
	}
	
	
	
	private function handleFrameTick(event:Event):void {
		trace( "ProcessMap.handleFrameTick > event : " + event );
		for (var i:int = 0; i < test_enterFrameProcesses.length; i++) {
			test_enterFrameProcesses[i].run(0);
		}
	}
	
	public function stopEnterFrame():void {
		trace("ProcessMap.stopEnterFrame");
	
	}
	
	//----------------------------------
	//     
	//----------------------------------
	
	/**
	 * finds and cashes class injection point rules.
	 */
	// TODO : dublicated code.. consider moving to dedicated class...
	private function getInjectRules(signatureClass:Class):Vector.<InjectRuleVO> {
		var retVal:Vector.<InjectRuleVO> = new Vector.<InjectRuleVO>();
		
		var classDescription:XML = describeType(signatureClass);
		var node:XML;
		
		// TODO : optimize
		for each (node in classDescription.factory.*.(name() == "variable" || name() == "accessor").metadata.(@name == "Inject")) {
			//trace( "node : " + node );
			
			// TODO : optimize
			var name:String = "";
			var args:XMLList = node.arg;
			if (args[0]) {
				if (args[0].@key == "name") {
					name = args[0].@value;
				}
			}
			
			var mapRule:InjectRuleVO = new InjectRuleVO();
			
			mapRule.varName = node.parent().@name.toString();
			mapRule.injectClassAndName = node.parent().@type.toString() + name;
			
			retVal.push(mapRule);
		}
		
		return retVal;
	}
	
	private function initInjections(process:Process):void {
		use namespace pureLegsCore;
		
		var rules:Vector.<InjectRuleVO> = classInjectRules[(process as Object).constructor];
		var injectObjects:Array = process.injects;
		
		for (var j:int = 0; j < injectObjects.length; j++) {
			var injectObject:Object = injectObjects[j];
			
			var classDescription:String = getQualifiedClassName(injectObject);
			
			var injectRule:InjectRuleVO = null;
			
			for (var i:int = 0; i < rules.length; i++) {
				if (rules[i].injectClassAndName == classDescription) {
					injectRule = rules[i];
					break;
				}
			}
			if (injectRule) {
				if (injectObject) {
					process[rules[i].varName] = injectObject;
				} else {
					throw Error("Inject object is not found for class:" + rules[i].injectClassAndName);
				}
			} else {
				throw Error("Inject rule is not found for object:" + injectObject);
			}
			
		}
	
		// TODO : check if all injections are satesfied.
	
	}
	
	pureLegsCore function dispose():void {
		messenger = null;
		processRegistry = null;
		classInjectRules = null;
	}
}
}