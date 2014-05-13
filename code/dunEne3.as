package code
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;

	public class dunEne3 extends MovieClip
	{

		private var stageRef:Stage;
		private var vy:Number = 3;//y velocity
		private var ay:Number = .4;//y acceleration
		private var target:ship;
		public var isHit:Boolean = false;
		public var shipHit:Boolean = false;

		public function dunEne3(stageRef:Stage, target:ship):void
		{
			this.stageRef = stageRef;
			this.target = target;

			x = Math.random() * stageRef.stageWidth;
			y = -15;
		}
		
		public function activate():void
		{

			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		private function loop(e:Event):void
		{
			vy +=  ay;
			y +=  vy;

			if (y > stageRef.stageHeight)
			{
				removeSelf();
			}

			if (y - 15 < target.y && y + 15 > target.y)
			{
				fireWeapon();
			}
		}

		private function fireWeapon():void
		{
			stageRef.addChild(new Enebullet(stageRef, target, x, y, -5));
			stageRef.addChild(new Enebullet(stageRef, target, x, y, 5));
			
		}
		private function removeSelf():void
		{

			removeEventListener(Event.ENTER_FRAME, loop);
			
			
		}

		
	}
}