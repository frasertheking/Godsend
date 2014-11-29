package io.plugin.godsend.assets 
{
	import alternativa.engine3d.materials.TextureMaterial;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import io.plugin.godsend.managers.SelectionManager;
	import io.plugin.godsend.managers.SelectionStateEnum;

	public class HUD extends Sprite 
	{
		
		[Embed(source = '../../../../../lib/images/icons/escapee.png')]
		private var EscapeeClass: Class;
		
		[Embed(source = '../../../../../lib/images/icons/escapee2.png')]
		private var EscapeeClass2: Class;
		
		[Embed(source = '../../../../../lib/images/icons/escapee3.png')]
		private var EscapeeClass3: Class;
		
		[Embed(source = '../../../../../lib/images/icons/up.png')]
		private var Up: Class;
		
		[Embed(source = '../../../../../lib/images/icons/up2.png')]
		private var Up2: Class;
		
		[Embed(source = '../../../../../lib/images/icons/up3.png')]
		private var Up3: Class;
		
		[Embed(source = '../../../../../lib/images/icons/down.png')]
		private var Down: Class;
		
		[Embed(source = '../../../../../lib/images/icons/down2.png')]
		private var Down2: Class;
		
		[Embed(source = '../../../../../lib/images/icons/down3.png')]
		private var Down3: Class;
		
		[Embed(source = '../../../../../lib/images/icons/rotate.png')]
		private var Rotate: Class;
		
		[Embed(source = '../../../../../lib/images/icons/rotate2.png')]
		private var Rotate2: Class;
		
		[Embed(source = '../../../../../lib/images/icons/rotate3.png')]
		private var Rotate3: Class;
		
		// Extra GUI Components
		[Embed(source = '../../../../../lib/images/icons/seperate.png')]
		private var Seperate: Class;
		
		[Embed(source = '../../../../../lib/images/icons/bottomspan.png')]
		private var BottomBar: Class;
		
		[Embed(source = '../../../../../lib/images/icons/title.png')]
		private var gameTitle: Class;
		
		[Embed(source = '../../../../../lib/images/icons/textBox.png')]
		private var textBox: Class;
		
		private var _textField: TextField;
		private var _textField2: TextField;
		private var _textField3: TextField;
		
		private var _freezeCD:TextField;
		private var _swimCD:TextField;
		private var _swimLeft:TextField;
		private var _freezeLeft:TextField;
		private var _rain:TextField;
		
		private var _selectEscapee: SimpleButton;
		private var _upButton: SimpleButton;
		private var _downButton: SimpleButton;
		private var _rotateButton: SimpleButton;
		private var _topLeftTitleButton: SimpleButton;
		
		private var _selectionManager: SelectionManager;
		
		public function HUD( selectionManager: SelectionManager ) 
		{
			
			_selectionManager = selectionManager;
			
			var GUIBottomBar: Bitmap = new  BottomBar();
			GUIBottomBar.x = 0;
			GUIBottomBar.y = 550;
			addChild( GUIBottomBar );
			
			var myTextBox: Bitmap = new  textBox();
			myTextBox.x = -2;
			myTextBox.y = 490;
			addChild( myTextBox );
			
			var seperate: Bitmap = new  Seperate();
			seperate.x = 215;
			seperate.y = 552;
			addChild( seperate );
			
			var seperate2: Bitmap = new  Seperate();
			seperate2.x = 418;
			seperate2.y = 552;
			addChild( seperate2 );
			
			_textField = new TextField();
			_textField.textColor = 0xffffff;
			_textField.height = 100;
			_textField.width = 250;
			_textField.x = 4;
			_textField.y = 513;
			_textField.selectable = false;
			
			_textField2 = new TextField();
			_textField2.textColor = 0xffffff;
			_textField2.height = 75;
			_textField2.width = 200;
			_textField2.x = 700;
			_textField2.y = 560;
			_textField2.selectable = false;
			
			_textField3 = new TextField();
			_textField3.textColor = 0xffffff;
			_textField3.height = 75;
			_textField3.width = 200;
			_textField3.x = 758;
			_textField3.y = 578;
			_textField3.selectable = false;
			
			_freezeCD = new TextField();
			_freezeCD.textColor = 0xE3E3E3;
			_freezeCD.height = 50;
			_freezeCD.width = 225;
			_freezeCD.x = 10;
			_freezeCD.y = 75;
			_freezeCD.alpha = 0.9;
			_freezeCD.mouseEnabled = false;
			_freezeCD.selectable = false;
			
			_rain = new TextField();
			_rain.textColor = 0xE3E3E3;
			_rain.height = 50;
			_rain.width = 225;
			_rain.x = 10;
			_rain.y = 90;
			_rain.alpha = 0.9;
			_rain.mouseEnabled = false;
			_rain.selectable = false;
			
			_swimCD = new TextField();
			_swimCD.textColor = 0xE3E3E3;
			_swimCD.height = 50;
			_swimCD.width = 225;
			_swimCD.x = 10;
			_swimCD.y = 45;
			_swimCD.alpha = 0.9;
			_swimCD.mouseEnabled = false;
			_swimCD.selectable = false;
			
			_swimLeft = new TextField();
			_swimLeft.textColor = 0xE3E3E3;
			_swimLeft.height = 50;
			_swimLeft.width = 225;
			_swimLeft.x = 10;
			_swimLeft.y = 30;			
			_swimLeft.alpha = 0.9;		
			_swimLeft.mouseEnabled = false;	
			_swimLeft.selectable = false;
			
			_freezeLeft = new TextField();
			_freezeLeft.textColor = 0xE3E3E3;
			_freezeLeft.height = 50;
			_freezeLeft.width = 225;
			_freezeLeft.x = 10;
			_freezeLeft.y = 60;
			_freezeLeft.alpha = 0.9;
			_freezeLeft.mouseEnabled = false;
			_freezeLeft.selectable = false;
			
			addChild(_swimCD);
			
			addChild(_swimLeft);
			
			addChild(_freezeLeft);			
			
			addChild(_freezeCD);
			
			addChild(_rain);
			
			_swimCD.mouseEnabled = false;
			_freezeCD.mouseEnabled = false;
			_swimLeft.mouseEnabled = false;
			_freezeLeft.mouseEnabled = false;
			_rain.mouseEnabled = false;
			
			addChild( _textField );
			
			addChild( _textField2 );
			
			addChild( _textField3 );
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStageHandler );

			var selectEscapee: Bitmap = new  EscapeeClass();
			var selectEscapee2: Bitmap = new  EscapeeClass2();
			var selectEscapee3: Bitmap = new  EscapeeClass3();
			_selectEscapee = new SimpleButton( selectEscapee, selectEscapee2, selectEscapee3, selectEscapee );
			_selectEscapee.x = 25;
			_selectEscapee.y = 560;
			addChild( _selectEscapee );
			
			var rotate: Bitmap = new Rotate();
			var rotate2: Bitmap = new Rotate2();
			var rotate3: Bitmap = new Rotate3();
			_rotateButton = new SimpleButton( rotate, rotate2, rotate3, rotate );
			_rotateButton.x = 75;
			_rotateButton.y = 560;
			addChild( _rotateButton );
			
			var up: Bitmap = new Up();
			var up2: Bitmap = new Up2();
			var up3: Bitmap = new Up3();
			_upButton = new SimpleButton( up, up2, up3, up );
			_upButton.x = 125;
			_upButton.y = 560;
			addChild( _upButton );
			
			var down: Bitmap = new Down();
			var down2: Bitmap = new Down2();
			var down3: Bitmap = new Down3();
			_downButton = new SimpleButton( down, down2, down3, down );
			_downButton.x = 175;
			_downButton.y = 560;
			addChild( _downButton );
			
			var Title: Bitmap = new  gameTitle();
			_topLeftTitleButton =  new SimpleButton( Title, Title, Title, Title );
			_topLeftTitleButton.x = 15;
			_topLeftTitleButton.y = 15;
			//addChild( _topLeftTitleButton );
			
			
			_rotateButton.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
		}
		
		private function onAddedToStageHandler( e: Event ): void
		{
			_topLeftTitleButton.addEventListener(MouseEvent.MOUSE_OVER, _topLeftTitleMouseOverHandler);
			_topLeftTitleButton.addEventListener(MouseEvent.MOUSE_OUT, _topLeftTitleMouseOutHandler);
			_selectEscapee.addEventListener(MouseEvent.CLICK, onSelectEscapeeButtonClickHandler);
			_rotateButton.addEventListener(MouseEvent.CLICK, onRotateButtonClickHandler);
			_upButton.addEventListener(MouseEvent.CLICK, onUpButtonClickHandler);
			_downButton.addEventListener(MouseEvent.CLICK, onDownButtonClickHandler);
			_selectEscapee.addEventListener( MouseEvent.MOUSE_OVER, _selectEscapeeMouseOverHandler );
			_rotateButton.addEventListener( MouseEvent.MOUSE_OVER, _rotateButtonMouseOverHandler );
			_upButton.addEventListener( MouseEvent.MOUSE_OVER, _upButtonMouseOverHandler );
			_downButton.addEventListener( MouseEvent.MOUSE_OVER, _downButtonMouseOverHandler );
			_selectEscapee.addEventListener( MouseEvent.MOUSE_OUT, _selectEscapeeMouseOutHandler );
			_rotateButton.addEventListener( MouseEvent.MOUSE_OUT, _rotateButtonMouseOutHandler );
			_upButton.addEventListener( MouseEvent.MOUSE_OUT, _upButtonMouseOutHandler );
			_downButton.addEventListener( MouseEvent.MOUSE_OUT, _downButtonMouseOutHandler );			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function _topLeftTitleMouseOverHandler( e: MouseEvent ): void
		{
			setDetailText( 'Godsend was created by Fraser King\nfor the 2012 DIGIS competition!' );
		}
		private function _selectEscapeeMouseOverHandler( e: MouseEvent ): void
		{
			setDetailText( 'Control the movements of your tribe members.' );
		}
		private function _rotateButtonMouseOverHandler( e: MouseEvent ): void
		{
			setDetailText( 'Move the Godsend around.' );
		}
		private function _upButtonMouseOverHandler( e: MouseEvent ): void
		{
			setDetailText( 'Raise the earth.' );
		}
		private function _downButtonMouseOverHandler( e: MouseEvent ): void
		{
			setDetailText( 'Lower the earth.' );
		}
		private function _topLeftTitleMouseOutHandler( e: MouseEvent ): void
		{
			setDetailText( '' );
		}
		private function _selectEscapeeMouseOutHandler( e: MouseEvent ): void
		{
			setDetailText( '' );
		}
		private function _rotateButtonMouseOutHandler( e: MouseEvent ): void
		{
			setDetailText( '' );
		}
		private function _upButtonMouseOutHandler( e: MouseEvent ): void
		{
			setDetailText( '' );
		}
		private function _downButtonMouseOutHandler( e: MouseEvent ): void
		{
			setDetailText( '' );
		}
		
		
		private function keyDownHandler(e:KeyboardEvent):void {
			var character:String = String.fromCharCode(e.charCode);

			if (e.keyCode == 49)
			{
				_selectionManager.selectionState = SelectionStateEnum.ESCAPEE_MOVE;
				_selectEscapee.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
				_rotateButton.filters = [];
				_upButton.filters = []
				_downButton.filters = [];
			}
			else if (e.keyCode == 50)
			{
				_selectionManager.selectionState = SelectionStateEnum.MOVING_CAMERA;
				_rotateButton.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
				_selectEscapee.filters = [];
				_upButton.filters = []
				_downButton.filters = [];
			}
			else if (e.keyCode == 51)
			{
				_selectionManager.selectionState = SelectionStateEnum.LAND_RAISE;
				_upButton.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
				_selectEscapee.filters = [];
				_rotateButton.filters = [];
				_downButton.filters = [];
			}
			else if (e.keyCode == 52)
			{
				_selectionManager.selectionState = SelectionStateEnum.LAND_LOWER;
				_downButton.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
				_selectEscapee.filters = [];
				_rotateButton.filters = [];
				_upButton.filters = [];
			}
		}
		
		private function onSelectEscapeeButtonClickHandler( e: MouseEvent ): void
		{
			_selectionManager.selectionState = SelectionStateEnum.ESCAPEE_MOVE;
			_selectEscapee.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
			_rotateButton.filters = [];
			_upButton.filters = []
			_downButton.filters = [];
		}
		
		private function onRotateButtonClickHandler( e: MouseEvent ): void
		{
			_selectionManager.selectionState = SelectionStateEnum.MOVING_CAMERA;
			_rotateButton.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
			_selectEscapee.filters = [];
			_upButton.filters = []
			_downButton.filters = [];
		}
		
		private function onUpButtonClickHandler( e: MouseEvent ): void
		{
			_selectionManager.selectionState = SelectionStateEnum.LAND_RAISE;
			_upButton.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
			_selectEscapee.filters = [];
			_rotateButton.filters = [];
			_downButton.filters = [];
		}
		
		private function onDownButtonClickHandler( e: MouseEvent ): void
		{
			_selectionManager.selectionState = SelectionStateEnum.LAND_LOWER;
			_downButton.filters = [ new GlowFilter( 0x00b5d6, 1, 10, 10, 4 ) ];
			_selectEscapee.filters = [];
			_rotateButton.filters = [];
			_upButton.filters = [];
		}
		
		public function setDetailText( string: String ): void
		{
			_textField.text = string;
		}
		
		public function setDetailText2( string: String ): void
		{
			_textField2.text = string;
		}
		
		public function setDetailText3( string: String ): void
		{
			_textField3.text = string;
		}
		
		public function setDetailText4( string: String ): void
		{
			_freezeCD.text = string;
		}
		
		public function setDetailText5( string: String ): void
		{
			_swimCD.text = string;
		}
		
		public function setDetailText6( string: String ): void
		{
			_freezeLeft.text = string;
		}
		
		public function setDetailText7( string: String ): void
		{
			_swimLeft.text = string;
		}
		
		public function setDetailText8( string: String ): void
		{
			_rain.text = string;
		}
	}

}