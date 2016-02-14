package ColorPicker 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Nike
	 */
	public class Background extends MovieClip
	{
		
		public function Background(width:int, height:int) 
		{
			graphics.beginFill(0x888888, 0.75);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
	}

}