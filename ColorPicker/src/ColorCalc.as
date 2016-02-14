package  
{
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorCalc 
	{
		
		public function ColorCalc() 
		{
			
		}
		
		public static function GetColorByPercentage(color:uint, percentage:Number = 1):uint {
			if (percentage < 0) {
				return 0;
			}
			var r:uint = ((color >> 16) & 0xFF) * percentage;
			var g:uint = ((color >> 8) & 0xFF) * percentage;
			var b:uint = (color) & 0xFF * percentage;
			
			if(r > 255 || g > 255 || b > 255)
				return ReduceColorOverFlow(r, g, b);
			
			return ((r<<16)|(g<<8)|b);
		}
		
		//very hard to name these parameters. fullColor is the color that gets checked for how much it is containing variableColor
		public static function GetPercentageOfColorInColor(variableColor:uint, fullColor:uint):Number {
			var rPercentage:Number = ((fullColor >> 16) & 0xFF) / ((variableColor >> 16) & 0xFF);
			var gPercentage:Number = ((fullColor >> 8) & 0xFF) / ((variableColor >> 8) & 0xFF);
			var bPercentage:Number = (fullColor & 0xFF) / (variableColor & 0xFF);
			
			return (rPercentage < gPercentage && rPercentage < bPercentage) ? rPercentage : (gPercentage < bPercentage) ? gPercentage : bPercentage;
		}
		
		/*public static function GradientColorAtPosition(gradientData:GradientData, position:int):uint {
			var r:uint = ((gradientData.c_StartColor >> 16) & 0xFF) + gradientData.c_RGBChangePerPixel[0] * position;
			var g:uint = ((gradientData.c_StartColor >> 8) & 0xFF) + gradientData.c_RGBChangePerPixel[1] * position;
			var b:uint = (gradientData.c_StartColor & 0xFF) + gradientData.c_RGBChangePerPixel[2] * position;
			
			return ((r<<16)|(g<<8)|b);
		}*/
		
		public static function ReduceColorOverFlow(r:uint, g:uint, b:uint):uint {
			var highest:int = (r > g && r > b) ? r : (g > b) ? g : b;
			var multiplier:Number = 255 / highest;
			r *= multiplier;
			g *= multiplier;
			b *= multiplier;
			return ((r<<16)|(g<<8)|b);
		}
		
		public static function RGBChangesBetweenColors(color1:uint, color2:uint, distance:int):Vector.<Number> {
			var RGBChanges:Vector.<Number> = new Vector.<Number>(3);
			
			var r1:uint = ((color1 >> 16) & 0xFF);
			var r2:uint = ((color2 >> 16) & 0xFF);
			var g1:uint = ((color1 >> 8) & 0xFF);
			var g2:uint = ((color2 >> 8) & 0xFF);
			var b1:uint = (color1 & 0xFF);
			var b2:uint = (color2 & 0xFF);

			RGBChanges[0] = (r2 - r1) / distance;
			RGBChanges[1] = (g2 - g1) / distance;
			RGBChanges[2] = (b2 - b1) / distance;

			return RGBChanges;
		}
	}

}