package openfl.display;

import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.Vector;

#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
#if !flash
@:access(openfl.geom.Rectangle)
#end
class TilesetArray
{
	public var tilesets(get, set):Array<Tileset>;

	@:noComplete private var __tilesets:Array<Tileset>;

	/**
		Creates a new Tileset instance.

		@param	bitmapData	A BitmapData object to reference
		@param	rects	An optional array of rectangles to define with the referenced BitmapData
	**/
	public function new(tilesets:Array<Tileset>)
	{
		__tilesets = tilesets;
	}

	// Get & Set Methods
	@:noCompletion private function get_tilesets():Array<Tileset>
	{
		return __tilesets;
	}

	@:noCompletion private function set_tilesets(value:Array<Tileset>):Array<Tileset>
	{
		__tilesets = value;

		return value;
	}
}
