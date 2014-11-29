package io.plugin.godsend
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.ui.Mouse;
	import flash.utils.getDefinitionByName;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import Math;
	
	/**
	 * ...
	 * @author Fraser
	 */
	public class Preloader extends MovieClip 
	{	
		[Embed(source = '../../../../lib/images/icons/loading.png')]
		public var loadingPic: Class;
		
		[Embed(source = '../../../../lib/images/icons/playz.png')]
		public var finishedLoading1: Class;
		
		[Embed(source = '../../../../lib/images/icons/playz2.png')]
		public var finishedLoading2: Class;
		
		[Embed(source = '../../../../lib/images/icons/loadingImage.png')]
		public var fullLoadingImage: Class;
		
		private var showLoadingScreen: Bitmap = new loadingPic();
		private var _finished:SimpleButton;
		private var completed1: Bitmap = new finishedLoading1();
		private var completed2: Bitmap = new finishedLoading2();
		private var _fullLoadingImage: Bitmap = new fullLoadingImage();
		private var _newTxtBox: TextField;
		private var _newTxtFormat: TextFormat;
		
		private var loader:Sprite;
		private var rect:Sprite;
		private var rectBG:Sprite;
		private var w:Number = 265;
		
		private var percentComplete:String;
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			
			//create a loading bar
			rect = new Sprite();
			rectBG = new Sprite();
			rectBG.graphics.beginFill(0x009DFF, 1);
			rectBG.graphics.drawRect(0, 0, 265, 30);
			rectBG.graphics.endFill();
			rect.graphics.beginFill(0xC7B600, 1);
			rect.graphics.drawRect(0, 0, 200, 30);
			rect.graphics.endFill();
			rect.graphics.lineStyle(0, 0);
            rect.graphics.drawRect(0, 0, 200, 29);
            rect.graphics.lineStyle();
			addChild(rectBG);
			addChild(rect);			
			rect.x = 265;
			rect.y = 379;
			rectBG.x = 265;
			rectBG.y = 379;			
			
			addChild(_fullLoadingImage);
			
			_finished = new SimpleButton( completed1, completed2, completed2, completed2 );
			_finished.x = 250;
			_finished.y = 275;
			addChild(_finished);
			_finished.visible = false;
			
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);			
			_finished.addEventListener(MouseEvent.CLICK, onMyClick);
			
			showLoadingScreen.x = 250;
			showLoadingScreen.y = 275;
			addChild(showLoadingScreen);
			
			_newTxtFormat = new TextFormat;
			_newTxtFormat.color = 0x1C1C1C;
			_newTxtFormat.bold = true;
			
			_newTxtBox = new TextField;
			_newTxtBox.defaultTextFormat = _newTxtFormat;
			_newTxtBox.width = 100;
			_newTxtBox.height = 30;
			_newTxtBox.x = 384;
			_newTxtBox.y = 384;
			addChild(_newTxtBox);
		}
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void 
		{
			rect.width = (e.bytesLoaded  / e.bytesTotal) * w;
			percentComplete = String(((e.bytesLoaded  / e.bytesTotal) * 100).toFixed(1));
			_newTxtBox.text = percentComplete + "%";
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void 
		{
			_finished.visible = true;
			showLoadingScreen.visible = false;		
		}
		
		private function onMyClick(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			removeChild(_finished);
			removeChild(_newTxtBox);
			removeChild(rect);
			removeChild(rectBG);
			removeChild(_fullLoadingImage);
			startup();
		}
		
		private function startup():void 
		{
			var mainClass:Class = getDefinitionByName("io.plugin.godsend.Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}
		
	}
	
}