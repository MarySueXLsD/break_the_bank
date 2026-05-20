package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.geom.Rectangle;

class ComputerHud extends FlxGroup
{
	public function new(x:Int, y:Int, width:Int, height:Int)
	{
		super();

		var sidePad = 2;
		var bottomPad = Std.int(Math.max(6, FlxG.height / 80));
		var gap = Std.int(Math.max(2, width / 80));
		var borderSize = 1;

		var texts = ["June 1st", "08:00", "13$", "0$"];
		var totalGap = gap * (texts.length - 1);
		var boxW = Std.int((width - sidePad * 2 - totalGap) / texts.length);
		var fontSize = Std.int(Math.max(7, FlxG.height / 72));
		var contentH = fontSize + 4;

		var fillColor = FlxColor.fromRGB(44, 54, 68);
		var borderColor = FlxColor.fromRGB(80, 80, 90);

		var rowY = y + height - contentH - bottomPad;
		var boxH = y + height - rowY;
		var rowX = x + sidePad;
		for (i in 0...texts.length)
		{
			addRow(rowX, rowY, boxW, boxH, contentH, texts[i], textColor(i), borderSize, fontSize, fillColor, borderColor);
			rowX += boxW + gap;
		}
	}

	function textColor(i:Int):Int
	{
		return switch (i)
		{
			case 2: FlxColor.fromRGB(72, 200, 120);
			case 3: FlxColor.fromRGB(220, 80, 80);
			default: FlxColor.WHITE;
		}
	}

	function addRow(bx:Int, by:Int, bw:Int, bh:Int, contentH:Int, text:String, textColor:Int, borderSize:Int, fontSize:Int, fillColor:Int, borderColor:Int):Void
	{
		var box = new FlxSprite(bx, by);
		box.makeGraphic(bw, bh, fillColor, true);
		drawBorder(box, bw, bh, borderColor, borderSize);
		add(box);

		var label = new FlxText(bx, by + Std.int((contentH - fontSize) / 2), bw, text);
		label.setFormat(null, fontSize, textColor, "center");
		add(label);
	}

	function drawBorder(sprite:FlxSprite, width:Int, height:Int, color:Int, size:Int):Void
	{
		sprite.pixels.fillRect(new Rectangle(0, 0, width, size), color);
		sprite.pixels.fillRect(new Rectangle(0, height - size, width, size), color);
		sprite.pixels.fillRect(new Rectangle(0, 0, size, height), color);
		sprite.pixels.fillRect(new Rectangle(width - size, 0, size, height), color);
		sprite.dirty = true;
	}
}
