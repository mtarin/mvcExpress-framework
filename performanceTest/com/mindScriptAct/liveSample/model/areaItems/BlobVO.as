package com.mindScriptAct.liveSample.model.areaItems {
import flash.geom.Point;

/**
 * COMMENT
 * @author Raimundas Banevicius
 */
public class BlobVO {
	
	public static var BLOB_COUNT:int = 0;
	
	public var id:int;
	
	public var radius:int;
	public var position:Point;
	public var direction:Point;
	
	public var damagePoints:int;
	public var totalLife:int;

}
}