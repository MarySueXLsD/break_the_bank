package;

import flixel.group.FlxGroup;

class IdDocument extends DeskDocument
{
	static inline var PREVIEW_PATH = "static/preview_ID.png";
	static inline var CLOSEUP_PATH = "static/closeup_ID.png";
	static inline var OPEN_SIZE_MULTIPLIER = 6;

	public function new(zones:LayoutZones, layer:FlxGroup)
	{
		super(zones, layer, PREVIEW_PATH, CLOSEUP_PATH, OPEN_SIZE_MULTIPLIER, false);
	}
}
