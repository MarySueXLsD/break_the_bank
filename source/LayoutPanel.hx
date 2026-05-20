package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class LayoutPanel extends FlxSprite
{
	public var label:FlxText;

	public function new(x:Int, y:Int, width:Int, height:Int, title:String, fillColor:Int, ?borderColor:Int)
	{
		super(x, y);

		var border = borderColor != null ? borderColor : FlxColor.fromRGB(80, 80, 90);
		var borderSize = Std.int(Math.max(2, FlxG.height / 300));
		var padding = Std.int(Math.max(8, FlxG.height / 75));
		var fontSize = Std.int(Math.max(14, FlxG.height / 43));

		makeGraphic(width, height, fillColor, true);
		drawBorder(width, height, border, borderSize);

		label = new FlxText(x + padding, y + padding, width - padding * 2, title);
		label.setFormat(null, fontSize, FlxColor.WHITE, "left");
	}

	function drawBorder(width:Int, height:Int, color:Int, size:Int):Void
	{
		pixels.fillRect(new openfl.geom.Rectangle(0, 0, width, size), color);
		pixels.fillRect(new openfl.geom.Rectangle(0, height - size, width, size), color);
		pixels.fillRect(new openfl.geom.Rectangle(0, 0, size, height), color);
		pixels.fillRect(new openfl.geom.Rectangle(width - size, 0, size, height), color);
		dirty = true;
	}
}
