// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.base {
import adobe.utils.CustomActions;
import flash.display.MovieClip;
import flash.events.AsyncErrorEvent;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.geom.Point;
import flash.utils.describeType;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;
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
	
	/////////
	private var frameTickerRegistry:Dictionary = new Dictionary(); /* of Int by String */
	private var frameTickers:Vector.<FrameTicker> = new Vector.<FrameTicker>();
	private var runningFrameTickers:Vector.<FrameTicker> = new Vector.<FrameTicker>();
	
	/////////
	private var timerTickerRegistry:Dictionary = new Dictionary(); /* of Int by String */
	private var timerTickers:Vector.<TimerTicker> = new Vector.<TimerTicker>();
	
	/////////
	private var test_enterFrameTicker:MovieClip;
	
	//
	public function ProcessMap(messenger:Messenger) {
		this.messenger = messenger;
	
	}
	
	//----------------------------------
	//     ticker set up
	//----------------------------------
	
	/**
	 *
	 * @param	tickerName
	 */
	public function initFrameTicker(tickerName:String):void {
		if (frameTickerRegistry[tickerName]) {
			throw Error("Frame ticker with name" + tickerName + " is already initialized.");
		}
		var ticker:FrameTicker = new FrameTicker(tickerName);
		frameTickerRegistry[tickerName] = frameTickers.length;
		frameTickers.push(ticker);
	}
	
	/**
	 *
	 * @param	tickerName
	 * @param	frequency
	 */
	public function initTimerTicker(tickerName:String, frequency:int = 100):void {
		if (timerTickerRegistry[tickerName]) {
			throw Error("Timer ticker with name" + tickerName + " is already initialized.");
		}
		var ticker:TimerTicker = new TimerTicker(tickerName, frequency);
		timerTickerRegistry[tickerName] = frameTickers.length;
		timerTickers.push(ticker);
	}
	
	//----------------------------------
	//     process set up
	//----------------------------------
	
	private function createProcess(processClass:Class, processName:String):Process {
		var className:String = getQualifiedClassName(processClass);
		use namespace pureLegsCore;
		Process.canConstruct = true;
		var process:Process = new processClass() as Process;
		process.messanger = messenger;
		Process.canConstruct = false;
		if (!process) {
			throw Error("Process creation failed. processClass must extend Procoss class.");
		}
		classInjectRules[processClass] = getInjectRules(processClass);
		processRegistry[className + processName] = process;
		return process;
	}
	
	// TODO : consider adding named timer instances.. (to have many of them at same time)
	public function addTimerProcess(tickerName:String, processClass:Class, processName:String):void {
		trace("ProcessMap.addTimerProcess > processClass : " + processClass + ", processName  : " + processName);
	
	}
	
	// TODO : consider adding named EnterFrame instances.. (to have many of them at same time)
	public function addFrameProcess(tickerName:String, processClass:Class, processName:String):void {
		trace("ProcessMap.addFrameProcess > tickerName : " + tickerName + ", processClass : " + processClass + ", processName : " + processName);
		// get ticker
		if (frameTickerRegistry[tickerName] == null) {
			throw Error("There is no initialized frame ticker with name:" + tickerName);
		}
		var ticker:FrameTicker = frameTickers[frameTickerRegistry[tickerName]];
		// get process
		var className:String = getQualifiedClassName(processClass);
		var process:Process = processRegistry[className + processName] as Process;
		if (!process) {
			process = createProcess(processClass, processName);
		}
		ticker.processes.push(process);
	}
	
	public function removeProcess(tickerName:String, processClass:Class, processName:String):void {
		trace("ProcessMap.removeProcess > processClass : " + processClass + ", processName : " + processName);
	
	}
	
	public function hasProcess(tickerName:String, processClass:Class, processName:String):Boolean {
		trace("ProcessMap.hasProcess > processClass : " + processClass + ", processName : " + processName);
		
		return false;
	}
	
	// TODO : function to trace current processes. (experimantal)
	public function printProcesses():void {
	
	}
	
	// TODO : implement inject object + name pairs for injection.
	public function injectTo(processClass:Class, processName:String, injectObject:Object, injectName:String = "", ... moreInjects:Array):void {
		trace("ProcessMap.injectTo > processClass : " + processClass + ", processName : " + processName + ", injectObject : " + injectObject + ", injectName : " + injectName + ", moreInjects : " + moreInjects);
		var className:String = getQualifiedClassName(processClass);
		var process:Process = processRegistry[className + processName] as Process;
		if (!process) {
			process = createProcess(processClass, processName);
		}
		use namespace pureLegsCore;
		
		var injectClassName:String = getQualifiedClassName(injectObject);
		process.injects[injectClassName + injectName] = injectObject;
		process.injectCount++
		
		for (var i:int = 0; i < moreInjects.length; i += 2) {
			injectClassName = getQualifiedClassName(moreInjects[i]);
			injectName = "";
			if (moreInjects[i + 1]) {
				if (moreInjects[i + 1] is String) {
					injectName = moreInjects[i + 1];
				} else {
					throw Error("moreInjects Array every second member must be String. (moreInjects must be provided in pairs: injectObject and injectName.) ");
				}
			}
			process.injects[injectClassName + injectName] = moreInjects[i];
			process.injectCount++
		}
	
	}
	
	//----------------------------------
	//    timer funcions 
	//----------------------------------
	
	public function startTimer():void {
		//trace("ProcessMap.startTimer");
	
	}
	
	public function stopTimer():void {
		//trace("ProcessMap.stopTimer");
	
	}
	
	public function goToTimer():void {
		//trace("ProcessMap.goToTimer");
	
	}
	
	public function reverseTimer():void {
		//trace("ProcessMap.reverseTimer");
	}
	
	//----------------------------------
	//    enter frame funcions 
	//----------------------------------	
	
	public function startFrameTicker(tickerName:String):void {
		
		// get ticker
		if (frameTickerRegistry[tickerName] == null) {
			throw Error("There is no initialized frame ticker with name:" + tickerName);
		}
		var ticker:FrameTicker = frameTickers[frameTickerRegistry[tickerName]];
		
		if (!ticker.isRunning) {
			use namespace pureLegsCore;
			var processes:Vector.<Process> = ticker.processes;
			for (var i:int = 0; i < processes.length; i++) {
				if (!processes[i].isInited) {
					// handle injections.
					initInjections(processes[i]);
					// init
					processes[i].init();
					processes[i].isInited = true;
				}
			}
			//
			ticker.isRunning = true;
			runningFrameTickers.push(ticker);
		} else {
			throw Error("Frame ticker with name :" + tickerName + " is already started.");
		}
		
		// start enter frame ticker
		if (!test_enterFrameTicker) {
			test_enterFrameTicker = new MovieClip();
			test_enterFrameTicker.addEventListener(Event.ENTER_FRAME, handleFrameTick);
		}
	
	}
	
	private function handleFrameTick(event:Event):void {
		//trace("ProcessMap.handleFrameTick > event : " + event);
		var runTime:int = getTimer();
		for (var t:int = 0; t < runningFrameTickers.length; t++) {
			var processes:Vector.<Process> = runningFrameTickers[t].processes;
			for (var p:int = 0; p < processes.length; p++) {
				processes[p].run(runTime);
				processes[p].lastRunTime = runTime;
			}
		}
	}
	
	public function stopEnterFrame():void {
		//trace("ProcessMap.stopEnterFrame");
		// TODO
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
		
		if (rules.length == process.injectCount) {
			
			for (var i:int = 0; i < rules.length; i++) {
				
				var injectObject:Object = process.injects[rules[i].injectClassAndName];
				
				if (injectObject) {
					process[rules[i].varName] = injectObject;
				} else {
					throw Error("Process " + process + " is not provided with inject object for:" + rules[i].injectClassAndName);
				}
			}
		} else {
			throw Error("Process must be provided with exact number of inject objects, as there are [Inject] variables. (Process " + process + " has " + process.injectCount + " inject objects and " + rules.length + " [Inject] variables.)");
		}
	}
	
	pureLegsCore function dispose():void {
		messenger = null;
		processRegistry = null;
		classInjectRules = null;
	}
}
}
import org.mvcexpress.live.Process;

//----------------------------------
//     private ticker classes
//----------------------------------

class TimerTicker {
	public var tickerName:String;
	public var frequency:int;
	
	function TimerTicker(tickerName:String, frequency:int) {
		this.tickerName = tickerName;
		this.frequency = frequency;
	
	}
}

class FrameTicker {
	public var tickerName:String;
	public var processes:Vector.<Process> = new Vector.<Process>();
	public var isRunning:Boolean;
	
	function FrameTicker(tickerName:String) {
		this.tickerName = tickerName;
	
	}
}

