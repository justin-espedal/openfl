package openfl.display3D.textures;

#if !flash
import haxe.io.Bytes;
import haxe.Timer;
import openfl.utils._internal.ArrayBufferView;
import openfl.utils._internal.UInt8Array;
import openfl.display3D._internal.ATFReader;
import openfl.display._internal.SamplerState;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.utils.ByteArray;

/**
	The Texture2DArray class represents a fixed-size array of 2-dimensional textures uploaded to a rendering context.

	Texture2DArray cannot be instantiated directly. Create instances by using Context3D
	`createTextureArray()` method.
**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(openfl.display3D.Context3D)
@:access(openfl.display.Stage)
@:access(openfl.events.Event)
@:final class Texture2DArray extends TextureBase
{
	@:noCompletion private var __layers:Int;

	@:noCompletion private function new(context:Context3D, width:Int, height:Int, layers:Int, format:Context3DTextureFormat)
	{
		super(context);

		__width = width;
		__height = height;
		__layers = layers;
		// __format = format;

		var gl = __context.gl;

		__textureTarget = gl.TEXTURE_2D_ARRAY;

		__context.__bindGLTexture2DArray(__textureID);
		gl.texImage3D(__textureTarget, 0, __internalFormat, __width, __height, __layers, 0, __format, gl.UNSIGNED_BYTE, null);
		__context.__bindGLTexture2DArray(null);
	}

	@:noCompletion private override function __setSamplerState(state:SamplerState):Bool
	{
		if (super.__setSamplerState(state))
		{
			var gl = __context.gl;

			if (Context3D.__glMaxTextureMaxAnisotropy != 0)
			{
				var aniso = switch (state.filter)
				{
					case ANISOTROPIC2X: 2;
					case ANISOTROPIC4X: 4;
					case ANISOTROPIC8X: 8;
					case ANISOTROPIC16X: 16;
					default: 1;
				}

				if (aniso > Context3D.__glMaxTextureMaxAnisotropy)
				{
					aniso = Context3D.__glMaxTextureMaxAnisotropy;
				}

				gl.texParameterf(gl.TEXTURE_2D, Context3D.__glTextureMaxAnisotropy, aniso);
			}

			return true;
		}

		return false;
	}
}
#else
typedef Texture = flash.display3D.textures.Texture;
#end
