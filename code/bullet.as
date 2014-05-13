package code
{

	import flash.display.MovieClip;
	import flash.events.*;


	public class bullet extends MovieClip
	{

		private var speed:Number;
		private var doc:Document;

		public function bullet()
		{
			speed = 20;
			addEventListener(Event.ENTER_FRAME,frameLoop);

		}

		private function frameLoop(e:Event)
		{

			this.y -=  speed;



		}

	}

}