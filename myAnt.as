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
	import flash.events.TimerEvent;
	
	//myAnt = my Antagonist
	public class myAnt extends MovieClip {
		
		private var core:Object; 
		private const OFFSTAGE:int=400;
		private var antSpeed:int = 5;
		
		public function myAnt():void{
			this.addEventListener(Event.ADDED_TO_STAGE, onStart);
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		function onStart(e:Event): void{
			this.x = Math.random() * stage.stageWidth;
			this.y = 0 - this.height;

		}
		function loop(e:Event):void{
			antSpeed = 5;
			this.y += antSpeed;
			
		}
	}
}

