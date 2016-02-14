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
		private var c_Background:MovieClip;
		
		public function ColorPicker(width:int = 100, height:int = 100):void 
		{
			c_Background = new Background(width,height);
			addChild(c_Background);
		}	
		
	}
	
}