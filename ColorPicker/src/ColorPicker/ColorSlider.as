package ColorPicker 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorSlider extends MovieClip
	{
		private var c_ColorIndicator:ColorIndicator;
		private var c_ColorSliderDragger:ColorSliderDragger;
		
		public function ColorSlider(width:int, height:int, color:uint) 
		{
			graphics.beginFill(0x000000, 0.25);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			graphics.beginFill(0x000000, 0.8);
			graphics.drawRect(height + 2.5, height/2-2, width - height - 5, 4);
			graphics.endFill();
			
			graphics.beginFill(0xFFFFFF, 0.8);
			graphics.drawRect(height + 3.5, height / 2 - 1, width - height - 7, 2);
			graphics.endFill();
			
			c_ColorIndicator = new ColorIndicator(height, height, color);
			
			var draggerHeight:int = height > 10 ? 10 : height;
			c_ColorSliderDragger = new ColorSliderDragger(7, draggerHeight, height, width-7, color);
			
			c_ColorSliderDragger.x = height;
			c_ColorSliderDragger.y = height / 2 - draggerHeight / 2;
			
			addChild(c_ColorIndicator);
			addChild(c_ColorSliderDragger);
		}
		
	}

}