/****************
Author: Caitlin Davison
Date:16/06/22
Resources:
Finding solution to Error 1037 Packages cannot be nested - https://stackoverflow.com/questions/545124/actionscript-3-error-1037-packages-cannot-be-nested
Removing Children from the Stage - https://community.adobe.com/t5/animate-discussions/how-do-i-remove-all-children-from-stage-at-a-given-index-position/m-p/4942914 
Code - Adapted from Phil Legge
Code - Adapted from Sam Davison
***************/

package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	
	//myPro = my Protagonist
	public class myPro extends MovieClip {
		
		private var core:Object; 
		//variables for key presses left and right
		private var leftPressed:Boolean = false;
		private var rightPressed:Boolean = false;
		//variable for myPro speed
		private var mySpeed:Number = 10;
		
		public function myPro() {
			this.addEventListener(Event.ADDED_TO_STAGE, onAdd);
		}
		
		private function onAdd(e:Event) :void{
			//adding myPro to stage and setting position
			core = MovieClip(root);
			this.y = 640;
			this.x = core.stage.stageWidth/2;
			
			this.addEventListener(Event.ENTER_FRAME,loop);
		}	
	
		private function loop(e:Event):void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			stage.addEventListener(Event.ENTER_FRAME, keyControl);
			bound();
			
		}
		
		private function keyControl(e:Event):void{
			//declare speed
			mySpeed = 10;
			
			//move left
			if(leftPressed){
				x -= mySpeed;
			}
		
			//move right
			if(rightPressed){
				x += mySpeed;
			}
		}
		
		private function onKeyPress(e:KeyboardEvent): void{
			//setting left and right variables to true on keyDown
			if(e.keyCode == Keyboard.LEFT){
				leftPressed = true;
			}
			if(e.keyCode == Keyboard.RIGHT){
				rightPressed = true;
			}
		}
		
		private function onKeyRelease(e:KeyboardEvent):void{
			//setting left and right variables to false on keyUp
			if(e.keyCode == Keyboard.LEFT){
				leftPressed = false;
			}
			if(e.keyCode == Keyboard.RIGHT){
				rightPressed = false;
			}
		}
		
		private function bound():void{
			
			//setting boundaries of the stage and entering on other side
			if(leftPressed && this.x - this.width/2 < 0){
				leftPressed = false;
			}
			else{
				mySpeed = 5;
			}
			
			
			if(rightPressed && this.x + this.width/2 > stage.stageWidth){
				rightPressed = false;
			}
			else{
				mySpeed = 5;
			}
		}
		
	
		
	}
}



