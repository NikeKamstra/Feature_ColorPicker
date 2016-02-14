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
		private var c_ColorSlider:Vector.<ColorSlider> = new Vector.<ColorSlider>(7);
		
		public var c_CurrentColor:uint;
		
		public function ColorPicker(width:int = 100, height:int = 100, color:uint = 0x808080) 
		{
			c_CurrentColor = color;
			
			c_Background = new Background(width, height);
			c_ColorSwatch = new ColorIndicator(width / 5, height / 5);
			c_ColorSwatch.AlterColor(color);
			
			c_ColorSwatch.x = width / 2 - c_ColorSwatch.width / 2;
			c_ColorSwatch.y = height - (c_ColorSwatch.height + 5);
			
			addChild(c_Background);
			addChild(c_ColorSwatch);
			
			var CYMKRGB:Vector.<uint> = new <uint>[0x00FFFF, 0xFFFF00, 0xFF00FF, 0xFFFFFF, 0xFF0000, 0x00FF00, 0x0000FF];
			for (var i:int = 0; i < c_ColorSlider.length; i++) 
			{
				c_ColorSlider[i] = new ColorSlider((width-10)/2, 10, CYMKRGB[i]);
				
				c_ColorSlider[i].x = i < 4?0:width / 2 + 5;
				c_ColorSlider[i].y = i % 4 * 15;
				
				addChild(c_ColorSlider[i]);
			}
		}	
		
	}
	
}