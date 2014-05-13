package code
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Enebullet extends MovieClip
	{
		private var stageRef:Stage;
		private var target:ship;
 
		private var vx:Number;
		
		public function Enebullet(stageRef:Stage, target:ship, x:Number, y:Number, vx:Number):void
		{
			this.stageRef = stageRef;
			this.target = target;
			this.x = x;
			this.y = y;
			this.vx = vx;
		
		
		
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		private function loop(e:Event) : void
		{
			x += vx;
 
			if (x > stageRef.stageWidth || x < 0)
				
			if(hitTestObject(target.hit));	
				removeSelf();
		}
 
		private function removeSelf() : void
		{
			if (stageRef.contains(this))
				stageRef.removeChild(this);
		}

	}

}