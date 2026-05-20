package;

import flixel.group.FlxGroup;

class Passport extends DeskDocument
{
	static inline var CLOSED_PATH = "static/closed_passport.png";
	static inline var OPEN_PATH = "static/open_passport.png";
	static inline var OPEN_SIZE_MULTIPLIER = 9.0;

	public function new(zones:LayoutZones, layer:FlxGroup)
	{
		super(zones, layer, CLOSED_PATH, OPEN_PATH, OPEN_SIZE_MULTIPLIER);
	}
}
