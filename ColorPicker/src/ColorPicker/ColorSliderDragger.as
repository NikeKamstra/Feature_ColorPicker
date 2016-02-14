package ColorPicker 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import ColorCalc;
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorSliderDragger extends MovieClip
	{
		private var c_ColorSwatch:MovieClip = new MovieClip();
		private var c_IsBeingDragged:Boolean = false;
		private var c_MinX:int;
		private var c_MaxX:int;
		
		public var c_CurrentPercentage:int = 0;
		public var c_Color:int;
		
		
		public function ColorSliderDragger(width:int, height:int, minXPosition:int, maxXPosition:int, color:uint, alpha:Number = 1) 
		{
			graphics.beginFill(0x000000);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(1, 1, width - 2, height - 2);
			graphics.endFill();
			
			c_Color = color;
			
			AlterColor(color, alpha);
			
			c_MinX = minXPosition;
			c_MaxX = maxXPosition;
			
			c_ColorSwatch.x = 2;
			c_ColorSwatch.y = 2;
			
			addChild(c_ColorSwatch);
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			addEventListener(MouseEvent.MOUSE_DOWN, StartDragging);
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function addedToStageHandler(e:Event):void {
			stage.addEventListener(MouseEvent.MOUSE_UP, StopDragging);
		}
		
		private function loop(e:Event):void {
			if (c_IsBeingDragged) {
				x += mouseX - width / 2;
				
				if (x < c_MinX) 
					x = c_MinX;
				else if (x > c_MaxX) 
					x = c_MaxX;
					
				var percentage:int = 100 * (x - c_MinX) / (c_MaxX - c_MinX);
				if (percentage != c_CurrentPercentage) {
					AlterColor(ColorCalc.GetPercentageOfColor(c_Color, percentage));
					c_CurrentPercentage = percentage;
				}
			}
		}
		
		private function StartDragging(e:MouseEvent):void {
			c_IsBeingDragged = true;
		}
		
		private function StopDragging(e:MouseEvent):void {
			c_IsBeingDragged = false;
		}
		
		public function AlterColor(color:uint, alpha:Number = 1):void {
			c_ColorSwatch.graphics.clear();
			
			c_ColorSwatch.graphics.beginFill(color, alpha);
			c_ColorSwatch.graphics.drawRect(0, 0, width - 4, height - 4);
			c_ColorSwatch.graphics.endFill();
		}
	}

}