package ColorPicker
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorPicker extends MovieClip 
	{
		private var c_Background:Background;
		private var c_ColorSwatch:ColorIndicator;
		private var c_ColorSlider:Vector.<ColorSlider> = new Vector.<ColorSlider>(6);
		
		public function ColorPicker(width:int = 100, height:int = 100) 
		{
			c_Background = new Background(width, height);
			c_ColorSwatch = new ColorIndicator(width / 5, height / 5);
			
			c_ColorSwatch.x = width / 2 - c_ColorSwatch.width / 2;
			c_ColorSwatch.y = height - (c_ColorSwatch.height + 5);
			
			addChild(c_Background);
			addChild(c_ColorSwatch);
			
			var RGBOYP:Vector.<uint> = new <uint>[0xFF0000, 0x00FF00, 0x0000FF, 0xFF8000, 0xFFFF00, 0xFF00FF];
			for (var i:int = 0; i < c_ColorSlider.length; i++) 
			{
				c_ColorSlider[i] = new ColorSlider((width-10)/2, 10, RGBOYP[i]);
				
				c_ColorSlider[i].x = i < 3?0:width / 2 + 5;
				c_ColorSlider[i].y = i % 3 * 15;
				
				addChild(c_ColorSlider[i]);
			}
		}	
		
	}
	
}