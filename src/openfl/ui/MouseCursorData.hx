package openfl.ui;

#if !flash
import openfl.display.BitmapData;
import openfl.geom.Point;
import openfl.Vector;

/**
	The MouseCursorData class lets you define the appearance of a custom native
	mouse cursor.

	To display the cursor, use the `Mouse.registerCursor()` method to register
	the cursor with the operating system and then set the `Mouse.cursor`
	property to the registered name.
**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:final class MouseCursorData
{
	/**
		A Vector of BitmapData objects containing the cursor image or frames.
	**/
	public var data:Vector<BitmapData>;

	/**
		The frame rate for animating the cursor.
	**/
	public var frameRate:Float;

	/**
		The hot spot coordinates of the cursor.
	**/
	public var hotSpot:Point;

	/**
		Creates a new MouseCursorData object.
	**/
	public function new()
	{
		hotSpot = new Point(0, 0);
		frameRate = 0;
	}
}
#else
typedef MouseCursorData = flash.ui.MouseCursorData;
#end
