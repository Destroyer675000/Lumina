package code
{
	import flash.display.MovieClip;

	public class Armor extends ship
	{
		private var many:int = 1;
		protected var speed:Number;


		public function Armor(aDoc:Document,aTitle:String,aX:Number,aY:Number,changeX:Number,changeY:Number,aSpeed:Number)
		{
			super(aDoc,aTitle,aX,aY,changeX,changeY);
			speed = aSpeed;
		}

		private function getSpeed():Number
		{
			return speed;
		}

		private function setSpeed(aSpeed:Number):void
		{
			speed = aSpeed;
		}
		override public function toString():String
		{
			var material:String;
			material +=  "\nSpeed: " + speed;
			return material;
		}

	}

}