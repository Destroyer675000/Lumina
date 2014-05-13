package code
{
	//importing flash requirements
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.fscommand;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Document extends MovieClip
	{
		//array that will hold the hold all the ships on the select stage
		var ships:Array=new Array();

		//having a counter that will equal to zero
		private var count:Number = 0;

		//used for to keep track of the bullets within the bulletArray and how many bullets to create
		private var bulletsNum:Number = 1000;
		private var bulletArray:Array = new Array();
		private var activeBullets:int = 0;

		private var spawnTimer:Timer = new Timer(1000);

		//the number of stars being used
		private var numStars:int = 100;

		//used for keeping track of the enemys with enemyList and also how many enemies to make
		private var enemyNum:Number = 10;
		private var enemyList:Array = new Array();
		private var activeEnemy:int = 0;

		//used to store the selected ship
		var theShip:ship;

		public function Document()
		{
			trace("i am created");
			//start buttons that will go to the character select frame 
			startBtn.addEventListener(MouseEvent.CLICK,gotoCharacter);

			//option button that will got the option frame
			optionBtn.addEventListener(MouseEvent.CLICK,gotoOption);

			//Credit button goes to a credit frame;
			creditBtn.addEventListener(MouseEvent.CLICK,gotoCredits);

			//quit button that will go to a non work able quit frame;
			quitBtn.addEventListener(MouseEvent.CLICK,gotoQuit);
		}

		//fuction that gets called upon when teh startbtn is clicked
		public function gotoCharacter(e:Event)
		{

			//traces that it went to the character select page
			trace("move to character select");
			//goes to the second frame and stops on that frame
			gotoAndStop(2);

			//the back button goes back to the main menu frame
			backBtn.addEventListener(MouseEvent.CLICK,goback);

			//these three eventListeners are checking for a mouse over on any of the three ships have the mouse over it
			//if so display the stats of the ship the mouse is hovered over
			Stealthbtn.addEventListener(MouseEvent.MOUSE_OVER,showstats);
			balancedbtn.addEventListener(MouseEvent.MOUSE_OVER,showstats2);
			armorbtn.addEventListener(MouseEvent.MOUSE_OVER,showstats3);

			//these three EventListeners are checking to see if one of the ships have been clicked(selected)
			//if so go to the respective clearEvent function
			Stealthbtn.addEventListener(MouseEvent.CLICK,clearEvents);
			balancedbtn.addEventListener(MouseEvent.CLICK,clearEvents2);
			armorbtn.addEventListener(MouseEvent.CLICK,clearEvents3);
		}


		public function gotoOption(e:Event)
		{

			//go to frame 3 and stops on this frame
			gotoAndStop(3);

			//the back button goes back to the main menu frame
			backBtn.addEventListener(MouseEvent.CLICK,goback);

		}
		public function gotoCredits(e:Event)
		{

			//go to frame 4 and stops on this frame
			gotoAndStop(4);

			//the back button goes back to the main menu frame
			backBtn.addEventListener(MouseEvent.CLICK,goback);
		}
		public function gotoQuit(e:Event)
		{
			//go to frame 5 and stops on this frame
			gotoAndStop(5);

			//the back button goes back to the main menu frame
			noBtn.addEventListener(MouseEvent.CLICK,goback);

			yesBtn.addEventListener(MouseEvent.CLICK,exitGame);
		}

		public function goback(e:Event)
		{
			trace("i go back to main menu");

			//go to frame 1 and stops on this frame
			gotoAndStop(1);
			//reactives the main menu buttons
			startBtn.addEventListener(MouseEvent.CLICK,gotoCharacter);
			optionBtn.addEventListener(MouseEvent.CLICK,gotoOption);
			creditBtn.addEventListener(MouseEvent.CLICK,gotoCredits);
			quitBtn.addEventListener(MouseEvent.CLICK,gotoQuit);
		}


		public function exitGame(e:Event)
		{
			//tracing that it game is over and in export should quit the file
			trace("Game is over");
			fscommand("quit");

		}

		public function showstats(e:Event)
		{


			trace("stats are here");

			//have the text set to an empty string
			text1.text = "";

			//have string called stats equal to value being hard coded in  
			var stats:String = "speed is 10" + "\n" + "health is 2";
			trace("speed is 10"+"\n"+"health is 2");

			//making the text box equal to the stats string
			text1.text = stats;



		}
		public function showstats2(e:Event)
		{
			trace("stats are here");

			//have the text set to an empty string
			text1.text == "";

			//have string called stats equal to value being hard coded in  
			var stats:String = "speed is 7" + "\n" + "health is 6";
			trace("speed is 7"+"\n"+"health is 6");

			//making the text box equal to the stats string
			text1.text = stats;
		}
		public function showstats3(e:Event)
		{
			trace("stats are here");

			//have string called stats equal to value being hard coded in  
			var stats:String = "speed is 2" + "\n" + "health is 10";

			//have the text set to an empty string
			text1.text = "";

			trace("speed is 2"+"\n"+"health is 10");

			//making the text box equal to the stats string
			text1.text = stats;
		}



		function clearEvents(e:Event)
		{

			//removes the event listeners on all three ships and starts the game 
			Stealthbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);
			balancedbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);
			armorbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);

			//go to the startGame fucntion when the ship is selected
			startGame(e);
		}
		function clearEvents2(e:Event)
		{
			//removes the event listeners on all three ships and starts the game 
			Stealthbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);
			armorbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);
			balancedbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);

			//go to the startGame fucntion when the ship is selected;
			startGame(e);
		}
		function clearEvents3(e:Event)
		{
			//removes the event listeners on all three ships and starts the game 
			Stealthbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);
			balancedbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);
			armorbtn.removeEventListener(MouseEvent.MOUSE_OVER,showstats);

			//go to the startGame fucntion when the ship is selected
			startGame(e);
		}

		public function startGame(e:Event)
		{
			trace("game started");

			//Checkes to see what ship is was selected and based on that 
			//will make the ship in theShip array
			if (e.target == Stealthbtn)
			{
				theShip = new stealth(this,"Stealth",100,300,0,0,10);
			}
			else if (e.target == balancedbtn)
			{
				theShip = new Balanced(this,"Stealth",100,300,0,0,10);
			}
			else if (e.target == armorbtn)
			{
				theShip = new Armor(this,"Stealth",100,300,0,0,10);
			}

			//scales the ship within the array to 85 pixels by 85 pixels 
			theShip.height = 85;
			theShip.width = 85;
			trace(theShip);
			//creates the ship to the stage
			addChild(theShip);

			//make it follow the mouse's x position 
			theShip.x = mouseX;
			trace("i am suppose to move right now");

			//go to frame 6 and stops on this frame
			gotoAndStop(6);

			//using a for loop to make the star appar on the stage
			for (var i:int = 0; i < numStars; i++)
			{
				stage.addChildAt(new Star(stage), 1);
			}

			//calling three different funcitons of  the bat 
			//eventlisteners, createbullet, and createEnemy
			eventListeners();
			createBullet(bulletsNum);
			createEnemy(enemyNum);

		}

		private function spawnEnemy(e:TimerEvent)
		{
			//checking to see if the activeEnemy number is less than the enemyList array's length 
			//if so go within the if statement again
			//if (activeEnemy<enemyList.length)
//			{
				//add the enemy ships to the stage
				addChild(enemyList[activeEnemy]);
				//make the enemeylist at the activeEnemy number visible 
				//enemyList[activeEnemy].visible = true;
				//enemyList[activeEnemy].alpha = true;
				trace("enemy"+enemyList[activeEnemy]+activeEnemy);
				//setting the is hit of the enemy int the array to false 
				enemyList[activeEnemy].isHit = false;
				enemyList[activeEnemy].shipHit = false;

				//makes the current enemy to use the fuction within the dumEne class
				enemyList[activeEnemy].activate();

				enemyList[activeEnemy].height = 85;
				enemyList[activeEnemy].width = 85;
				//incrementing the number
				activeEnemy++;
				if (activeEnemy==enemyList.length)
				{
					activeEnemy = 0;
					enemyList[activeEnemy].activate();
					addChild(enemyList[activeEnemy]);
				}

			//}

		}
		//create enemy function that requires a number to be passed in
		private function createEnemy(howMany:Number):void
		{
			//having a for loop using the required number that was passed in to be the compared to your variable
			for (var i:int=0; i<howMany; i++)
			{
				//add a new dumEne to the list 
				//enemyList[i] = new dumEne(stage,theShip);


				switch (Math.floor(Math.random()*3))
				{
					case 0 :
						enemyList[i] = new dumEne(stage,theShip);
						break;

					case 1 :
						enemyList[i] = new dumEne2(stage,theShip);
						break;

					case 2 :
						enemyList[i] = new dunEne3(stage,theShip);
						break;

				}
			}
		}

		function eventListeners():void
		{
			trace("i got here");

			//using enter frame to make the ship go to the moveship function, testForHit function and also spawnEnemy fucntion
			addEventListener(Event.ENTER_FRAME,moveShip);
			spawnTimer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			spawnTimer.start();
			

			addEventListener(Event.ENTER_FRAME,testForHit);

			//checks to see if the player clicks and makes it go to the shoot Ammo function
			stage.addEventListener(MouseEvent.CLICK,shootAmmo);
		}

		public function moveShip(e:Event)
		{

			//Makes theShip's x and y position equal to the mouse's x and y position
			theShip.x = mouseX;
			theShip.y = mouseY;

			//movies the textbox down the screen
			lvl1.y +=  5;
			//once it reaces 550  tell it to stop and make it none visible
			if (lvl1.y > 550)
			{
				lvl1.y +=  0;
				lvl1.alpha = 0;
			}
		}
		public function shootAmmo(e:Event)
		{
			trace("pew pew pew");
			//checks to see if the activebullets is less the bulletArray's length go throught the condition
			if (activeBullets<bulletArray.length)
			{

				//would create the bullet within the array at the position of the ship
				addChildAt(bulletArray[activeBullets],getChildIndex(theShip));

				//making the x and y of that of theShip's x and y
				bulletArray[activeBullets].x = theShip.x;
				bulletArray[activeBullets].y = theShip.y;
				//increments the number
				activeBullets++;
			}
		}
		private function createBullet(howMany:Number):void
		{
			//having a for loop using the required number that was passed in to be the compared to the variable called count
			for (var count:int=0; count<howMany; count++)
			{

				//add a new bullet to the bulletArray
				bulletArray[count] = new bullet();
			}
			//trace("we made " + bulletArray.length + " bullets.");
		}

		private function testForHit(e:Event)
		{
			//for loop to make i the same number of bulletArray.length 
			for (var i:int=0; i<bulletArray.length; i++)
			{
				//for loop to make count the same number of enemyList.length 
				for (var count:int=0; count < activeEnemy; count++)
				{
					//checks to see if the enemy ship hits theShip. Also to see if the enemyList.shiphit is set to false 
					//if both conditions are true then continue on 
					if (enemyList[count].hitTestObject(theShip) == true && enemyList[count].shipHit == false)
					{

						trace("i was hit by " + enemyList[count]);
						//turns the shiphit to true 
						enemyList[count].shipHit = true;
						//trace(enemyList.length);
						//removeChild(theShip);
						//addChild(theShip)
						removeChild(createEnemy(enemyNum));

						//makes the enemy that was hit to be invisible
						//enemyList[count].visible = false;
						if (e.target == dumEne)
						{
							//make a new variable called tempEnemy that is a dumEne with the index of the enemy that was hit by the enemyLIst
							var tempEnemy:dumEne = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tempEnemy;

							//then decrement active enemy by one
							activeEnemy--;
						}
						else if (e.target==dumEne2)
						{
							//make a new variable called tempEnemy2 that is a dumEne2 with the index of the enemy that was hit by the enemyLIst
							var tempEnemy2:dumEne2 = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tempEnemy2;

							//then decrement active enemy by one
							activeEnemy--;
						}
						else if (e.target==dunEne3)
						{
							//make a new variable called tempEnemy3 that is a dumEne3 with the index of the enemy that was hit by the enemyLIst
							var tempEnemy3:dunEne3 = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tempEnemy3;

							//then decrement active enemy by one
							activeEnemy--;
						}
						//and changes the score by minusing 100 from the player's real score
						scoreChanger(-1000);

					}

					//checks to see if the enemy ship hits a bullet. Also to see if the enemyList.ishit is set to false 
					//if both conditions are true then continue on 
					else if (enemyList[count].hitTestObject(bulletArray[i]) == true && enemyList[count].isHit == false)
					{
						//turns the ishit to true 
						enemyList[count].isHit = true;
						enemyList[count].shipHit = true;
						trace("enemy " + count +  " was hit");
						//changes the score by adding 120 to the player's real score
						scoreChanger(120);

						//using object pooling 
						//removes the bullet from the stage
						removeChild(bulletArray[i]);

						// moves both x and y position to 0 so it does not colide with anything else
						bulletArray[i].x = 0;
						bulletArray[i].y = 0;

						//make a new variable called tempbullet that is a bullet with the index of the bullet that hit the enemy
						var tempBullet:bullet = bulletArray[i];

						// the removed index is now replaced with the currenet activebullets index which is Activebullets-1
						bulletArray[i] = bulletArray[activeBullets - 1];

						//then the new activeBullets-1 is equal to the number of tempbullet
						bulletArray[activeBullets - 1] = tempBullet;

						//then decrement active bullets by one
						activeBullets--;

						removeChild(createEnemy(enemyNum));
						
						//makes the enemy that was hit to be invisible
						//enemyList[count].visible = false;
						if (e.target == dumEne)
						{
							//make a new variable called tempEnemy that is a dumEne with the index of the enemy that was hit by the bullet
							var tempEnem:dumEne = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tempEnem;

							//then decrement active enemy by one
							activeEnemy--;
						}
						else if (e.target==dumEne2)
						{
							//make a new variable called tempEnemy that is a dumEne with the index of the enemy that was hit by the bullet
							var tempEnem2:dumEne2 = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tempEnem2;

							//then decrement active enemy by one
							activeEnemy--;
						}
						else if (e.target==dunEne3)
						{
							//make a new variable called tempEnemy that is a dumEne with the index of the enemy that was hit by the bullet
							var tempEnem3:dunEne3 = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tempEnem3;

							//then decrement active enemy by one
							activeEnemy--;
						}
					}



					else if (enemyList[count].y > stage.stageHeight)
					{
						
						enemyList[count].y=650;
						//enemyList[count].y+=3;
						removeChild(createEnemy(enemyNum));
						if (e.target == dumEne)
						{
							//make a new variable called tempEnemy that is a dumEne with the index of the enemy that was hit by the bullet
							var tepEnem:dumEne = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tepEnem;

							//then decrement active enemy by one
							activeEnemy--;
						}
						else if (e.target==dumEne2)
						{
							//make a new variable called tempEnemy that is a dumEne with the index of the enemy that was hit by the bullet
							var tepEnem2:dumEne2 = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tepEnem2;

							//then decrement active enemy by one
							activeEnemy--;
						}
						else if (e.target==dunEne3)
						{
							//make a new variable called tempEnemy that is a dumEne with the index of the enemy that was hit by the bullet
							var tepEnem3:dunEne3 = enemyList[count];

							// the removed index is now replaced with the currenet activeEnemy index which is ActiveEnemy-1
							enemyList[count] = enemyList[activeEnemy - 1];

							//then the new activeEnemy-1 is equal to the number of tempEnemy
							enemyList[activeEnemy - 1] = tepEnem3;

							//then decrement active enemy by one
							activeEnemy--;
						}
						
					}

				}
			}

		}
		private function menu():void
		{
			spawnTimer=10000;
			gotoAndStop(5);
		}

		//fucntion that requires a number to be passed in
		private function scoreChanger(chagetheScore:int):void
		{

			//making a new variable that is an int
			var scoreAsNumber:int;

			//making a variable that is a string
			var scoreAsText:String;

			//setting the int equal to the int of the textbox
			scoreAsNumber = int(score.text);

			//making the int value equal the number that is required to make function work
			scoreAsNumber +=  chagetheScore;

			//making the text of the string equal to that of the number
			scoreAsText = String(scoreAsNumber);

			//having the textbox equal to the new number and display it 
			score.text = scoreAsText;

		}

	}

}