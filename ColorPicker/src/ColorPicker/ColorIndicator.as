package ColorPicker 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorIndicator extends MovieClip
	{
		private var c_ColorSwatch:Sprite = new Sprite();
		
		public function ColorIndicator(width:int, height:int, color:uint = 0x888888) 
		{
			graphics.beginFill(0x000000);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(1, 1, width - 2, height - 2);
			graphics.endFill();
			
			c_ColorSwatch.x = 2;
			c_ColorSwatch.y = 2;
			
			addChild(c_ColorSwatch);
			
			AlterColor(color);
		}
		
		public function AlterColor(color:uint, alpha:Number = 1):void {
			c_ColorSwatch.graphics.clear();
			
			c_ColorSwatch.graphics.beginFill(color, alpha);
			c_ColorSwatch.graphics.drawRect(0, 0, width - 4, height - 4);
			c_ColorSwatch.graphics.endFill();
		}
	}

}