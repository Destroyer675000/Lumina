package code
{

	import flash.display.MovieClip;

	public class ship extends MovieClip
	{
		private var titles:String;
		protected var differenceInX:Number;
		protected var differenceInY:Number;
		protected var doc:Document;
		
		public function ship(aDoc:Document,aTitle:String,aX:Number,aY:Number,changeX:Number,changeY:Number)
		{
			titles=aTitle;
			x=aX;
			y=aY;
			differenceInX=changeX;
			differenceInY=changeY;
		}
		public function getTitle():String
		{
			return name;
		}
		
		public function setTitle(aTitle:String):void
		{
			name=aTitle;
		}
		
		public function getDifferentX():Number
		{
			return differenceInX;
		}
		
		public function setDifferentX(changeX:Number):void
		{
			differenceInX=changeX;
		}
		
		public function getDifferentY():Number
		{
			return differenceInY;
		}
		
		public function setDifferentY(changeY:Number):void
		{
			differenceInY=changeY;
		}
		
		public function moveShip()
		{
			this.x+=differenceInX;
			this.y+=differenceInY;
		}
		
		override public function toString():String
		{
			var material:String="Name: "+ titles;
			material+="\nDifferentX: "+ differenceInX;
			material+="\nDifferentY: "+ differenceInY;
			return material ;
		}

	}

}