package io.plugin.godsend
{
	import adobe.utils.CustomActions;
	import alternativa.Alternativa3D;
	import alternativa.engine3d.containers.BSPContainer;
	import alternativa.engine3d.containers.ConflictContainer;
	import alternativa.engine3d.containers.DistanceSortContainer;
	import alternativa.engine3d.controllers.SimpleObjectController;	
    import alternativa.engine3d.core.EllipsoidCollider;
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.Debug;
	import alternativa.engine3d.core.Face;
	import alternativa.engine3d.core.Light3D;
	import alternativa.engine3d.core.MouseEvent3D;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.core.Object3DContainer;
	import alternativa.engine3d.core.RayIntersectionData;
	import alternativa.engine3d.core.Sorting;
	import alternativa.engine3d.core.Vertex;
	import alternativa.engine3d.core.View;
	import alternativa.engine3d.materials.FillMaterial;
	import alternativa.engine3d.materials.Material;
	import alternativa.engine3d.materials.TextureMaterial;
	import alternativa.engine3d.objects.BSP;
	import alternativa.engine3d.objects.Mesh;
	import alternativa.engine3d.objects.Sprite3D;
	import alternativa.engine3d.primitives.GeoSphere;
	import alternativa.engine3d.primitives.Plane;
	import alternativa.engine3d.primitives.Sphere;
	import alternativa.engine3d.objects.SkyBox;
	import alternativa.engine3d.primitives.*;
	import alternativa.engine3d.materials.NormalMapMaterial;
	import caurina.transitions.Tweener;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shader;
	import flash.net.drm.DRMVoucherDownloadContext;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	import io.plugin.godsend.assets.Escapee;
	import io.plugin.godsend.assets.HUD;
	import io.plugin.godsend.assets.FPSCounter;
	import io.plugin.godsend.controllers.TheMegaController;
	import io.plugin.godsend.level.ILevel;
	import io.plugin.godsend.level.Level1;
	import io.plugin.godsend.managers.EscapeeManager;
	import io.plugin.godsend.managers.GameManager;
	import io.plugin.godsend.managers.GameStateEnum;
	import io.plugin.godsend.managers.LevelManager;
	import io.plugin.godsend.managers.SelectionManager;
	import io.plugin.godsend.managers.SelectionStateEnum;
	import io.plugin.godsend.terrain.Terrain;
	import io.plugin.godsend.assets.FluidPlane;
	import io.plugin.godsend.assets.TerrainBar;
	import flash.media.SoundChannel;
	
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
	import flash.display.Loader;
	import flash.system.LoaderContext;
	import flash.system.ApplicationDomain;
	
	import fl.controls.Slider;
	import fl.controls.CheckBox;
	import fl.events.SliderEvent;	
	import fl.controls.RadioButton;
	
	import fl.managers.FocusManager;
	import fl.managers.IFocusManager;	
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import io.plugin.godsend.assets.Skybox;
	import io.plugin.godsend.Preloader;
	import fl.video.*;
	import fl.video.VideoEvent;
	import flash.events.MouseEvent;
	import io.plugin.godsend.assets.Rain;
	import flash.net.SharedObject;
	
	import alternativa.engine3d.loaders.Parser3DS;
	import flash.utils.ByteArray;
	import alternativa.engine3d.objects.Mesh;	
	
    import flash.utils.getTimer;
	
	[SWF(width = "800", height = "600",  backgroundColor = "#5294ff", frameRate = "24")]
	[Frame(factoryClass="io.plugin.godsend.Preloader")]
	
	public class Main extends Sprite 
	{
		
		[Embed(source = '../../../../lib/images/icons/expand.png')]
		public var Expand: Class;
		
		[Embed(source = '../../../../lib/images/icons/expand2.png')]
		public var Expand2: Class;
		
		[Embed(source = '../../../../lib/images/icons/expand3.png')]
		public var Expand3: Class;
		
		[Embed(source = '../../../../lib/images/icons/contract.png')]
		public var Contract: Class;
		
		[Embed(source = '../../../../lib/images/icons/contract2.png')]
		public var Contract2: Class;
		
		[Embed(source = '../../../../lib/images/icons/contract3.png')]
		public var Contract3: Class;
		
		[Embed(source = '../../../../lib/images/icons/increaseStrength.png')]
		public var increaseStrength: Class;
		
		[Embed(source = '../../../../lib/images/icons/increaseStrength2.png')]
		public var increaseStrength2: Class;
		
		[Embed(source = '../../../../lib/images/icons/increaseStrength3.png')]
		public var increaseStrength3: Class;
		
		[Embed(source = '../../../../lib/images/icons/decreaseStrength.png')]
		public var decreaseStrength: Class;
		
		[Embed(source = '../../../../lib/images/icons/decreaseStrength2.png')]
		public var decreaseStrength2: Class;
		
		[Embed(source = '../../../../lib/images/icons/decreaseStrength3.png')]
		public var decreaseStrength3: Class;
		
		[Embed(source = '../../../../lib/images/icons/evaporate.png')]
		public var Evaporate: Class;
		
		[Embed(source = '../../../../lib/images/icons/evaporate2.png')]
		public var Evaporate2: Class;
		
		[Embed(source = '../../../../lib/images/icons/evaporate3.png')]
		public var Evaporate3: Class;
		
		[Embed(source = '../../../../lib/images/icons/freeze.png')]
		public var Freeze: Class;
		
		[Embed(source = '../../../../lib/images/icons/freeze2.png')]
		public var Freeze2: Class;
		
		[Embed(source = '../../../../lib/images/icons/freeze3.png')]
		public var Freeze3: Class;
		
		[Embed(source = '../../../../lib/images/icons/swim.png')]
		public var Swim: Class;
		
		[Embed(source = '../../../../lib/images/icons/swim2.png')]
		public var Swim2: Class;
		
		[Embed(source = '../../../../lib/images/icons/swim3.png')]
		public var Swim3: Class;
		
		[Embed(source = '../../../../lib/images/icons/waterScreen.png')]
		public var waterScreen: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameOverScreen.png')]
		public var gameOverScreen: Class;
		
		[Embed(source = '../../../../lib/images/icons/save1.png')]
		public var save1: Class;
		
		[Embed(source = '../../../../lib/images/icons/save2.png')]
		public var save2: Class;
		
		[Embed(source = '../../../../lib/images/icons/dim.png')]
		public var Dim: Class;
		
		[Embed(source = '../../../../lib/images/icons/play.png')]
		public var startGame: Class;
		
		[Embed(source = '../../../../lib/images/icons/play2.png')]
		public var startGame2: Class;

		[Embed(source = '../../../../lib/images/icons/fraser.png')]
		public var fraser: Class;
		
		[Embed(source = '../../../../lib/images/icons/chris.png')]
		public var chris: Class;
		
		[Embed(source = '../../../../lib/images/icons/ty.png')]
		public var ty: Class;
		
		[Embed(source = '../../../../lib/images/icons/tyler.png')]
		public var tyler: Class;
		
		[Embed(source = '../../../../lib/images/icons/mike.png')]
		public var mike: Class;
		
		[Embed(source = '../../../../lib/images/icons/all.png')]
		public var all: Class;
		
		[Embed(source = '../../../../lib/images/icons/nextLevelScreen.png')]
		public var nextLevelScreen: Class;
		
		[Embed(source = '../../../../lib/images/icons/cCursor.png')]
		public var cCursor: Class;
		
		[Embed(source = '../../../../lib/images/icons/dead.png')]
		public var dead: Class;
		
		[Embed(source = '../../../../lib/images/icons/escaped.png')]
		public var escaped: Class;
		
		[Embed(source = '../../../../lib/images/icons/options.png')]
		public var gameOption: Class;
		
		[Embed(source = '../../../../lib/images/icons/options2.png')]
		public var gameOption2: Class;
		
		[Embed(source = '../../../../lib/images/icons/qualityPic.png')]
		public var quality: Class;
		
		[Embed(source = '../../../../lib/images/icons/qualityBGBox.png')]
		public var qualityBGBox: Class;
		
		[Embed(source = '../../../../lib/images/icons/difficulty.png')]
		public var difficulty: Class;
		
		[Embed(source = '../../../../lib/images/icons/descriptionBG.png')]
		public var descriptionBG: Class;
		
		[Embed(source = '../../../../lib/images/icons/info.png')]
		public var info: Class;
		
		[Embed(source = '../../../../lib/images/icons/info2.png')]
		public var info2: Class;
		
		[Embed(source = '../../../../lib/images/icons/controls.png')]
		public var controls: Class;
		
		[Embed(source = '../../../../lib/images/icons/controls2.png')]
		public var controls2: Class;
		
		[Embed(source = '../../../../lib/images/icons/vidBG.png')]
		public var vidBG: Class;
		
		[Embed(source = '../../../../lib/images/icons/myNewWater.png')] 
		static private const FluidDiffuse:Class;
		
		[Embed(source = '../../../../lib/images/icons/minimap.png')]
		private var minimapTitle: Class;
		
		[Embed(source = '../../../../lib/images/icons/cameraIcon.png')]
		private var cameraIcon: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapOne.png')]
		private var minimapOne: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapTwo.png')]
		private var minimapTwo: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapThree.png')]
		private var minimapThree: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapFour.png')]
		private var minimapFour: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapFive.png')]
		private var minimapFive: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapIce.png')]
		private var minimapIce: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapEvaporate.png')]
		private var minimapEvaporate: Class;
		
		[Embed(source = '../../../../lib/images/icons/minimapSwim.png')]
		private var minimapSwim: Class;
		
		[Embed(source = '../../../../lib/images/icons/miniMapBorder.png')]
		private var miniMapBorder: Class;
		
		[Embed(source = '../../../../lib/images/icons/controlsExplained.png')]
		private var controlsExplained: Class;
		
		[Embed(source = '../../../../lib/images/icons/infoExplained.png')]
		private var infoExplained: Class;
		
		[Embed(source = '../../../../lib/images/icons/optionsExplained.png')]
		private var optionsExplained: Class;
		
		[Embed(source = '../../../../lib/images/icons/version.png')]
		private var version: Class;
		
		[Embed(source = '../../../../lib/images/icons/title2.png')]
		private var title2: Class;
		
		[Embed(source = '../../../../lib/images/icons/load.png')]
		private var load1: Class;
		
		[Embed(source = '../../../../lib/images/icons/load2.png')]
		private var load2: Class;
		
		[Embed(source = '../../../../lib/images/icons/load3.png')]
		private var load3: Class;
		
		[Embed(source = '../../../../lib/images/icons/pauseGameMenu.png')]
		private var pauseMenu: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameMenuOption1.png')]
		private var gameMenuOption1: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameMenuOption1a.png')]
		private var gameMenuOption1a: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameMenuOption2.png')]
		private var gameMenuOption2: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameMenuOption2a.png')]
		private var gameMenuOption2a: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameMenuOption3.png')]
		private var gameMenuOption3: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameMenuOption3a.png')]
		private var gameMenuOption3a: Class;
		
		[Embed(source = '../../../../lib/images/icons/gameSaved.png')]
		private var gameSaved: Class;
		
		[Embed(source = '../../../../lib/images/icons/loadingScreen.png')]
		private var loadingScreenBG: Class;
		
		[Embed(source = '../../../../lib/images/icons/lowPerformance.png')]
		private var lowPerformance: Class;
		
		[Embed(source = '../../../../lib/images/icons/world1.png')]
		private var world1: Class;
		
		[Embed(source = '../../../../lib/images/icons/world2.png')]
		private var world2: Class;
		
		[Embed(source = '../../../../lib/images/icons/world3.png')]
		private var world3: Class;
		
		[Embed(source = '../../../../lib/images/icons/world4.png')]
		private var world4: Class;
		
		[Embed(source = '../../../../lib/images/icons/world5.png')]
		private var world5: Class;
		
		[Embed(source = '../../../../lib/images/icons/world6.png')]
		private var world6: Class;
		
		[Embed(source = '../../../../lib/images/icons/return.png')]
		private var returnToMainMenu: Class;
		
		[Embed(source = '../../../../lib/images/icons/return2.png')]
		private var returnToMainMenu2: Class;
		
		[Embed(source = '../../../../lib/images/icons/finishedscreen.png')]
		private var scoreingScreen: Class;
		
		[Embed(source = '../../../../lib/images/icons/groundCursor.png')]
		private var newExitBtn: Class;
		
		[Embed(source = '../../../../lib/images/icons/groundCursor2.png')]
		private var newExitBtn2: Class;
		
		[Embed(source = '../../../../lib/images/icons/returnToMainMenu.png')]
		private var returnToMainMenuabc: Class;
		
		[Embed(source = '../../../../lib/images/icons/returnToMainMenuB.png')]
		private var returnToMainMenuabcd: Class;
		
		[Embed(source = '../../../../lib/images/icons/cooldownBG.png')]
		private var cooldownBG: Class;
		
		[Embed(source = '../../../../lib/images/icons/cooldownBG1.png')]
		private var cooldownBG1: Class;
		
		[Embed(source = '../../../../lib/images/icons/exitWithoutSaving.png')]
		private var exitWithoutSavingImg: Class;
		
		[Embed(source = '../../../../lib/images/icons/continuee1.png')]
		private var continuee1: Class;
		
		[Embed(source = '../../../../lib/images/icons/continuee2.png')]
		private var continuee2: Class;
		
		[Embed(source = '../../../../lib/images/icons/return1.png')]
		private var return1: Class;
		
		[Embed(source = '../../../../lib/images/icons/returnn2.png')]
		private var return2: Class;
		
		[Embed(source = '../../../../lib/sounds/click.MP3')] 		 
		private var clickSound: Class; 		 
		private var myClickSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/hover.MP3')] 		 
		private var hoverSound: Class;
		
		[Embed(source = '../../../../lib/sounds/cantdothat.mp3')] 		 
		private var cantSound: Class; 		 
		private var myCantSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/ocean.mp3')] 		 
		private var oceanSound: Class; 		 
		private var myOceanSound: Sound;
		private var myOceanChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = '../../../../lib/sounds/quake.mp3')] 		 
		private var quakeSound: Class; 		 
		private var myQuakeSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/rain.mp3')] 		 
		private var rainSound: Class; 		 
		private var myRainSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/gather.mp3')] 		 
		private var gatherSound: Class; 		 
		private var myGatherSound: Sound;
		private var myGatherChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = '../../../../lib/sounds/release.mp3')] 		 
		private var releaseSound: Class; 		 
		private var myReleaseSound: Sound;
		private var myReleaseChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = '../../../../lib/sounds/CDfinished.mp3')] 		 
		private var CDfinishedSound: Class; 		 
		private var myCDfinishedSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/tidalWave.mp3')] 		 
		private var tidalWaveSound: Class; 		 
		private var mytidalWaveSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/chatPop.mp3')] 		 
		private var chatSound: Class; 		 
		private var myChatSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/dead.mp3')] 		 
		private var deadSound: Class; 		 
		private var myDeadSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/escaped.mp3')] 		 
		private var escapedSound: Class; 		 
		private var myEscapedSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/select.mp3')] 		 
		private var selectSound: Class; 		 
		private var mySelectSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/evaporate.mp3')] 		 
		private var evaporateSound: Class; 		 
		private var myEvaporateSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/swimSplash.mp3')] 		 
		private var swimSound: Class; 		 
		private var mySwimSound: Sound;
		
		[Embed(source = '../../../../lib/sounds/ice.mp3')] 		 
		private var iceSound: Class; 		 
		private var myIceSound: Sound;
		
		[Embed(source = '../../../../lib/3dModels/zigdiff.jpg')]
		private var myZigguratbmd: Class;
		
		[Embed(source = '../../../../lib/3dModels/waterWrapper.png')]
		private var myWavebmd: Class;
		
		[Embed(source = '../../../../lib/3dModels/myRock.png')]
		private var myRock1bmd: Class;
		
		private var myZigguratbm:Bitmap = new myZigguratbmd();
		
		private var myWavebm:Bitmap = new myWavebmd();
		
		private var myRock1bm:Bitmap = new myRock1bmd();

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//CONTAINERS		
		private var _rootContainer:BSPContainer = new BSPContainer();
		private var _rootContainer2:Object3DContainer = new Object3DContainer();
		private var skyboxContainer:BSPContainer = new BSPContainer();
		
		private var _camera:Camera3D;
		private var _minimapCamera:Camera3D;
		private var _controller:TheMegaController;
		
		private var _terrain: Terrain;
		private var _water: Plane;
		private var _exitPoint: GeoSphere;
		private var _skill1: GeoSphere;
		private var _skill2: GeoSphere;
		private var _skill3: GeoSphere;
		
		private var _player: Escapee;
		
		private var _hud: HUD;
		
		private var _gameManager: GameManager;
		private var _selectionManager: SelectionManager;
		private var _escapeeManager: EscapeeManager;
		private var _levelManager: LevelManager;
		
		private var _escapedPeoples: int;
		
		public var secondLevel:Boolean = false;
		public var thirdLevel:Boolean = false;
				
		public var i:Number = 8;
		public var s:Number = 1.5;
		
		public var _expandButton: SimpleButton;
		public var _contractButton: SimpleButton;
		public var _evaporateButton: SimpleButton;
		public var _freezeButton: SimpleButton;
		public var _swimButton: SimpleButton;
		public var _increaseStrButton: SimpleButton;
		public var _decreaseStrButton: SimpleButton;
		public var _restartGame: SimpleButton;
		public var _pauseGame: SimpleButton;
		public var _saveGame: SimpleButton;
		public var _startGame: SimpleButton;
		public var _instructionV: SimpleButton;
		public var _mainMenu: SimpleButton;
		public var _gameOption: SimpleButton;
		public var _controls: SimpleButton;
		public var _loadGame: SimpleButton;
		public var _fraserPortraitButton: SimpleButton;
		public var _chrisPortraitButton: SimpleButton;
		public var _tyPortraitButton: SimpleButton;
		public var _tylerPortraitButton: SimpleButton;
		public var _mikePortraitButton: SimpleButton;
		public var _allPortraitButton: SimpleButton;
		public var _nextLevelScreenButton: SimpleButton;
		public var _returnToMainMenu: SimpleButton;
		public var _newExitBtn: SimpleButton;
		public var _continueeBtn: SimpleButton;
		public var _returnnBtn: SimpleButton;
		public var _cursor: MovieClip;
		public var totalEscaped:int = 0;
		
		public var didEvap:Boolean = false;
		public var didFreeze:Boolean = false;
		public var didSwim:Boolean = false;
		public var myWaterScreen: Bitmap = new  waterScreen();
		public var gameOver:Bitmap = new gameOverScreen();
		public var resume:Bitmap = new gameMenuOption1();
		public var resume2:Bitmap = new gameMenuOption1a();
		public var saved:Bitmap = new gameMenuOption2();
		public var saved2:Bitmap = new gameMenuOption2a();
		public var instructionsV:Bitmap = new gameMenuOption3();
		public var instructionsV2:Bitmap = new gameMenuOption3a();
		public var returnMenuabc:Bitmap = new returnToMainMenuabc();
		public var returnMenuabcd:Bitmap = new returnToMainMenuabcd();
		public var dimmer:Bitmap = new Dim();
		public var _dimmer2:Bitmap = new Dim();
		public var exitBtn:Bitmap = new newExitBtn();
		public var exitBtn2:Bitmap = new newExitBtn2();
		
		public var freezeWater:Boolean = false;
		public var swimWater:Boolean = false;
		public var myFreeze:Boolean = false;
		public var mySwim:Boolean = false;
		public var hasGameStarted:Boolean = false;
		public var stopTweens:Boolean = false;
		public var buttonsOff:Boolean = false;
		
		public var myTimer:Timer = new Timer(15000, 1);
		public var myTimer2:Timer = new Timer(60000, 1);
		public var totalTimer:Timer = new Timer(1000);
		public var swimTimer:Timer = new Timer(20000, 1);
		public var swimTimerCD:Timer = new Timer(60000, 1);
		public var rainTimer:Timer = new Timer(20000, 1);
		public var min:int;
		public var sec:int;
		public var hour:int;
		public var CD1:int = 60;
		public var CD2:int = 60;
		public var S1:int = 15;
		public var S2:int = 20;
		public var R1:int = 20;
		
		public var myFirstSkill:Boolean = false;
		public var mySecondSkill:Boolean = false;
		public var myThirdSkill:Boolean = false;
		public var doodle:Boolean = false;
		public var derp:Boolean = false;
		public var herp:Boolean = false;
		public var _in:Boolean = false;
		public var indicator1:Boolean = false;
		public var indicator2:Boolean = false;
		public var indicator3:Boolean = false;
		public var indicator4:Boolean = false;
		public var indicator5:Boolean = false;
		public var indicator6:Boolean = false;
		public var indicator7:Boolean = false;
		public var indicator8:Boolean = false;
		public var indicator9:Boolean = false;
		public var indicator10:Boolean = false;
		
		public var cursor:Bitmap = new cCursor();
		private var _water2:FluidPlane;
		
		public var dead1:Bitmap;
		public var dead2:Bitmap;
		public var dead3:Bitmap;
		public var dead4:Bitmap;
		public var dead5:Bitmap;		
		
		public var alive1:Bitmap;
		public var alive2:Bitmap;
		public var alive3:Bitmap;
		public var alive4:Bitmap;
		public var alive5:Bitmap;
		
		private var _pauseMenu:Bitmap = new pauseMenu();
		private var _gameSaved:Bitmap = new gameSaved();
		private var _loadingScreenBG:Bitmap = new loadingScreenBG();
		
		public var _graphics:TextField;
		public var _difficulty:TextField;
		public var _gameDesc:TextField;
		private var _totalEscaped:TextField;
		
		public var lowGraphics:Boolean;
		public var mediumGraphics:Boolean;
		public var highGraphics:Boolean;
		public var easy:Boolean;
		public var medium:Boolean;
		public var hard:Boolean;
		private var tweenZoom:Boolean;
		
		public var sbox:Skybox;
		private var checkboxStatus:Boolean;
		private var useCursor:Boolean = true;
		private var showingOptions:Boolean = true;
		private var graphicsSettings:Slider;
		private var difficultySettings:Slider;
		private var wantCursor:CheckBox;
		private var _info: SimpleButton;
		private var _quality: Bitmap;
		private var _howDifficult: Bitmap;
		private var _gameVersion: Bitmap;
		private var _controlsExplained: SimpleButton;
		private var _infoExplained: SimpleButton;
		private var _optionsExplained: SimpleButton;
		private var _showWarning: SimpleButton;
		private var _world1: SimpleButton;
		private var _world2: SimpleButton;
		private var _world3: SimpleButton;
		private var _world4: SimpleButton;
		private var _world5: SimpleButton;
		private var _world6: SimpleButton;
		
		private var _terrainBar:TerrainBar;
		private var areAllSelected:Boolean;		
		
		private var flvPlayer:FLVPlayback = new FLVPlayback();
		private var flvPlayer2:FLVPlayback = new FLVPlayback();
		private var playIntroVideo:Boolean;
		private var myVidBG: Bitmap = new vidBG();
		
		private var miniMapOn:Boolean;
		private var miniMapVisible:Boolean;
		private var myMinimapTitle: Bitmap = new minimapTitle();
		private var myMinimapOne: Bitmap = new minimapOne();
		private var myMinimapTwo: Bitmap = new minimapTwo();
		private var myMinimapThree: Bitmap = new minimapThree();
		private var myMinimapFour: Bitmap = new minimapFour();
		private var myMinimapFive: Bitmap = new minimapFive();
		private var myMinimapBorder: Bitmap = new miniMapBorder();
		private var _coolDownBG: Bitmap = new cooldownBG();
		private var _coolDownBG1: Bitmap = new cooldownBG1();
		private var _continueWithoutSaving: Bitmap = new exitWithoutSavingImg();
		
		private var _myTerrain:Terrain;
		
		private var shakeDecay:Number = .2;
		private var shake:Number = 3;
		private var shaking:Boolean = false;
		private var raining:Boolean;
		private var rain:Rain;
		private var rainCounter:int;
		private var _loader:Loader;
		private var myTitle2: Bitmap = new title2();
		
		private var mySectionData: RayIntersectionData;		
		private var mySectionData2: RayIntersectionData;
		private var mySectionData3: RayIntersectionData;
		private var pressing:Boolean;
		private var isMoving:Boolean;
		private var mousePlane:Plane;
		private var loadedGame:Boolean;
		private var useCoolCursor:Boolean;
		
		private var bytes:ByteArray = new ByteArray();
		private var my3ds:Parser3DS = new Parser3DS();
		private var my3ds2:Parser3DS = new Parser3DS();
		private var my3ds3:Parser3DS = new Parser3DS();
		private var my3ds4:Parser3DS = new Parser3DS();
		private var my3ds5:Parser3DS = new Parser3DS();
		private var myZiggurat:Mesh;
		private var myWave:Mesh;
		private var myRock1:Mesh;
		private var modelsLoaded:Boolean;
		
		private var nothingToLoad: Bitmap = new load3();
		
		private var savedStuff:SharedObject = SharedObject.getLocal("savedGameInfo");
		
		private var level: ILevel;		
		
        private var last:uint = getTimer();
        private var ticks:uint = 0;
		private var checkFPS:Number;
		private var warningAlreadyShown:Boolean;
		private var initLoad:Boolean;
		private var txtField1:TextField;
		private var txtField2:TextField;
		private var txtField3:TextField;
		private var txtField4:TextField;
		private var txtField5:TextField;
		private var txtField6:TextField;
		private var lvlRestarts:int = 0;
		private var difficultyPoints:int;
		private var timerPoints:int;
		private var restartPoints: int;
		private var escapedPoints: int;
		private var totalPoints: int;
		private var bonusLevel:Boolean;
		private var restartingGameYo:Boolean;
		
		private var finishedGathering:Boolean = true;
		private var usingGatherPosition:Boolean;
		
		private var finishedRelease:Boolean = true;
		private var usingReleasePosition:Boolean;
		
		private var _scoreScreen:Bitmap = new scoreingScreen();
		
		private var myChannel:SoundChannel = new SoundChannel();
		
		private var watchingTheTutorial:Boolean;
		
		private function init(e:Event = null):void 
		{	
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_gameManager = GameManager.getInstance();
			_selectionManager = SelectionManager.getInstance();
			_escapeeManager = EscapeeManager.getInstance();
			_levelManager = LevelManager.getInstance();
			
			if (LevelManager.currentLevel < 6 || bonusLevel == true)
			{
				// START SCREEN			
				if (!hasGameStarted)
				{				
					if (false)
					{
						/*addChild(myVidBG);
						flvPlayer.source = 'myIntro.flv';
						flvPlayer.x = 0;
						flvPlayer.y = 0;
						flvPlayer.width = 800;
						flvPlayer.height = 600;
						addChild(flvPlayer);
						
						flvPlayer.addEventListener(Event.COMPLETE, continueOnwards);*/
					}
					else 
					{					
						myClickSound = (new clickSound) as Sound;
						myCantSound = (new cantSound) as Sound;
						myOceanSound = (new oceanSound) as Sound;
						myQuakeSound = (new quakeSound) as Sound;
						myRainSound = (new rainSound) as Sound;							
						myGatherSound = (new gatherSound) as Sound;
						myReleaseSound = (new releaseSound) as Sound;						
						mySelectSound = (new selectSound) as Sound;
						myDeadSound = (new deadSound) as Sound;
						myChatSound = (new chatSound) as Sound;
						myCDfinishedSound = (new CDfinishedSound) as Sound;
						mytidalWaveSound = (new tidalWaveSound) as Sound;
						myEscapedSound = (new escapedSound) as Sound;
						myIceSound = (new iceSound) as Sound;
						myEvaporateSound = (new evaporateSound) as Sound;
						mySwimSound = (new swimSound) as Sound;
					
						Mouse.show();
						
						addChild(_loadingScreenBG);
						_loadingScreenBG.visible = true;
							
						_loader = new Loader();
						_loader.load(new URLRequest('http://redmenmusic.ca/downloads/water.swf'));
						addChild(_loader);
						
						var beginGame: Bitmap = new startGame();
						var beginGame2: Bitmap = new startGame2();
						_startGame = new SimpleButton( beginGame, beginGame2, beginGame2, beginGame2 );
						_startGame.x = 725;
						_startGame.y = 385;
						addChild( _startGame );
						
						var info: Bitmap = new info();
						var info2: Bitmap = new info2();
						_info = new SimpleButton( info, info2, info2, info2 );
						_info.x = 600;
						_info.y = 465;
						addChild( _info );
						
						var options: Bitmap = new gameOption();
						var options2: Bitmap = new gameOption2();
						_gameOption = new SimpleButton( options, options2, options2, options2 );
						_gameOption.x = 600;
						_gameOption.y = 545;
						addChild( _gameOption );
						
						var controls: Bitmap = new controls();
						var controls2: Bitmap = new controls2();
						_controls = new SimpleButton( controls, controls2, controls2, controls2 );
						_controls.x = 600;
						_controls.y = 505;
						addChild( _controls );
						
						nothingToLoad.x = 725;
						nothingToLoad.y = 423;
						addChild( nothingToLoad );
						
						var loading1: Bitmap = new load1();
						var loading2: Bitmap = new load2();	
						_loadGame = new SimpleButton( loading1, loading2, loading2, loading2 );
						_loadGame.x = 722;
						_loadGame.y = 423;
						addChild( _loadGame );
						
						if (savedStuff.size > 0)
						{
							_loadGame.visible = true;
							nothingToLoad.visible = false;
						}
						else
						{
							nothingToLoad.visible = true;
							_loadGame.visible = false;
						}
						
						addChild(_dimmer2);
						_dimmer2.visible = false;
						
						var showControlsExplained: Bitmap = new controlsExplained();
						_controlsExplained = new SimpleButton ( showControlsExplained, showControlsExplained, showControlsExplained, showControlsExplained );
						_controlsExplained.x = 5;
						_controlsExplained.y = 100;
						addChild( _controlsExplained );
						_controlsExplained.visible = false;
						
						var showInfoExplained: Bitmap = new infoExplained();
						_infoExplained = new SimpleButton ( showInfoExplained, showInfoExplained, showInfoExplained, showInfoExplained );
						_infoExplained.x = 5;
						_infoExplained.y = 100;
						addChild( _infoExplained );
						_infoExplained.visible = false;
						
						var showOptionsExplained: Bitmap = new optionsExplained();
						_optionsExplained = new SimpleButton ( showOptionsExplained, showOptionsExplained, showOptionsExplained, showOptionsExplained );
						_optionsExplained.x = 5;
						_optionsExplained.y = 100;
						addChild( _optionsExplained );
						_optionsExplained.visible = false;
						
						var _lowPerformance: Bitmap = new lowPerformance();
						_showWarning = new SimpleButton ( _lowPerformance, _lowPerformance, _lowPerformance, _lowPerformance );
						_showWarning.x = 265;
						_showWarning.y = 215;
						_showWarning.visible = false;
						
						var _myWorld1: Bitmap = new world1();
						_world1 = new SimpleButton ( _myWorld1, _myWorld1, _myWorld1, _myWorld1 );
						_world1.x = 5;
						_world1.y = 100;
						_world1.visible = false;
						
						var _myWorld2: Bitmap = new world2();
						_world2 = new SimpleButton ( _myWorld2, _myWorld2, _myWorld2, _myWorld2 );
						_world2.x = 5;
						_world2.y = 100;
						_world2.visible = false;
						
						var _myWorld3: Bitmap = new world3();
						_world3 = new SimpleButton ( _myWorld3, _myWorld3, _myWorld3, _myWorld3 );
						_world3.x = 5;
						_world3.y = 100;
						_world3.visible = false;
						
						var _myWorld4: Bitmap = new world4();
						_world4 = new SimpleButton ( _myWorld4, _myWorld4, _myWorld4, _myWorld4 );
						_world4.x = 5;
						_world4.y = 100;
						_world4.visible = false;
						
						var _myWorld5: Bitmap = new world5();
						_world5 = new SimpleButton ( _myWorld5, _myWorld5, _myWorld5, _myWorld5 );
						_world5.x = 5;
						_world5.y = 100;
						_world5.visible = false;
						
						var _myWorld6: Bitmap = new world6();
						_world6 = new SimpleButton ( _myWorld6, _myWorld6, _myWorld6, _myWorld6 );
						_world6.x = 5;
						_world6.y = 100;
						_world6.visible = false;
						
						_quality = new quality();
						_quality.x = 330;
						_quality.y = 260;
						addChild( _quality );
						
						_gameVersion = new version();
						_gameVersion.x = -14;
						_gameVersion.y = 580;
						addChild( _gameVersion );
						
						graphicsSettings = new Slider();
						graphicsSettings.x = 380;
						graphicsSettings.y = 295;
						graphicsSettings.maximum = 3;
						graphicsSettings.minimum = 1;
						graphicsSettings.snapInterval = 1;
						graphicsSettings.value = 2;
						graphicsSettings.liveDragging = true;
						addChild( graphicsSettings );
						
						difficultySettings = new Slider();
						difficultySettings.x = 205;
						difficultySettings.y = 295;
						difficultySettings.maximum = 3;
						difficultySettings.minimum = 1;
						difficultySettings.snapInterval = 1;
						difficultySettings.value = 2;
						difficultySettings.liveDragging = true;
						addChild( difficultySettings );
						
						wantCursor = new CheckBox();
						wantCursor.x = 530;
						wantCursor.y = 285;
						wantCursor.label = "Use Game Cursor?";
						wantCursor.labelPlacement = "top";
						wantCursor.selected = true;
						addChild(wantCursor);
						
						mediumGraphics = true;
						medium = true;

						var myFormat:TextFormat = new TextFormat();
						myFormat.size = 15;
						myFormat.align = TextFormatAlign.CENTER;
						
						_graphics = new TextField();
						_graphics.defaultTextFormat = myFormat;
						_graphics.textColor = 0xffffff;
						_graphics.height = 100;
						_graphics.width = 100;
						_graphics.x = 376;
						_graphics.y = 306;
						_graphics.selectable = false;			
						_graphics.text = "Medium";
						addChild(_graphics);
						
						var myFormat2:TextFormat = new TextFormat();
						myFormat2.size = 15;
						myFormat2.align = TextFormatAlign.CENTER;
						
						_difficulty = new TextField();
						_difficulty.defaultTextFormat = myFormat2;
						_difficulty.textColor = 0xffffff;
						_difficulty.height = 100;
						_difficulty.width = 100;
						_difficulty.x = 201;
						_difficulty.y = 306;
						_difficulty.selectable = false;			
						_difficulty.text = "Casual";
						addChild(_difficulty);
						
						_howDifficult = new difficulty();
						_howDifficult.x = 155;
						_howDifficult.y = 250;
						addChild( _howDifficult );
						
						_graphics.visible = false;
						_difficulty.visible = false;
						wantCursor.visible = false;
						graphicsSettings.visible = false;
						difficultySettings.visible = false;
						_quality.visible = false;
						_howDifficult.visible = false;
						
						graphicsSettings.addEventListener(SliderEvent.CHANGE, announceChange);
						difficultySettings.addEventListener(SliderEvent.CHANGE, announceChange2);
						wantCursor.addEventListener(Event.CHANGE, checkboxChange);
						_controls.addEventListener(MouseEvent.CLICK, showTheControls);
						_controls.addEventListener(MouseEvent.MOUSE_OVER, showTheControlsOver);
						_controlsExplained.addEventListener(MouseEvent.CLICK, showTheControlsPanel);
						_info.addEventListener(MouseEvent.CLICK, showTheInfo);
						_info.addEventListener(MouseEvent.MOUSE_OVER, showTheInfoOver);
						_infoExplained.addEventListener(MouseEvent.CLICK, showTheInfoPanel);
						_gameOption.addEventListener(MouseEvent.CLICK, showTheOptions);
						_gameOption.addEventListener(MouseEvent.MOUSE_OVER, showTheOptionsOver);
						_optionsExplained.addEventListener(MouseEvent.CLICK, showTheOptionsPanel);				
						_loadGame.addEventListener(MouseEvent.CLICK, loadButtonClickHandler);
						_loadGame.addEventListener(MouseEvent.MOUSE_OVER, loadButtonClickHandlerOver);
						_showWarning.addEventListener(MouseEvent.CLICK, warningButtonClickHandler);
						_world1.addEventListener(MouseEvent.CLICK, world1ButtonClickHandler);
						_world2.addEventListener(MouseEvent.CLICK, world2ButtonClickHandler);
						_world3.addEventListener(MouseEvent.CLICK, world3ButtonClickHandler);
						_world4.addEventListener(MouseEvent.CLICK, world4ButtonClickHandler);
						_world5.addEventListener(MouseEvent.CLICK, world5ButtonClickHandler);
						_world6.addEventListener(MouseEvent.CLICK, world6ButtonClickHandler);
						_startGame.addEventListener( MouseEvent.CLICK, startTheGame );
						_startGame.addEventListener( MouseEvent.MOUSE_OVER, startTheGameOver );
					}
				}
				else
				{
				level = _levelManager.getLevel();
				
				if (LevelManager.currentLevel == 1)
				{
					_world1.visible = true;
				}
				else if (LevelManager.currentLevel == 2)
				{
					_world2.visible = true;
				}
				else if (LevelManager.currentLevel == 3)
				{
					_world3.visible = true;
				}
				else if (LevelManager.currentLevel == 4)
				{
					_world4.visible = true;
				}
				else if (LevelManager.currentLevel == 5)
				{
					_world5.visible = true;
				}
				else if (LevelManager.currentLevel == 6)
				{
					_world6.visible = true;
				}
				
				if (restartingGameYo)
				{
					for each( var escapeelol:Escapee in level.escapeeList )
					{
						escapeelol.visible = false;
						escapeelol.mouseEnabled = false;
					}
				}
				_camera = new Camera3D();
				_camera.view = new View(stage.stageWidth, stage.stageHeight);
				_camera.view.hideLogo();
				
				if (!loadedGame)
				{
					_camera.z = 75;
					_camera.x = -152.1;
					_camera.y = -153.3;
					_camera.lookAt( 0, 0, 0 );
				}
				
				_minimapCamera = new Camera3D();
				_minimapCamera.view = new View(stage.stageWidth, stage.stageHeight);
				_minimapCamera.view.hideLogo();
				_minimapCamera.z = 310;
				_minimapCamera.x = 0;
				_minimapCamera.y = 0;
				_minimapCamera.lookAt( 0, 0, 0 );
				_minimapCamera.view.x = 200;
				_minimapCamera.view.y = 495;
				_minimapCamera.view.rotationX = 180;
				_minimapCamera.view.width = 450;
				_minimapCamera.view.height = 450;
				_minimapCamera.view.alpha = 0.8;
				_minimapCamera.view.visible = false;
				
				addChild(_camera.view);
				addChild(_minimapCamera.view);
				
				_hud = new HUD( _selectionManager );
				addChild( _hud );			
				
				sbox = new Skybox(5000); 
				skyboxContainer.addChild(sbox);
				_rootContainer2.addChild(skyboxContainer);
				
				if (LevelManager.currentLevel == 1)
				{
					var text: String = "";
					text = "Welcome to world one. Genesis.";
					_hud.setDetailText( text );	
				}
				else if (LevelManager.currentLevel == 2)
				{
					var text2: String = "";
					text2 = "Welcome to world two. Awakening.";
					_hud.setDetailText( text2 );	
				}
				else if (LevelManager.currentLevel == 3)
				{
					var text3: String = "";
					text3 = "Welcome to world three. Remnants.";
					_hud.setDetailText( text3 );	
				}
				else if (LevelManager.currentLevel == 4)
				{
					var text4: String = "";
					text4 = "Welcome to world four. The Boneway.";
					_hud.setDetailText( text4 );	
				}
				else if (LevelManager.currentLevel == 5)
				{
					var text5: String = "";
					text5 = "Welcome to world five. Leviathan.";
					_hud.setDetailText( text5 );	
				}
				else if (LevelManager.currentLevel == 6)
				{
					var text6: String = "";
					text6 = "Welcome to world six. Drink the Sea.";
					_hud.setDetailText( text6 );
				}
				
				totalTimer.start();
			
				if (highGraphics)
				{
					var mat:TextureMaterial = new TextureMaterial(new FluidDiffuse().bitmapData);
					_water2 = new FluidPlane(_camera);
					_water2.sorting = Sorting.DYNAMIC_BSP;
					_water2.mouseEnabled = false;
					_water2.z = 0;
					_water2.calculateVerticesNormals(true, 0.01);
					_water2.setMaterialToAllFaces(mat);
					_rootContainer2.addChild( _water2 );
					_water2.makeSplash(2);
				
					_water = new Plane( 512, 512, 1, 1, false, false, false, null, new TextureMaterial( level.myWaterTexture ));
					_water.sorting = Sorting.DYNAMIC_BSP;
					if (!loadedGame)
					{
						_water.z = 10;
					}
					_water.addEventListener( MouseEvent3D.CLICK, onWaterClickHandler );
					_water.mouseEnabled = false;
					_rootContainer.addChild( _water);
				}
				else if (mediumGraphics)
				{
					_water = new Plane( 5000, 5000, 1, 1, false, false, false, null, new TextureMaterial( level.myWaterTexture2 ));
					_water.sorting = Sorting.DYNAMIC_BSP;
					if (!loadedGame)
					{
						_water.z = 10;
					}
					_water.addEventListener( MouseEvent3D.CLICK, onWaterClickHandler );
					_water.mouseEnabled = false;
					_rootContainer.addChild( _water);
				}
				else if (lowGraphics)
				{
					_water = new Plane( 5000, 5000, 1, 1, false, false, false, null, new FillMaterial(0x006CA6, 0.65));
					_water.sorting = Sorting.DYNAMIC_BSP;
					if (!loadedGame)
					{
						_water.z = 10;
					}
					_water.addEventListener( MouseEvent3D.CLICK, onWaterClickHandler );
					_water.mouseEnabled = false;
					_rootContainer.addChild( _water);
				}
				
				for each( var esc: Escapee in level.escapeeList )
				{
					_escapeeManager.addEscapee( esc );
				}
				
				_rootContainer.addChild(_camera);
				_rootContainer.addChild(_minimapCamera);
				
				if (highGraphics)
				{
					_terrain = new Terrain(level.heightMap, new TextureMaterial(level.textureMap), 450, 450, 60, 30, 30);
				}
				else if (mediumGraphics)
				{
					_terrain = new Terrain(level.heightMap, new TextureMaterial(level.textureMap), 450, 450, 60, 30, 30);
				}
				else if (lowGraphics)
				{
					_terrain = new Terrain(level.heightMap, new TextureMaterial(level.textureMap), 450, 450, 60, 18, 18);
				}
				
				_terrain.addEventListener(MouseEvent3D.MOUSE_DOWN, handlePress);
				_terrain.addEventListener(MouseEvent3D.MOUSE_UP, handleRelease);
				_terrain.addEventListener(MouseEvent3D.MOUSE_MOVE, handleMove);
				_rootContainer.addChild(_terrain);
				
				_controller = new TheMegaController(new EllipsoidCollider(2, 2, 2), _rootContainer, stage, _camera, 50);
				
				// Adding Models				
				// Ziggurat
				var ldr14:URLLoader = new URLLoader();
				ldr14.dataFormat = URLLoaderDataFormat.BINARY;
				var req14:URLRequest = new URLRequest('http://redmenmusic.ca/downloads/ziggurat.3DS');
				ldr14.addEventListener(Event.COMPLETE, onZigguratLoaded);
				ldr14.load(req14);
				
				// Wave
				var ldr15:URLLoader = new URLLoader();
				ldr15.dataFormat = URLLoaderDataFormat.BINARY;
				var req15:URLRequest = new URLRequest('http://redmenmusic.ca/downloads/wave.3DS');
				ldr15.addEventListener(Event.COMPLETE, onWaveLoaded);
				ldr15.load(req15);
				
				addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
				addEventListener(Event.RESIZE, onResizeHandler);
				
				_exitPoint = level.exitPoint;
				
				mousePlane = new Plane( 2, 2, 2, 1, false, false, false, null, new TextureMaterial(level.myMousePos))
				_rootContainer.addChild(mousePlane);
				mousePlane.visible = false;
				
				var exitIntersectionData: RayIntersectionData = _terrain.intersectRay( new Vector3D( _exitPoint.x, _exitPoint.y, 800 ), new Vector3D( 0, 0, -1), null, null );
				if ( exitIntersectionData )
				{
					_exitPoint.z = exitIntersectionData.point.z;
				}
				
				// SKILL ORBS START	
			
				_skill1 = level.skill1;
				_skill2 = level.skill2;
				_skill3 = level.skill3;

				var skill1IntersectionData: RayIntersectionData = _terrain.intersectRay( new Vector3D( _skill1.x, _skill1.y, 800 ), new Vector3D( 0, 0, -1), null, null );
				if ( skill1IntersectionData )
				{
					_skill1.z = skill1IntersectionData.point.z;
				}			
				var skill2IntersectionData: RayIntersectionData = _terrain.intersectRay( new Vector3D( _skill2.x, _skill2.y, 800 ), new Vector3D( 0, 0, -1), null, null );
				if ( skill2IntersectionData )
				{
					_skill2.z = skill2IntersectionData.point.z;
				}			
				var skill3IntersectionData: RayIntersectionData = _terrain.intersectRay( new Vector3D( _skill3.x, _skill3.y, 800 ), new Vector3D( 0, 0, -1), null, null );
				if ( skill3IntersectionData )
				{
					_skill3.z = skill3IntersectionData.point.z;
				}			
				_rootContainer.addChild( _skill1 );
				_rootContainer.addChild( _skill2 );
				_rootContainer.addChild( _skill3 );
				
				if (LevelManager.currentLevel == 1 || LevelManager.currentLevel == 2)
				{
					_rootContainer.removeChild( _skill1 );
					_rootContainer.removeChild( _skill2 );
					_rootContainer.removeChild( _skill3 );
				}
				else if (LevelManager.currentLevel == 4)
				{
					_rootContainer.removeChild( _skill1 );
					_rootContainer.removeChild( _skill2 );
				}
				else if (LevelManager.currentLevel == 6)
				{
					_rootContainer.removeChild( _skill2 );
					_rootContainer.removeChild( _skill3 );
				}
				//SKILL ORBS END
				
				_rootContainer.addChild( _exitPoint );
				
				for each(var escappez:Escapee in _escapeeManager.escapees)
				{
					if (restartingGameYo)
					{
						// Level 1
						if (LevelManager.currentLevel == 1)
						{
							if (escappez.escapeeName == "Fraser")
							{
								escappez.x = -132.4;
								escappez.y = -142.8;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Chris")
							{
								escappez.x = -133.9;
								escappez.y = -143.9;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Ty")
							{
								escappez.x = -129.8;
								escappez.y = -143.4;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Tyler")
							{
								escappez.x = -133.2;
								escappez.y = -144.1;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Mike")
							{
								escappez.x = -131.1;
								escappez.y = -144.6;
								escappez.z = 35;
							}
						}
						// Level 2
						if (LevelManager.currentLevel == 2)
						{
							if (escappez.escapeeName == "Fraser")
							{
								escappez.x = 90;
								escappez.y = 126;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Chris")
							{
								escappez.x = 88;
								escappez.y = 124;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Ty")
							{
								escappez.x = 90;
								escappez.y = 93;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Tyler")
							{
								escappez.x = 91;
								escappez.y = 89;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Mike")
							{
								escappez.x = 89;
								escappez.y = 91;
								escappez.z = 35;
							}
						}
						// Level 3
						if (LevelManager.currentLevel == 3)
						{
							if (escappez.escapeeName == "Fraser")
							{
								escappez.x = -150;
								escappez.y = 110;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Chris")
							{
								escappez.x = -147;
								escappez.y = 111;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Ty")
							{
								escappez.x = -153;
								escappez.y = 109;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Tyler")
							{
								escappez.x = -152;
								escappez.y = 105;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Mike")
							{
								escappez.x = -151;
								escappez.y = 108;
								escappez.z = 35;
							}
						}
						// Level 4
						if (LevelManager.currentLevel == 4)
						{
							if (escappez.escapeeName == "Fraser")
							{
								escappez.x = -185;
								escappez.y = -173;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Chris")
							{
								escappez.x = -183;
								escappez.y = -175;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Ty")
							{
								escappez.x = -181;
								escappez.y = -180;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Tyler")
							{
								escappez.x = -183;
								escappez.y = -172;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Mike")
							{
								escappez.x = -182;
								escappez.y = -178;
								escappez.z = 35;
							}
						}
						// Level 5
						if (LevelManager.currentLevel == 5)
						{
							if (escappez.escapeeName == "Fraser")
							{
								escappez.x = -145;
								escappez.y = -148;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Chris")
							{
								escappez.x = -142;
								escappez.y = -146;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Ty")
							{
								escappez.x = -139;
								escappez.y = -141;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Tyler")
							{
								escappez.x = -144;
								escappez.y = -144;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Mike")
							{
								escappez.x = -141;
								escappez.y = -143;
								escappez.z = 35;
							}
						}
						// Level 6
						if (LevelManager.currentLevel == 5)
						{
							if (escappez.escapeeName == "Fraser")
							{
								escappez.x = -140;
								escappez.y = -169;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Chris")
							{
								escappez.x = -143;
								escappez.y = -167;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Ty")
							{
								escappez.x = -135;
								escappez.y = -171;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Tyler")
							{
								escappez.x = -144;
								escappez.y = -173;
								escappez.z = 35;
							}
							if (escappez.escapeeName == "Mike")
							{
								escappez.x = -138;
								escappez.y = -166;
								escappez.z = 35;
							}
						}
					}
				}
				
				for each( var escapee:Escapee in level.escapeeList )
				{
					_escapeeManager.addEscapee( escapee );
					_rootContainer.addChild( escapee );
					
					escapee.addEventListener( MouseEvent3D.MOUSE_OVER, onPlayerMouseOverHandler );
					escapee.addEventListener( MouseEvent3D.MOUSE_OUT, onPlayerMouseOutHandler );
					escapee.addEventListener( MouseEvent3D.MOUSE_DOWN, onPlayerMouseDownHandler );
					
					var rayIntersectionData: RayIntersectionData = _terrain.intersectRay( new Vector3D( escapee.x, escapee.y, 800 ), new Vector3D( 0, 0, -1), null, null );
				
					if ( rayIntersectionData )
					{
						escapee.z = rayIntersectionData.point.z + escapee.height;
					}
					
					if (escapee.escapeeName == 'Fraser')
					{
						myMinimapOne.x = escapee.x + 415;
						myMinimapOne.y = escapee.y + 235;
						myMinimapOne.visible = false;
						addChild(myMinimapOne);
					}
					else if (escapee.escapeeName == 'Chris')
					{
						myMinimapTwo.x = escapee.x + 415;
						myMinimapTwo.y = escapee.y + 235;
						myMinimapTwo.visible = false;
						addChild(myMinimapTwo);
					}
					else if (escapee.escapeeName == 'Ty')
					{
						myMinimapThree.x = escapee.x + 415;
						myMinimapThree.y = escapee.y + 235;
						myMinimapThree.visible = false;
						addChild(myMinimapThree);
					}
					else if (escapee.escapeeName == 'Tyler')
					{
						myMinimapFour.x = escapee.x + 415;
						myMinimapFour.y = escapee.y + 235;
						myMinimapFour.visible = false;
						addChild(myMinimapFour);
					}
					else if (escapee.escapeeName == 'Mike')
					{
						myMinimapFive.x = escapee.x + 415;
						myMinimapFive.y = escapee.y + 235;
						myMinimapFive.visible = false;
						addChild(myMinimapFive);
					}				
				}
				
				_terrainBar = new TerrainBar();
				_terrainBar.x = 5;
				_terrainBar.y = 5;
				_terrainBar.alpha = 0.9;
				if (!loadedGame)
				{
					_terrain.myTerrainPoints = 0.5;
					_terrainBar.setValue(_terrain.myTerrainPoints);
				}
				addChild(_terrainBar);
				
				addChild( myWaterScreen );
				myWaterScreen.visible = false;
				
				var expand: Bitmap = new Expand();
				var expand2: Bitmap = new Expand2();
				var expand3: Bitmap = new Expand3();
				_expandButton = new SimpleButton( expand, expand2, expand3, expand );
				_expandButton.x = 225;
				_expandButton.y = 560;
				addChild( _expandButton );
				
				var contract: Bitmap = new Contract();
				var contract2: Bitmap = new Contract2();
				var contract3: Bitmap = new Contract3();
				_contractButton = new SimpleButton( contract, contract2, contract3, contract );
				_contractButton.x = 275;
				_contractButton.y = 560;
				addChild( _contractButton );
				
				var evaporate: Bitmap = new Evaporate();
				var evaporate2: Bitmap = new Evaporate2();
				var evaporate3: Bitmap = new Evaporate3();
				_evaporateButton = new SimpleButton( evaporate, evaporate2, evaporate3, evaporate );
				_evaporateButton.x = 425;
				_evaporateButton.y = 560;
				addChild( _evaporateButton );

				_evaporateButton.visible = false;
				
				var myfreeze: Bitmap = new Freeze();
				var myfreeze2: Bitmap = new Freeze2();
				var myfreeze3: Bitmap = new Freeze3();
				_freezeButton = new SimpleButton( myfreeze, myfreeze2, myfreeze3, myfreeze );
				_freezeButton.x = 475;
				_freezeButton.y = 560;
				addChild( _freezeButton );
				
				_freezeButton.visible = false;
				
				var myswim: Bitmap = new Swim();
				var myswim2: Bitmap = new Swim2();
				var myswim3: Bitmap = new Swim3();
				_swimButton = new SimpleButton( myswim, myswim2, myswim3, myswim );
				_swimButton.x = 525;
				_swimButton.y = 560;
				addChild( _swimButton );
				
				_swimButton.visible = false;
				
				var increaseMyStr: Bitmap = new increaseStrength();
				var increaseMyStr2: Bitmap = new increaseStrength2();
				var increaseMyStr3: Bitmap = new increaseStrength3();
				_increaseStrButton = new SimpleButton( increaseMyStr, increaseMyStr2, increaseMyStr3, increaseMyStr );
				_increaseStrButton.x = 325;
				_increaseStrButton.y = 560;
				addChild( _increaseStrButton );
				
				var decreaseMyStr: Bitmap = new decreaseStrength();
				var decreaseMyStr2: Bitmap = new decreaseStrength2();
				var decreaseMyStr3: Bitmap = new decreaseStrength3();
				_decreaseStrButton = new SimpleButton( decreaseMyStr, decreaseMyStr2, decreaseMyStr3, decreaseMyStr );
				_decreaseStrButton.x = 375;
				_decreaseStrButton.y = 560;
				addChild( _decreaseStrButton );
				
				var fraserButton: Bitmap = new fraser();
				_fraserPortraitButton = new SimpleButton( fraserButton, fraserButton, fraserButton, fraserButton );
				_fraserPortraitButton.x = 760;
				_fraserPortraitButton.y = 25;
				addChild( _fraserPortraitButton );
				
				var chrisButton: Bitmap = new chris();
				_chrisPortraitButton = new SimpleButton( chrisButton, chrisButton, chrisButton, chrisButton );
				_chrisPortraitButton.x = 760;
				_chrisPortraitButton.y = 65;
				addChild( _chrisPortraitButton );
				
				var tyButton: Bitmap = new ty();
				_tyPortraitButton = new SimpleButton( tyButton, tyButton, tyButton, tyButton );
				_tyPortraitButton.x = 760;
				_tyPortraitButton.y = 105;
				addChild( _tyPortraitButton );
				
				var tylerButton: Bitmap = new tyler();
				_tylerPortraitButton = new SimpleButton( tylerButton, tylerButton, tylerButton, tylerButton );
				_tylerPortraitButton.x = 760;
				_tylerPortraitButton.y = 145;
				addChild( _tylerPortraitButton );
				
				var mikeButton: Bitmap = new mike();
				_mikePortraitButton = new SimpleButton( mikeButton, mikeButton, mikeButton, mikeButton );
				_mikePortraitButton.x = 760;
				_mikePortraitButton.y = 185;
				addChild( _mikePortraitButton );
				
				var allButton: Bitmap = new all();
				_allPortraitButton = new SimpleButton( allButton, allButton, allButton, allButton );
				_allPortraitButton.x = 760;
				_allPortraitButton.y = 225;
				addChild( _allPortraitButton );
				
				_fraserPortraitButton.visible = false;
				_chrisPortraitButton.visible = false;
				_tyPortraitButton.visible = false;
				_tylerPortraitButton.visible = false;
				_mikePortraitButton.visible = false;
				_allPortraitButton.visible = false;
				
				addChild(dimmer);
				dimmer.visible = false;
				
				myMinimapTitle.x = 292;
				myMinimapTitle.y = -3;
				myMinimapTitle.visible = false;
				addChild(myMinimapTitle);
				
				myMinimapBorder.x = 194;
				myMinimapBorder.y = 39;
				myMinimapBorder.visible = false;
				addChild(myMinimapBorder);
				
				var next: Bitmap = new nextLevelScreen();
				_nextLevelScreenButton = new SimpleButton( next, next, next, next );
				_nextLevelScreenButton.x = 5;
				_nextLevelScreenButton.y = 100;
				
				_nextLevelScreenButton.visible = false;			
				
				_totalEscaped = new TextField();
				_totalEscaped.textColor = 0xE3E3E3;
				_totalEscaped.height = 150;
				_totalEscaped.width = 225;
				_totalEscaped.x = 490;
				_totalEscaped.y = 423;
				_totalEscaped.mouseEnabled = false;
				_totalEscaped.selectable = false;
				_totalEscaped.text = '';
				_totalEscaped.visible = false;
				
				_coolDownBG1.x = 1;
				_coolDownBG1.y = 22;
				_coolDownBG1.alpha = 0.75;
				addChild(_coolDownBG1);	
				
				_coolDownBG.x = 1;
				_coolDownBG.y = 22;
				_coolDownBG.alpha = 0.75;
				_coolDownBG.visible = false;
				addChild(_coolDownBG);		
				
				//BUTTONS END
				
				// DEAD OR ALIVE START
				dead1 = new  dead();
				dead1.x = 762;
				dead1.y = 27;
				addChild( dead1 );
				
				dead2 = new  dead();
				dead2.x = 762;
				dead2.y = 67;
				addChild( dead2 );
				
				dead3 = new  dead();
				dead3.x = 762;
				dead3.y = 107;
				addChild( dead3 );
				
				dead4 = new  dead();
				dead4.x = 762;
				dead4.y = 147;
				addChild( dead4 );
				
				dead5 = new  dead();
				dead5.x = 762;
				dead5.y = 187;
				addChild( dead5 );			
				
				alive1 = new  escaped();
				alive1.x = 762;
				alive1.y = 27;
				addChild( alive1 );
				
				alive2 = new  escaped();
				alive2.x = 762;
				alive2.y = 67;
				addChild( alive2 );
				
				alive3 = new  escaped();
				alive3.x = 762;
				alive3.y = 107;
				addChild( alive3 );
				
				alive4 = new  escaped();
				alive4.x = 762;
				alive4.y = 147;
				addChild( alive4 );
				
				alive5 = new  escaped();
				alive5.x = 762;
				alive5.y = 187;
				addChild( alive5 );
				
				dead1.visible = false;
				dead2.visible = false;
				dead3.visible = false;
				dead4.visible = false;
				dead5.visible = false;
				
				alive1.visible = false;			
				alive2.visible = false;			
				alive3.visible = false;			
				alive4.visible = false;			
				alive5.visible = false;
				
				//DEAD OR ALIVE END		
				
				_pauseMenu.x = 5;
				_pauseMenu.y = 100;
				addChild(_pauseMenu);
				_pauseMenu.visible = false;
				
				_gameSaved.x = 450;
				_gameSaved.y = 245;
				addChild(_gameSaved);
				_gameSaved.visible = false;
				
				_pauseGame = new SimpleButton (resume, resume2, resume2, resume2);
				addChild( _pauseGame );
				_pauseGame.visible = false;
				
				_saveGame = new SimpleButton (saved, saved2, saved2, saved2);
				addChild( _saveGame );
				_saveGame.visible = false;
				
				_instructionV = new SimpleButton (instructionsV, instructionsV2, instructionsV2, instructionsV2);
				addChild( _instructionV );
				_instructionV.visible = false;
				
				_mainMenu = new SimpleButton (returnMenuabc, returnMenuabcd, returnMenuabcd, returnMenuabcd);
				addChild( _mainMenu );
				_mainMenu.visible = false;
				
				_restartGame = new SimpleButton (gameOver, gameOver, gameOver, gameOver);
				addChild(_restartGame);
				_restartGame.visible = false;	
				
				addChild( _showWarning );
				addChild(_world1);
				addChild(_world2);
				addChild(_world3);
				addChild(_world4);
				addChild(_world5);
				addChild(_world6);
				addChild( _nextLevelScreenButton );		
				addChild(_totalEscaped);
				
				_continueWithoutSaving.x = 265;
				_continueWithoutSaving.y = 215;				
				addChild(_continueWithoutSaving);
				_continueWithoutSaving.visible = false;
				
				var _continuee1: Bitmap = new continuee1();
				var _continuee2: Bitmap = new continuee2();
				_continueeBtn = new SimpleButton( _continuee1, _continuee2, _continuee2, _continuee2 );
				_continueeBtn.x = 280;
				_continueeBtn.y = 305;
				addChild( _continueeBtn );
				_continueeBtn.visible = false;
				
				var _returnn1: Bitmap = new return1();
				var _returnn2: Bitmap = new return2();
				_returnnBtn = new SimpleButton( _returnn1, _returnn2, _returnn2, _returnn2 );
				_returnnBtn.x = 405;
				_returnnBtn.y = 305;
				addChild( _returnnBtn );	
				_returnnBtn.visible = false;
				
				addChild(_camera.diagram);
				_camera.diagram.x = 735;
				_camera.diagram.y = 455;
				_camera.diagram.opaqueBackground = 0x0;
				_camera.diagram.alpha = 0.9;
				_camera.diagram.visible = false;
				
				flvPlayer2.source = 'godsendTutorial.mp4';
				flvPlayer2.x = 0;
				flvPlayer2.y = 0;
				flvPlayer2.width = 800;
				flvPlayer2.height = 600;
				addChild(flvPlayer2);
				flvPlayer2.stop();
				flvPlayer2.visible = false;
				
				_newExitBtn = new SimpleButton( exitBtn, exitBtn2, exitBtn, exitBtn );
				_newExitBtn.x = 740;
				_newExitBtn.y = 10;
				addChild(_newExitBtn);
				_newExitBtn.visible = false;
				
				if (useCursor)
				{
					cursor.visible = false;
				}
				
				addChild(cursor);
				_rootContainer2.addChild(_rootContainer);
				
				_controller.disable();
				stage.addEventListener(MouseEvent.MOUSE_MOVE, movecrs);
				stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseDownHandler);
				_skill1.addEventListener( MouseEvent3D.MOUSE_OVER, skill1MouseOverHandler );
				_skill2.addEventListener( MouseEvent3D.MOUSE_OVER, skill2MouseOverHandler );
				_skill3.addEventListener( MouseEvent3D.MOUSE_OVER, skill3MouseOverHandler );
				_exitPoint.addEventListener(MouseEvent3D.MOUSE_OVER, exitMouseOver);
				_expandButton.addEventListener( MouseEvent.MOUSE_OVER, _expandButtonMouseOverHandler );
				_contractButton.addEventListener( MouseEvent.MOUSE_OVER, _contractButtonMouseOverHandler );
				_evaporateButton.addEventListener( MouseEvent.MOUSE_OVER, _evaporateButtonMouseOverHandler );
				_freezeButton.addEventListener( MouseEvent.MOUSE_OVER, _freezeButtonMouseOverHandler );
				_swimButton.addEventListener( MouseEvent.MOUSE_OVER, _swimButtonMouseOverHandler );
				_increaseStrButton.addEventListener( MouseEvent.MOUSE_OVER, _increaseButtonMouseOverHandler );
				_decreaseStrButton.addEventListener( MouseEvent.MOUSE_OVER, _decreaseButtonMouseOverHandler );			
				_fraserPortraitButton.addEventListener(MouseEvent.MOUSE_OVER, fraserPortraitButtonOverHandler);
				_chrisPortraitButton.addEventListener(MouseEvent.MOUSE_OVER, chrisPortraitButtonOverHandler);
				_tyPortraitButton.addEventListener(MouseEvent.MOUSE_OVER, tyPortraitButtonOverHandler);
				_tylerPortraitButton.addEventListener(MouseEvent.MOUSE_OVER, tylerPortraitButtonOverHandler);
				_mikePortraitButton.addEventListener(MouseEvent.MOUSE_OVER, mikePortraitButtonOverHandler);
				_allPortraitButton.addEventListener(MouseEvent.MOUSE_OVER, allPortraitButtonOverHandler);	
				_expandButton.addEventListener( MouseEvent.MOUSE_OUT, _expandButtonMouseOutHandler );
				_contractButton.addEventListener( MouseEvent.MOUSE_OUT, _contractButtonMouseOutHandler );
				_evaporateButton.addEventListener( MouseEvent.MOUSE_OUT, _evaporateButtonMouseOutHandler );
				_freezeButton.addEventListener( MouseEvent.MOUSE_OUT, _freezeButtonMouseOutHandler );
				_swimButton.addEventListener( MouseEvent.MOUSE_OUT, _swimButtonMouseOutHandler );
				_increaseStrButton.addEventListener( MouseEvent.MOUSE_OUT, _increaseButtonMouseOutHandler );
				_decreaseStrButton.addEventListener( MouseEvent.MOUSE_OUT, _decreaseButtonMouseOutHandler );
				_fraserPortraitButton.addEventListener(MouseEvent.MOUSE_OUT, fraserPortraitButtonOutHandler);
				_chrisPortraitButton.addEventListener(MouseEvent.MOUSE_OUT, chrisPortraitButtonOutHandler);
				_tyPortraitButton.addEventListener(MouseEvent.MOUSE_OUT, tyPortraitButtonOutHandler);
				_tylerPortraitButton.addEventListener(MouseEvent.MOUSE_OUT, tylerPortraitButtonOutHandler);
				_mikePortraitButton.addEventListener(MouseEvent.MOUSE_OUT, mikePortraitButtonOutHandler);
				_allPortraitButton.addEventListener(MouseEvent.MOUSE_OUT, allPortraitButtonOutHandler);	
				_fraserPortraitButton.addEventListener(MouseEvent.CLICK, fraserPortraitButtonClickHandler);
				_chrisPortraitButton.addEventListener(MouseEvent.CLICK, chrisPortraitButtonClickHandler);
				_tyPortraitButton.addEventListener(MouseEvent.CLICK, tyPortraitButtonClickHandler);
				_tylerPortraitButton.addEventListener(MouseEvent.CLICK, tylerPortraitButtonClickHandler);
				_mikePortraitButton.addEventListener(MouseEvent.CLICK, mikePortraitButtonClickHandler);
				_allPortraitButton.addEventListener(MouseEvent.CLICK, allPortraitButtonClickHandler);	
				_expandButton.addEventListener(MouseEvent.CLICK, onExpandButtonClickHandler);
				_contractButton.addEventListener(MouseEvent.CLICK, onContractButtonClickHandler);
				_evaporateButton.addEventListener(MouseEvent.CLICK, onEvaporateButtonClickHandler);
				_freezeButton.addEventListener(MouseEvent.CLICK, onFreezeButtonClickHandler);
				_swimButton.addEventListener(MouseEvent.CLICK, onSwimButtonClickHandler);
				_increaseStrButton.addEventListener(MouseEvent.CLICK, onIncreaseButtonClickHandler);
				_decreaseStrButton.addEventListener(MouseEvent.CLICK, onDecreaseButtonClickHandler);
				_restartGame.addEventListener(MouseEvent.CLICK, restartButtonClickHandler);
				_pauseGame.addEventListener(MouseEvent.CLICK, pauseButtonClickHandler);
				_saveGame.addEventListener(MouseEvent.CLICK, saveButtonClickHandler);
				_instructionV.addEventListener(MouseEvent.CLICK, instructionButtonClickHandler);
				_mainMenu.addEventListener(MouseEvent.CLICK, mainMenuButtonClickHandler);				
				_pauseGame.addEventListener(MouseEvent.MOUSE_OVER, pauseButtonOverHandler);
				_saveGame.addEventListener(MouseEvent.MOUSE_OVER, saveButtonOverHandler);
				_instructionV.addEventListener(MouseEvent.MOUSE_OVER, instructionButtonOverHandler);
				_mainMenu.addEventListener(MouseEvent.MOUSE_OVER, mainMenuButtonOverHandler);				
				_nextLevelScreenButton.addEventListener(MouseEvent.CLICK, nextLevelButtonClickHandler);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler2);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler3);
				stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
				stage.addEventListener(Event.ENTER_FRAME, shakeloop, false, 0, true);
				myTimer.addEventListener(TimerEvent.TIMER, timerListener);
				myTimer2.addEventListener(TimerEvent.TIMER, timerListener2);
				swimTimer.addEventListener(TimerEvent.TIMER, swimTimerListener);
				rainTimer.addEventListener(TimerEvent.TIMER, rainTimerListener);
				swimTimerCD.addEventListener(TimerEvent.TIMER, swimTimerCDListener);		
				totalTimer.addEventListener(TimerEvent.TIMER, clock);
				stage.addEventListener(Event.ENTER_FRAME, isBeingPressed);
				stage.addEventListener(Event.ENTER_FRAME, tick);
				bonusLevel = false;
				}
			}
			else
			{
				addChild(_scoreScreen);				
				removeChild(cursor);
				
				var myTxtFormat1:TextFormat = new TextFormat();
				myTxtFormat1.size = 20;
				myTxtFormat1.align = TextFormatAlign.CENTER;
				
				var myTxtFormat2:TextFormat = new TextFormat();
				myTxtFormat2.size = 30;
				myTxtFormat2.align = TextFormatAlign.CENTER;
				
				txtField1 = new TextField();
				txtField1.defaultTextFormat = myTxtFormat1;
				txtField1.textColor = 0xffffff;
				txtField1.height = 25;
				txtField1.width = 90;
				txtField1.x = 520;
				txtField1.y = 200;
				txtField1.selectable = false;
				if (sec<=9 && min<=9)
				{
					txtField1.text = hour + ":0" + min + ":0" + sec;
				}
				else if (sec>9 && min<=9)
				{
					txtField1.text = hour + ":0" + min + ":" + sec;
				}
				else if (sec<=9 && min>9)
				{
					txtField1.text = hour + ":" + min + ":0" + sec;
				}
				else if (sec>9 && min>9)
				{
					txtField1.text = hour + ":" + min + ":" + sec;
				}
				
				if (min < 13)
				{
					timerPoints = 1500;
				}
				else if (min < 16)
				{
					timerPoints = 1000;
				}
				else if (min > 16)
				{
					timerPoints = 500;
				}
				
				txtField2 = new TextField();
				txtField2.defaultTextFormat = myTxtFormat1;
				txtField2.textColor = 0xffffff;
				txtField2.height = 25;
				txtField2.width = 90;
				txtField2.x = 520;
				txtField2.y = 237;
				txtField2.text = '' + (totalEscaped / 2);
				txtField2.selectable = false;
				
				if (totalEscaped == 30)
				{
					escapedPoints = 5000;
				}
				else if (totalEscaped == 25)
				{
					escapedPoints = 2000;
				}
				else if (totalEscaped > 20)
				{
					escapedPoints = 1500;
				}
				else if (totalEscaped > 15)
				{
					escapedPoints = 1000;
				}
				else
				{
					escapedPoints = 500;
				}
				
				txtField3 = new TextField();
				txtField3.defaultTextFormat = myTxtFormat1;
				txtField3.textColor = 0xffffff;
				txtField3.height = 25;
				txtField3.width = 90;
				txtField3.x = 520;
				txtField3.y = 276;
				txtField3.selectable = false;
				var numOfDeaths:int = 25 - totalEscaped;
				txtField3.text = '' + numOfDeaths;
				
				txtField4 = new TextField();
				txtField4.defaultTextFormat = myTxtFormat1;
				txtField4.textColor = 0xffffff;
				txtField4.height = 25;
				txtField4.width = 90;
				txtField4.x = 520;
				txtField4.y = 314;
				txtField4.selectable = false;
				txtField4.text = '' + lvlRestarts;
				
				if (lvlRestarts == 0)
				{
					restartPoints = 2500;
				}
				else if (lvlRestarts < 3)
				{
					restartPoints = 1500;
				}
				else if (lvlRestarts < 5)
				{
					restartPoints = 500;
				}
				else
				{
					restartPoints = 100;
				}
				
				txtField5 = new TextField();
				txtField5.defaultTextFormat = myTxtFormat1;
				txtField5.textColor = 0xffffff;
				txtField5.height = 25;
				txtField5.width = 90;
				txtField5.x = 520;
				txtField5.y = 352;
				txtField5.selectable = false;
				if (easy)
				{
					txtField5.text = 'Easy';
					difficultyPoints = 500;
				}
				else if (medium)
				{
					txtField5.text = 'Medium';
					difficultyPoints = 1000;
				}
				else if (hard)
				{
					txtField5.text = 'Hard';
					difficultyPoints = 2000;
				}
				
				totalPoints = difficultyPoints + restartPoints + escapedPoints + timerPoints;
				
				txtField6 = new TextField();
				txtField6.defaultTextFormat = myTxtFormat2;
				txtField6.textColor = 0xffffff;
				txtField6.height = 38;
				txtField6.width = 150;
				txtField6.x = 491;
				txtField6.y = 453;
				txtField6.selectable = false;
				txtField6.text = '' + totalPoints;
				
				var mainMenuBtn: Bitmap = new returnToMainMenu();
				var mainMenuBtn2: Bitmap = new returnToMainMenu2();
				_returnToMainMenu = new SimpleButton( mainMenuBtn, mainMenuBtn2, mainMenuBtn, mainMenuBtn );
				_returnToMainMenu.x = 215;
				_returnToMainMenu.y = 525;
				
				addChild(txtField1);
				addChild(txtField2);
				addChild(txtField3);
				addChild(txtField4);
				addChild(txtField5);
				addChild(txtField6);				
				addChild( _returnToMainMenu );
				addChild(cursor);
				
				_returnToMainMenu.addEventListener(MouseEvent.CLICK, returnButtonClickHandler);
			}
		}
		
		private function returnButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			_restartGame.visible = false;
			dimmer.visible = false;
			secondLevel = false;
			thirdLevel = false;
			i = 8;
			s = 1.5;
			_rootContainer.removeChild( _terrain );
			_rootContainer.removeChild( _exitPoint );
			_rootContainer.removeChild( _camera );
			_rootContainer.removeChild( _water );
			skyboxContainer.removeChild(sbox);
			if (highGraphics)
			{
				_rootContainer2.removeChild( _water2 );
			}
			_rootContainer2.removeChild(_rootContainer);
			removeChild(_terrainBar);
			removeChild(_fraserPortraitButton);
			removeChild(_chrisPortraitButton);
			removeChild(_tyPortraitButton);
			removeChild(_tylerPortraitButton);
			removeChild(_mikePortraitButton);
			removeChild(_allPortraitButton);
			removeChild(_totalEscaped);
			removeChild(_nextLevelScreenButton);
			removeChild(dead1);
			removeChild(dead2);
			removeChild(dead3);
			removeChild(dead4);
			removeChild(dead5);
			removeChild(alive1);
			removeChild(alive2);
			removeChild(alive3);
			removeChild(alive4);
			removeChild(alive5);			
			removeChild(_continueeBtn);
			removeChild(_continueWithoutSaving);
			removeChild(_returnnBtn);
			_camera.view.visible = false;
			if (LevelManager.currentLevel == 3)
			{
				_rootContainer.removeChild( _skill1 );
				_rootContainer.removeChild( _skill2 );
				_rootContainer.removeChild( _skill3 );
			}
			else if (LevelManager.currentLevel == 4)
			{
				_rootContainer.removeChild(_skill3);
			}
			else if (LevelManager.currentLevel == 6)
			{
				_rootContainer.removeChild(_skill1);
			}
			_rootContainer.removeChild(myZiggurat);
			if (LevelManager.currentLevel == 5)
			{
				_rootContainer.removeChild(myWave);	
			}			
			_escapedPeoples = 0;
			didEvap = false;
			didFreeze = false;
			myFreeze = false;
			didSwim = false;
			mySwim = false;
			swimWater = false;
			freezeWater = false;
			raining = false;
			myFirstSkill = false;
			mySecondSkill = false;
			myThirdSkill = false;
			doodle = false;
			derp = false;
			herp = false;
			_in = false;
			indicator1 = false;
			indicator2 = false;
			indicator3 = false;
			indicator4 = false;
			indicator5 = false;
			indicator6 = false;
			indicator7 = false;
			indicator8 = false;
			indicator9 = false;
			indicator10 = false;
			areAllSelected = false;
			modelsLoaded = false;
			R1 = 20;
			CD1 = 60;
			CD2 = 60;
			S1 = 15;
			S2 = 20;
			min = 0;
			sec = 0;
			hour = 0;
			rainCounter = 0;
			totalEscaped = 0;
			LevelManager.currentLevel = 1;
			hasGameStarted = false;
			playIntroVideo = true;
			bonusLevel = false;
			myOceanChannel.stop();
			init();	
		}
		
		public function tick(evt:Event):void 
		{
            ticks++;
            var now:uint = getTimer();
            var delta:uint = now - last;
            if (delta >= 1000) {
                var fps:Number = ticks / delta * 1000;
                checkFPS = Number((fps - 0.2).toFixed(1));
                ticks = 0;
                last = now;
            }
        }
		
		private function onZigguratLoaded(e:Event=null):void
		{
			bytes=e.target.data;
			my3ds.parse(bytes);
			
			var zigguratTexture:TextureMaterial = new TextureMaterial();
			zigguratTexture.texture = myZigguratbm.bitmapData;
			
			myZiggurat = my3ds.objects [0] as Mesh;				
			myZiggurat.setMaterialToAllFaces(zigguratTexture);
			
			myZiggurat.x = _exitPoint.x;
			myZiggurat.y = _exitPoint.y;
			myZiggurat.z = 15;
			
			myZiggurat.scaleX = 0.33;
			myZiggurat.scaleY = 0.33;
			myZiggurat.scaleZ = 0.33;
			
			myZiggurat.rotationZ = -0.5;
			
			myZiggurat.sorting = Sorting.DYNAMIC_BSP;
			
			_rootContainer.addChild(myZiggurat);
		}
		
		private function onWaveLoaded(e:Event=null):void
		{
			bytes=e.target.data;
			my3ds.parse(bytes);
			
			var waveTexture:TextureMaterial = new TextureMaterial();
			waveTexture.texture = myWavebm.bitmapData;
			
			myWave = my3ds.objects [0] as Mesh;				
			myWave.setMaterialToAllFaces(waveTexture);
			
			myWave.x = 200;
			myWave.y = 550;
			myWave.z = _water.z - 75;
			
			myWave.rotationZ = 0.3;
			
			myWave.scaleX = 5;
			myWave.scaleZ = 1.5;
			
			myWave.sorting = Sorting.DYNAMIC_BSP;
			
			if (LevelManager.currentLevel == 5)
			{
				_rootContainer.addChild(myWave);
				myWave.visible = false;
			}
		}
		
		private function isBeingPressed(evt:Event):void
		{
			if (pressing == true)
			{
				var terrain: Terrain = _terrain;
				if ( mySectionData  )
				{				
					switch( _selectionManager.selectionState )
					{
						case SelectionStateEnum.LAND_LOWER:
						{
							if (_terrain.myTerrainPoints < 1)
							{
								terrain.alterHeightMap( mySectionData, "down", i, s );
								if (finishedGathering == true)
								{
									myGatherChannel = myGatherSound.play();
									finishedGathering = false;
								}
							}
							else
							{
								_terrain.myTerrainPoints = 1;
								myGatherChannel.stop();
								finishedGathering = true;
								myCantSound.play();
							}
							_terrainBar.setValue(terrain.myTerrainPoints);						
							break;
						}
						case SelectionStateEnum.LAND_RAISE:
						{
							if (_terrain.myTerrainPoints > 0)
							{
								terrain.alterHeightMap( mySectionData, "up", i, s );
								if (finishedRelease == true)
								{
									myReleaseChannel = myReleaseSound.play();
									finishedRelease = false;
								}
							}
							else
							{
								_terrain.myTerrainPoints = 0;
								myReleaseChannel.stop();
								finishedRelease = true;
								myCantSound.play();
							}
							_terrainBar.setValue(terrain.myTerrainPoints);	
							break;
						}
						case SelectionStateEnum.ESCAPEE_MOVE:
						if (areAllSelected)
						{
							for each( var escapee: Escapee in _escapeeManager.escapees )
							{
								var playerDistance: Number = Vector3D.distance(
											new Vector3D(escapee.x,
														escapee.y,
														escapee.z ),
														mySectionData.point );
								Tweener.addTween( escapee, { x:(mySectionData.point.x + Math.floor(Math.random() * (5 - ( -5))) + ( -5)), y:(mySectionData.point.y + Math.floor(Math.random() * (5 - ( -5))) + ( -5)), time:(playerDistance / escapee.speed), onUpdate:function(): void
								{
									for each( var escapee: Escapee in _escapeeManager.escapees )
									{
										if (escapee.z < _water.z)
										{
											escapee.speed = 2.5;
											Tweener.addTween( escapee, { x:(mySectionData.point.x + Math.floor(Math.random() * (5 - ( -5))) + ( -5)), y:(mySectionData.point.y + Math.floor(Math.random() * (5 - ( -5))) + ( -5)), time:(playerDistance / escapee.speed), transition:"linear" } );
											_hud.setDetailText('Water slows down your tribe members!');
										}
									}								
								}, transition:"linear" } );
							}
						}
						else
						{
							if ( _escapeeManager.activeEscapee )
							{
								var myPlayerDistance: Number = Vector3D.distance(
											new Vector3D( _escapeeManager.activeEscapee.x,
														  _escapeeManager.activeEscapee.y,
														  _escapeeManager.activeEscapee.z ),
														  mySectionData.point );
								Tweener.addTween( _escapeeManager.activeEscapee, { x:mySectionData.point.x, y:mySectionData.point.y, time:(myPlayerDistance / _escapeeManager.activeEscapee.speed), onUpdate:function():void
								{
									if (_escapeeManager.activeEscapee.z < _water.z)
									{
										_escapeeManager.activeEscapee.speed = 2.5;
										Tweener.addTween( _escapeeManager.activeEscapee, { x:mySectionData.point.x, y:mySectionData.point.y, time:(myPlayerDistance / _escapeeManager.activeEscapee.speed), transition:"linear" } );
										_hud.setDetailText('Water slows down your tribe members!');
									}
									if (tweenZoom)
									{
										for each( var escapee: Escapee in _escapeeManager.escapees )
										{	
											if (escapee.escapeeName == 'Fraser')
											{
												if (dead1.visible == false)
												{
													_camera.x = _escapeeManager.activeEscapee.x; 
													_camera.y = _escapeeManager.activeEscapee.y; 
													_camera.z = _escapeeManager.activeEscapee.z + 1;
													_camera.fov = 90;
												}
											}
											else if (escapee.escapeeName == 'Chris')
											{
												if (dead2.visible == false)
												{
													_camera.x = _escapeeManager.activeEscapee.x; 
													_camera.y = _escapeeManager.activeEscapee.y; 
													_camera.z = _escapeeManager.activeEscapee.z + 1;
													_camera.fov = 90;
												}
											}
											else if (escapee.escapeeName == 'Ty')
											{
												if (dead3.visible == false)
												{
													_camera.x = _escapeeManager.activeEscapee.x; 
													_camera.y = _escapeeManager.activeEscapee.y; 
													_camera.z = _escapeeManager.activeEscapee.z + 1;
													_camera.fov = 90;
												}
											}
											else if (escapee.escapeeName == 'Tyler')
											{
												if (dead4.visible == false)
												{
													_camera.x = _escapeeManager.activeEscapee.x; 
													_camera.y = _escapeeManager.activeEscapee.y; 
													_camera.z = _escapeeManager.activeEscapee.z + 1;
													_camera.fov = 90;
												}
											}
											else if (escapee.escapeeName == 'Mike')
											{
												if (dead5.visible == false)
												{
													_camera.x = _escapeeManager.activeEscapee.x; 
													_camera.y = _escapeeManager.activeEscapee.y; 
													_camera.z = _escapeeManager.activeEscapee.z + 1;
													_camera.fov = 90;
												}
											}
										}
									}
								}, transition:"linear" } );
							}
						}
						break;
						case SelectionStateEnum.ESCAPEE_SELECT:
						break;
						case SelectionStateEnum.MOVING_CAMERA:
						break;
						case SelectionStateEnum.NONE:
						break;
					}
				}
				myGatherChannel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);
				myReleaseChannel.addEventListener(Event.SOUND_COMPLETE, onPlayback2Complete); 
			}			
		}
		
		private function onPlaybackComplete( e:Event ):void 
		{
			finishedGathering = true;
		}
		
		private function onPlayback2Complete( e:Event ):void 
		{
			finishedRelease = true;
		}
		
		private function handlePress(evt:MouseEvent3D):void
		{
			var terrain: Terrain = _terrain;
			pressing = true;
			mySectionData = terrain.intersectRay( evt.localOrigin, evt.localDirection );
		}

		private function handleRelease(evt:MouseEvent3D):void
		{
			pressing = false;
			myGatherChannel.stop();
			myReleaseChannel.stop();
			finishedGathering = true;
			finishedRelease = true;
		}
		
		private function handleMove(evt:MouseEvent3D):void
		{
			var terrain: Terrain = _terrain;
			mySectionData2 = terrain.intersectRay( evt.localOrigin, evt.localDirection );
			if (pressing)
			{
				mySectionData = terrain.intersectRay( evt.localOrigin, evt.localDirection );
			}
			
			mousePlane.mouseEnabled = false;
			mousePlane.x = mySectionData2.point.x;
			mousePlane.y = mySectionData2.point.y;
			mousePlane.z = mySectionData2.point.z + 0.5;
		}
		
		private function shakescreen(shakestr:Number = 3):void 
		{
			shake = shakestr;
			shaking = true;
		}
		
		private function shakeloop(e:Event):void 
		{
			if (shaking == true) 
			{
				_camera.x += (Math.random() * (shake * 2)) - shake;
				_camera.y += (Math.random() * (shake * 2)) - shake;
				_camera.z += (Math.random() * (shake * 2)) - shake;

				shake -=  shakeDecay;

				if (shake <= 0) 
				{
					shake = 0;
					shaking = false;
				}
			}
		}
			
		private function continueOnwards(e:Event):void
		{
			playIntroVideo = true;
			myVidBG.visible = false;
			flvPlayer.visible = false;
			init();
		}
		
		private function checkboxChange(evt:Event):void
		{
			checkboxStatus = evt.target.selected;			
			if (checkboxStatus == true)
			{
				useCursor = true;
			}
			else
			{
				useCursor = false;
			}					
		}
		
		private function announceChange(e:SliderEvent):void 
		{
			if (e.target.value == 1)
			{
				_graphics.text = "Low";
				lowGraphics = true;
				mediumGraphics = false;
				highGraphics = false;
			}
			else if (e.target.value == 2)
			{
				_graphics.text = "Medium";
				mediumGraphics = true;
				lowGraphics = false;
				highGraphics = false;
			}
			else if (e.target.value == 3)
			{
				_graphics.text = "High";
				highGraphics = true;
				mediumGraphics = false;
				lowGraphics = false;
			}
		}
		
		private function announceChange2(e:SliderEvent):void 
		{
			if (e.target.value == 1)
			{
				_difficulty.text = "Novice";
				easy = true;
				medium = false;
				hard = false;
			}
			else if (e.target.value == 2)
			{
				_difficulty.text = "Casual";
				medium = true;
				easy = false;
				hard = false;
			}
			else if (e.target.value == 3)
			{
				_difficulty.text = "Expert";
				hard = true;
				medium = false;
				easy = false;
			}
		}
		
		private function movecrs( e:MouseEvent ): void
		{
			if (hasGameStarted)
			{
				if (useCursor)
				{
					cursor.x = mouseX;
					cursor.y = mouseY;
					cursor.visible = true;
					Mouse.hide();
				}
			}
		}
		
		// CHARACTER PORTRAITS START		
		private function fraserPortraitButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			areAllSelected = false;
			for each( var escapee: Escapee in _escapeeManager.escapees )
			{
				if (escapee.escapeeName == 'Fraser')
				{		
					_escapeeManager.setActiveEscapee( escapee );
					_fraserPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
					_chrisPortraitButton.filters = [];
					_tyPortraitButton.filters = [];
					_tylerPortraitButton.filters = [];
					_mikePortraitButton.filters = [];
					_allPortraitButton.filters = [];
				}
			}
		}
		
		private function chrisPortraitButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			areAllSelected = false;
			for each( var escapee: Escapee in _escapeeManager.escapees )
			{
				if (escapee.escapeeName == 'Chris')
				{		
					_escapeeManager.setActiveEscapee( escapee );
					_chrisPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
					_fraserPortraitButton.filters = [];
					_tyPortraitButton.filters = [];
					_tylerPortraitButton.filters = [];
					_mikePortraitButton.filters = [];					
					_allPortraitButton.filters = [];
				}
			}
		}
		
		private function tyPortraitButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			areAllSelected = false;
			for each( var escapee: Escapee in _escapeeManager.escapees )
			{
				if (escapee.escapeeName == 'Ty')
				{		
					_escapeeManager.setActiveEscapee( escapee );
					_tyPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
					_chrisPortraitButton.filters = [];
					_fraserPortraitButton.filters = [];
					_tylerPortraitButton.filters = [];
					_mikePortraitButton.filters = [];
					_allPortraitButton.filters = [];
				}
			}
		}
		
		private function tylerPortraitButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			areAllSelected = false;
			for each( var escapee: Escapee in _escapeeManager.escapees )
			{
				if (escapee.escapeeName == 'Tyler')
				{		
					_escapeeManager.setActiveEscapee( escapee );
					_tylerPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
					_chrisPortraitButton.filters = [];
					_tyPortraitButton.filters = [];
					_fraserPortraitButton.filters = [];
					_mikePortraitButton.filters = [];
					_allPortraitButton.filters = [];
				}
			}
		}
		
		private function mikePortraitButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			areAllSelected = false;
			for each( var escapee: Escapee in _escapeeManager.escapees )
			{
				if (escapee.escapeeName == 'Mike')
				{		
					_escapeeManager.setActiveEscapee( escapee );
					_mikePortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
					_chrisPortraitButton.filters = [];
					_tyPortraitButton.filters = [];
					_tylerPortraitButton.filters = [];
					_fraserPortraitButton.filters = [];
					_allPortraitButton.filters = [];
				}
			}
		}
		
		private function allPortraitButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			areAllSelected = true;
			_allPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
			_chrisPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
			_tyPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
			_tylerPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
			_fraserPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
			_mikePortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
		}
		//CHARACTER PORTRAITS END
		
		private function startTheGameOver( e: MouseEvent ):void
		{			
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
		}
		
		private function startTheGame( e: MouseEvent ):void
		{
			myClickSound.play();	
			_loader.unloadAndStop(true);
			hasGameStarted = true;
			init();
			_startGame.visible = false;
			removeChild(_loader);
			_loadGame.visible = false;
			nothingToLoad.visible = false;
			_optionsExplained.visible = false;
			_controlsExplained.visible = false;
			_infoExplained.visible = false;
			_controls.visible = false;
			_info.visible = false;
			_gameVersion.visible = false;
			myTitle2.visible = false;
			_gameOption.visible = false;
			_dimmer2.visible = false;
			_controls.visible = false;
			_quality.visible = false;
			_graphics.visible = false;
			wantCursor.visible = false;
			graphicsSettings.visible = false;
			_howDifficult.visible = false;			
			myOceanChannel = myOceanSound.play(0, 9999, null);
		}
		
		private function showTheControls( e: MouseEvent ):void
		{
			myClickSound.play();
			if (_controlsExplained.visible == false)
			{
				_controlsExplained.visible = true;
				_infoExplained.visible = false;
				_optionsExplained.visible = false;
				_graphics.visible = false;
				_difficulty.visible = false;
				wantCursor.visible = false;
				graphicsSettings.visible = false;
				difficultySettings.visible = false;
				_quality.visible = false;
				_howDifficult.visible = false;
				_dimmer2.visible = true;
			}
			else if (_controlsExplained.visible == true)
			{
				_graphics.visible = false;
				_difficulty.visible = false;
				wantCursor.visible = false;
				graphicsSettings.visible = false;
				difficultySettings.visible = false;
				_quality.visible = false;
				_howDifficult.visible = false;
				_optionsExplained.visible = false;
				_controlsExplained.visible = false;
				_dimmer2.visible = false;
			}
		}
		
		private function showTheControlsOver( e: MouseEvent ):void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
		}
		
		private function showTheControlsPanel( e: MouseEvent ):void
		{
			myClickSound.play();
			if (_controlsExplained.visible == true)
			{
				_controlsExplained.visible = false;
				_dimmer2.visible = false;
			}
		}
		
		private function showTheInfo( e: MouseEvent ):void
		{
			myClickSound.play();
			if (_infoExplained.visible == false)
			{
				_infoExplained.visible = true;
				_controlsExplained.visible = false;
				_optionsExplained.visible = false;
				_dimmer2.visible = true;
			}
			else if (_infoExplained.visible == true)
			{
				_infoExplained.visible = false;
				_dimmer2.visible = false;
			}
		}
		
		private function showTheInfoOver( e: MouseEvent ):void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
		}
		
		private function showTheInfoPanel( e: MouseEvent ):void
		{
			myClickSound.play();
			if (_infoExplained.visible == true)
			{
				_infoExplained.visible = false;
				_dimmer2.visible = false;
			}
		}
		
		private function showTheOptions( e: MouseEvent ):void
		{
			myClickSound.play();
			if (_optionsExplained.visible == false)
			{
				_graphics.visible = true;
				_difficulty.visible = true;
				wantCursor.visible = true;
				graphicsSettings.visible = true;
				difficultySettings.visible = true;
				_quality.visible = true;
				_howDifficult.visible = true;
				_optionsExplained.visible = true;
				_infoExplained.visible = false;
				_controlsExplained.visible = false;
				_dimmer2.visible = true;
			}
			else if (_optionsExplained.visible == true)
			{
				_graphics.visible = false;
				_difficulty.visible = false;
				wantCursor.visible = false;
				graphicsSettings.visible = false;
				difficultySettings.visible = false;
				_quality.visible = false;
				_howDifficult.visible = false;
				_optionsExplained.visible = false;
				_dimmer2.visible = false;
			}
		}
		
		private function showTheOptionsOver( e: MouseEvent ):void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
		}
		
		private function showTheOptionsPanel( e: MouseEvent ):void
		{
			myClickSound.play();
			if (_optionsExplained.visible == true)
			{
				_graphics.visible = false;
				_difficulty.visible = false;
				wantCursor.visible = false;
				graphicsSettings.visible = false;
				difficultySettings.visible = false;
				_quality.visible = false;
				_howDifficult.visible = false;
				_optionsExplained.visible = false;
				_dimmer2.visible = false;
			}
		}	
		
		private function loadButtonClickHandlerOver(e:MouseEvent):void
		{
			var myHoverSound: Sound = (new hoverSound) as Sound;
			myHoverSound.play();
		}
		
		private function onMouseDownHandler( e: MouseEvent ): void
		{
			switch( _selectionManager.selectionState )
			{
				case SelectionStateEnum.MOVING_CAMERA:
					_controller.enable();
				break;
				case SelectionStateEnum.LAND_LOWER:
				case SelectionStateEnum.LAND_RAISE:
				case SelectionStateEnum.ESCAPEE_MOVE:
					_controller.disable();
				break;
				
			}
			
		}
		
		private function keyDownHandler2(e:KeyboardEvent):void 
		{
			var character:String = String.fromCharCode(e.charCode);
			
			if (e.keyCode == 53)
			{
				pressing = false;
				if (i <= 24)
				{
					i += 1;
					_hud.setDetailText( 'Current Radius: ' + i );
					myChatSound.play();
				}
				else
				{	
					_hud.setDetailText( 'You have reached the maximum radius.\nCurrent Radius: ' + i);
					myChatSound.play();
				}
				_expandButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
				_contractButton.filters = [];
				_increaseStrButton.filters = [];
				_decreaseStrButton.filters = [];
			}
			else if (e.keyCode == 54)
			{
				pressing = false;
				if (i >= 4)
				{
					i -= 1;
					_hud.setDetailText( 'Current Radius: ' + i );
					myChatSound.play();
				}
				else
				{
					_hud.setDetailText( 'You have reached the minimum radius.\nCurrent Radius: ' + i);
					myChatSound.play();
				}
				_contractButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
				_expandButton.filters = [];
				_increaseStrButton.filters = [];
				_decreaseStrButton.filters = [];
			}
			else if (e.keyCode == 56)
			{
				pressing = false;
				if (s >= 1.5)
				{
					s -= 0.5;
					_hud.setDetailText( 'Current Strength: ' + s );
					myChatSound.play();
				}
				else
				{
					_hud.setDetailText( 'You have reached the minimum strength.\nCurrent Strength: ' + s);
					myChatSound.play();
				}
				_decreaseStrButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
				_expandButton.filters = [];
				_contractButton.filters = [];
				_increaseStrButton.filters = [];
			}
			else if (e.keyCode == 55)
			{
				pressing = false;
				if (s <= 5.5)
				{
					s += 0.5;
					_hud.setDetailText( 'Current Strength: ' + s );
					myChatSound.play();
				}
				else
				{
					_hud.setDetailText( 'You have reached the minimum strength.\nCurrent Strength: ' + s);
					myChatSound.play();
				}
				_increaseStrButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
				_expandButton.filters = [];
				_contractButton.filters = [];
				_decreaseStrButton.filters = [];
			}
			else if (e.keyCode == 57)
			{
				pressing = false;
				if (myFirstSkill == true)
				{
					if (didEvap == false)
					{
						myEvaporateSound.play();
						_hud.setDetailText( 'Some of the water has just evaporated!' );
						_water.z -= 5;
						_evaporateButton.filters = [ new GlowFilter( 0x0C8F00, 1, 10, 10, 4 ) ];
						_freezeButton.filters = [];
						_swimButton.filters = [];
						didEvap = true;
					}
					else
					{
						_hud.setDetailText( 'Cannot evaporate again.' );
						myChatSound.play();
					}
				}
			}
			else if (e.keyCode == 48)
			{
				pressing = false;
				if (mySecondSkill == true)
				{
					if (myFreeze == false)
					{
						if (didFreeze == false)
						{
							myIceSound.play();
							_hud.setDetailText('The water has just frozen!');
							_freezeButton.filters = [ new GlowFilter( 0x0C8F00, 1, 10, 10, 4 ) ];
							_evaporateButton.filters = [];
							_swimButton.filters = [];
							didFreeze = true;
							myFreeze = true;
							myTimer.start();
							myTimer2.start();
						}
						else 
						{
							_hud.setDetailText( 'Water is still frozen.' );
							myChatSound.play();
						}
					}
					else
					{
						_hud.setDetailText( 'You cannot freeze again just yet.');
						myChatSound.play();
					}
				}
			}
			else if (e.keyCode == 189)
			{
				pressing = false;
				if (myThirdSkill == true)
				{
					if (mySwim == false)
					{
						if (didSwim == false)
						{
							mySwimSound.play();
							_hud.setDetailText('You can now swim!');
							_swimButton.filters = [ new GlowFilter( 0x0C8F00, 1, 10, 10, 4 ) ];
							_evaporateButton.filters = [];
							_freezeButton.filters = []
							didSwim = true;
							mySwim = true;
							swimTimer.start();
							swimTimerCD.start();
						}
						else 
						{
							_hud.setDetailText( 'You are now too tired to swim.' );
							myChatSound.play();
						}
					}
					else
					{
						_hud.setDetailText( 'You cannot swim again just yet.');
						myChatSound.play();
					}
				}
			}
			else if (e.keyCode == 84)
			{
				if (!useCoolCursor)
				{
					mousePlane.visible = true;
					useCoolCursor = true;
				}
				else
				{
					mousePlane.visible = false;
					useCoolCursor = false;
				}
			}
			else if (e.keyCode == 32)
			{
				pressing = false;
				if (!_in)
				{
					_fraserPortraitButton.visible = true;
					_chrisPortraitButton.visible = true;
					_tyPortraitButton.visible = true;
					_tylerPortraitButton.visible = true;
					_mikePortraitButton.visible = true;
					_allPortraitButton.visible = true;
					if (indicator1)
					{
						dead1.visible = true;
					}
					if (indicator2)
					{
						dead2.visible = true;
					}
					if (indicator3)
					{
						dead3.visible = true;
					}
					if (indicator4)
					{
						dead4.visible = true;
					}
					if (indicator5)
					{
						dead5.visible = true;
					}
					if (indicator6)
					{
						alive1.visible = true;
					}
					if (indicator7)
					{
						alive2.visible = true;
					}
					if (indicator8)
					{
						alive3.visible = true;
					}
					if (indicator9)
					{
						alive4.visible = true;
					}
					if (indicator10)
					{
						alive5.visible = true;
					}
					_in = true;
				}
				else if (_in)
				{
					_fraserPortraitButton.visible = false;
					_chrisPortraitButton.visible = false;
					_tyPortraitButton.visible = false;
					_tylerPortraitButton.visible = false;
					_mikePortraitButton.visible = false;
					_allPortraitButton.visible = false;
					if (indicator1)
					{
						dead1.visible = false;
					}
					if (indicator2)
					{
						dead2.visible = false;
					}
					if (indicator3)
					{
						dead3.visible = false;
					}
					if (indicator4)
					{
						dead4.visible = false;
					}
					if (indicator5)
					{
						dead5.visible = false;
					}
					if (indicator6)
					{
						alive1.visible = false;
					}
					if (indicator7)
					{
						alive2.visible = false;
					}
					if (indicator8)
					{
						alive3.visible = false;
					}
					if (indicator9)
					{
						alive4.visible = false;
					}
					if (indicator10)
					{
						alive5.visible = false;
					}
					_in = false;
				}
			}
			else if (e.keyCode == 90)
			{
				pressing = false;
				tweenZoom = true;
			}
			else if (e.keyCode == 77)
			{
				pressing = false;
				if (!miniMapOn)
				{
					_minimapCamera.view.visible = true;
					myMinimapTitle.visible = true;
					if (dead1.visible == false)
					{
						myMinimapOne.visible = true;
					}
					
					if (dead2.visible == false)
					{
						myMinimapTwo.visible = true;
					}
					
					if (dead3.visible == false)
					{
						myMinimapThree.visible = true;
					}
					
					if (dead4.visible == false)
					{
						myMinimapFour.visible = true;
					}
					
					if (dead5.visible == false)
					{
						myMinimapFive.visible = true;
					}
					myMinimapBorder.visible = true;
					miniMapOn = true;
				}
				else
				{
					_minimapCamera.view.visible = false;
					myMinimapTitle.visible = false;
					myMinimapOne.visible = false;
					myMinimapTwo.visible = false;
					myMinimapThree.visible = false;
					myMinimapFour.visible = false;
					myMinimapFive.visible = false;
					myMinimapBorder.visible = false;
					miniMapOn = false;
				}
			}
			else if (e.keyCode == 192)
			{
				pressing = false;
				if (_camera.diagram.visible == false)
				{
					_camera.diagram.visible = true;
				}
				else 
				{
					_camera.diagram.visible = false;
				}
			}
		}
		
		private function keyUpHandler(e:KeyboardEvent):void 
		{
			var character:String = String.fromCharCode(e.charCode);
			
			if (e.keyCode == 90)
			{
				pressing = false;
				tweenZoom = false;
				_camera.fov = 360;
			}
		}
		
		private function keyDownHandler3(e:KeyboardEvent):void 
		{
			var character:String = String.fromCharCode(e.charCode);
			
			if (e.keyCode == 27)
			{
				pressing = false;
				if (!stopTweens)
				{
					mySelectSound.play();
					_pauseMenu.visible = true;
					_pauseGame.x = 250;
					_pauseGame.y = 170;
					_pauseGame.visible = true;
					_saveGame.x = 250;
					_saveGame.y = 245;
					_saveGame.visible = true;
					_instructionV.x = 250;
					_instructionV.y = 325;					
					_instructionV.visible = true;
					_mainMenu.x = 250;
					_mainMenu.y = 400;
					_mainMenu.visible = true;
					
					if (mySwim)
					{
						swimTimerCD.stop();
					}
					if (myFreeze)
					{
						myTimer2.stop();
					}
					
					if (raining)
					{
						rainTimer.stop();
						rain.visible = false;
					}
					dimmer.visible = true;
					_hud.setDetailText( 'Game paused.' );
					Tweener.pauseAllTweens();
					stopTweens = true;
					freezeWater = true;
					swimWater = true;
					totalTimer.stop();
					_selectionManager.selectionState = SelectionStateEnum.NONE;
					removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
					_gameManager.setState( GameStateEnum.GAME_OVER );
				}
				else if (stopTweens)
				{
					mySelectSound.play();
					_pauseMenu.visible = false;
					_pauseGame.visible = false;
					_saveGame.visible = false;
					_instructionV.visible = false;
					_gameSaved.visible = false;
					_mainMenu.visible = false;
					dimmer.visible = false;
					
					if (myFreeze)
					{
						CD1 = 60;						
						myTimer2.reset();
						myTimer2.start();
					}
					
					if (mySwim)
					{
						CD2 = 60;
						swimTimerCD.reset();
						swimTimerCD.start();
					}
					
					if (raining)
					{
						R1 = 20;
						rainTimer.reset();
						rainTimer.start();
						rain.visible = true;
					}
					_hud.setDetailText( 'Game unpaused. Some Timers Reset.' );
					Tweener.resumeAllTweens();
					didFreeze = false;
					didSwim = false;
					stopTweens = false;
					freezeWater = false;
					swimWater = false;
					totalTimer.start();
					addEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
					_gameManager.setState( GameStateEnum.PLAYING );
				}
			}
		}
		
		private function onExpandButtonClickHandler( e: MouseEvent ): void
		{
			if (i <= 24)
			{
			 i += 1;
			 _hud.setDetailText( 'Current Radius: ' + i );
			 myChatSound.play();
			}
			else
			{
				_hud.setDetailText( 'You have reached the maximum radius.\nCurrent Radius: ' + i);
				myChatSound.play();
			}
			_expandButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
			_contractButton.filters = [];
			_increaseStrButton.filters = [];
			_decreaseStrButton.filters = [];
		}
		
		private function onContractButtonClickHandler( e: MouseEvent ): void
		{
			if (i >= 4)
			{
				i -= 1;
				_hud.setDetailText( 'Current Radius: ' + i );
				myChatSound.play();
			}
			else			
			{
				_hud.setDetailText( 'You have reached the minimum radius.\nCurrent Radius: ' + i);
				myChatSound.play();
			}
			_contractButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
			_expandButton.filters = [];
			_increaseStrButton.filters = [];
			_decreaseStrButton.filters = [];
		}
		
		private function onIncreaseButtonClickHandler( e: MouseEvent ): void
		{
			if (s <= 5.5)
			{
				s += 0.5;
				_hud.setDetailText( 'Current Strength: ' + s );
				myChatSound.play();
			}
			else
			{
				_hud.setDetailText( 'You have reached the minimum strength.\nCurrent Strength: ' + s);
				myChatSound.play();
			}
			_increaseStrButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
			_expandButton.filters = [];
			_contractButton.filters = [];
			_decreaseStrButton.filters = [];
		}
		
		private function onDecreaseButtonClickHandler( e: MouseEvent ): void
		{
			if (s >= 1.5)
			{
				s -= 0.5;
				_hud.setDetailText( 'Current Strength: ' + s );
				myChatSound.play();
			}
			else
			{
				_hud.setDetailText( 'You have reached the minimum strength.\nCurrent Strength: ' + s);
				myChatSound.play();
			}
			_decreaseStrButton.filters = [ new GlowFilter( 0xe0e0e0, 1, 10, 10, 4 ) ];
			_expandButton.filters = [];
			_contractButton.filters = [];
			_increaseStrButton.filters = [];
		}
		
		private function onEvaporateButtonClickHandler( e: MouseEvent ): void
		{
			if (myFirstSkill == true)
			{
				if (didEvap == false)
				{
					myEvaporateSound.play();
					_hud.setDetailText( 'Some of the water has just evaporated!' );
					_water.z -= 5;
					_evaporateButton.filters = [ new GlowFilter( 0x0C8F00, 1, 10, 10, 4 ) ];
					_freezeButton.filters = [];
					_swimButton.filters = [];
					didEvap = true;
				}
				else
				{
					_hud.setDetailText( 'Cannot evaporate again.' );
					myChatSound.play();
				}
			}
		}
		
		private function onFreezeButtonClickHandler( e: MouseEvent ): void
		{
			if (mySecondSkill == true)
				{
					if (myFreeze == false)
					{
						if (didFreeze == false)
						{
							myIceSound.play();
							_hud.setDetailText('The water has just frozen!');
							_freezeButton.filters = [ new GlowFilter( 0x0C8F00, 1, 10, 10, 4 ) ];
							_evaporateButton.filters = [];
							_swimButton.filters = [];
							didFreeze = true;
							myFreeze = true;
							myTimer.start();
							myTimer2.start();
						}
						else 
						{
							_hud.setDetailText( 'Water is still frozen.' );
							myChatSound.play();
						}
					}
					else
					{
						_hud.setDetailText( 'You cannot freeze again just yet.');
						myChatSound.play();
					}
				}
		}
		
		private function onSwimButtonClickHandler ( e: MouseEvent ): void
		{
			if (myThirdSkill == true)
			{
				if (mySwim == false)
				{
					if (didSwim == false)
					{
						mySwimSound.play();
						_hud.setDetailText('You can now swim!');
						_swimButton.filters = [ new GlowFilter( 0x0C8F00, 1, 10, 10, 4 ) ];
						_evaporateButton.filters = [];
						_freezeButton.filters = []
						didSwim = true;
						mySwim = true;
						swimTimer.start();
						swimTimerCD.start();
					}
					else 
					{
						_hud.setDetailText( 'You are now too tired to swim.' );
						myChatSound.play();
					}
				}
				else
				{
					_hud.setDetailText( 'You cannot swim again just yet.');
					myChatSound.play();
				}
			}
		}
		
		private function restartButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			lvlRestarts += 1;
			_restartGame.visible = false;
			dimmer.visible = false;
			secondLevel = false;
			thirdLevel = false;
			i = 8;
			s = 1.5;
			_rootContainer.removeChild( _terrain );
			_rootContainer.removeChild( _exitPoint );
			_rootContainer.removeChild( _camera );
			_rootContainer.removeChild( _water );
			skyboxContainer.removeChild(sbox);
			if (highGraphics)
			{
				_rootContainer2.removeChild( _water2 );
			}
			_rootContainer2.removeChild(_rootContainer);
			removeChild(_terrainBar);
			removeChild(_fraserPortraitButton);
			removeChild(_chrisPortraitButton);
			removeChild(_tyPortraitButton);
			removeChild(_tylerPortraitButton);
			removeChild(_mikePortraitButton);
			removeChild(_allPortraitButton);
			removeChild(_totalEscaped);
			removeChild(_nextLevelScreenButton);
			removeChild(dead1);
			removeChild(dead2);
			removeChild(dead3);
			removeChild(dead4);
			removeChild(dead5);
			removeChild(alive1);
			removeChild(alive2);
			removeChild(alive3);
			removeChild(alive4);
			removeChild(alive5);
			_camera.view.visible = false;
			if (LevelManager.currentLevel == 3)
			{
				_rootContainer.removeChild( _skill1 );
				_rootContainer.removeChild( _skill2 );
				_rootContainer.removeChild( _skill3 );
			}
			else if (LevelManager.currentLevel == 4)
			{
				_rootContainer.removeChild(_skill3);
			}
			else if (LevelManager.currentLevel == 6)
			{
				_rootContainer.removeChild(_skill1);
			}
			_rootContainer.removeChild(myZiggurat);
			if (LevelManager.currentLevel == 5)
			{
				_rootContainer.removeChild(myWave);	
			}
			_escapedPeoples = 0;
			didEvap = false;
			didFreeze = false;
			myFreeze = false;
			didSwim = false;
			mySwim = false;
			raining = false;
			myFirstSkill = false;
			mySecondSkill = false;
			myThirdSkill = false;
			doodle = false;
			derp = false;
			herp = false;
			_in = false;
			indicator1 = false;
			indicator2 = false;
			indicator3 = false;
			indicator4 = false;
			indicator5 = false;
			indicator6 = false;
			indicator7 = false;
			indicator8 = false;
			indicator9 = false;
			indicator10 = false;
			areAllSelected = false;
			modelsLoaded = false;
			R1 = 20;
			CD1 = 60;
			CD2 = 60;
			S1 = 15;
			S2 = 20;
			min = 0;
			sec = 0;
			hour = 0;
			rainCounter = 0;
			init();	
		}
		
		private function nextLevelButtonClickHandler( e: MouseEvent ): void
		{	
			mySelectSound.play();
			if (LevelManager.currentLevel == 3)
			{
				_rootContainer.removeChild( _skill1 );
				_rootContainer.removeChild( _skill2 );
				_rootContainer.removeChild( _skill3 );
			}
			else if (LevelManager.currentLevel == 4)
			{
				_rootContainer.removeChild(_skill3);
			}
			else if (LevelManager.currentLevel == 6)
			{
				_rootContainer.removeChild(_skill1);
			}
			
			if (LevelManager.currentLevel == 5)
			{
				if ((totalEscaped / 2) == 25)
				{
					bonusLevel = true;
				}
			}
			
			dimmer.visible = false;
			_nextLevelScreenButton.visible = false;
			_totalEscaped.text = '';
			_hud.setDetailText("Most of your tribe escaped, you passed!\n");
			removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
			var _loc_7:* = LevelManager;
            var _loc_8:* = LevelManager.currentLevel + 1;
            _loc_7.currentLevel = _loc_8;
			i = 8;
			s = 1.5;
			_rootContainer.removeChild( _terrain );
			_rootContainer.removeChild( _exitPoint );
			_rootContainer.removeChild( _camera );
			_rootContainer.removeChild( _water );
			if (highGraphics)
			{
				_rootContainer2.removeChild( _water2 );
			}
			removeChild(_fraserPortraitButton);
			removeChild(_chrisPortraitButton);
			removeChild(_tyPortraitButton);
			removeChild(_tylerPortraitButton);
			removeChild(_mikePortraitButton);
			removeChild(_allPortraitButton);
			removeChild(_totalEscaped);
			removeChild(_nextLevelScreenButton);
			removeChild(_terrainBar);
			removeChild(dead1);
			removeChild(dead2);
			removeChild(dead3);
			removeChild(dead4);
			removeChild(dead5);
			removeChild(alive1);
			removeChild(alive2);
			removeChild(alive3);
			removeChild(alive4);
			removeChild(alive5);
			_rootContainer.removeChild(myZiggurat);
			if (LevelManager.currentLevel == 5)
			{
				_rootContainer.removeChild(myWave);
			}
			if (LevelManager.currentLevel < 6)
			{
				_camera.view.visible = false;
				_escapedPeoples = 0;
				didEvap = false;
				didFreeze = false;
				myFreeze = false;
				didSwim = false;
				mySwim = false;
				raining = false;
				myFirstSkill = false;
				mySecondSkill = false;
				myThirdSkill = false;
				doodle = false;
				derp = false;
				herp = false;
				_in = false;
				modelsLoaded = false;
				R1 = 20;
				CD1 = 60;
				CD2 = 60;
				S1 = 15;
				S2 = 20;
				rainCounter = 0;
				indicator1 = false;
				indicator2 = false;
				indicator3 = false;
				indicator4 = false;
				indicator5 = false;
				indicator6 = false;
				indicator7 = false;
				indicator8 = false;
				indicator9 = false;
				indicator10 = false;
				areAllSelected = false;
			}
			init();				
		}
		
		private function mainMenuButtonClickHandler( e: MouseEvent ): void
		{			
			_continueWithoutSaving.visible = true;
			_continueeBtn.visible = true;
			_returnnBtn.visible = true;
			
			_continueeBtn.addEventListener(MouseEvent.CLICK, continueToMainMenu);
			_returnnBtn.addEventListener(MouseEvent.CLICK, returnToTheGame);
			_continueeBtn.addEventListener(MouseEvent.MOUSE_OVER, continueToMainMenuOver);
			_returnnBtn.addEventListener(MouseEvent.MOUSE_OVER, returnToTheGameOver);
		}
		
		private function continueToMainMenu( e: MouseEvent ): void
		{
			mySelectSound.play();
			_restartGame.visible = false;
			dimmer.visible = false;
			secondLevel = false;
			thirdLevel = false;
			i = 8;
			s = 1.5;
			_rootContainer.removeChild( _terrain );
			_rootContainer.removeChild( _exitPoint );
			_rootContainer.removeChild( _camera );
			_rootContainer.removeChild( _water );
			skyboxContainer.removeChild(sbox);
			//for each( var esc: Escapee in level.escapeeList )
			//{
				//_escapeeManager.removeEscapee( esc );
			//}
			//for each( var escapee: Escapee in _escapeeManager.escapees )
			//{
				//_escapeeManager.clearAllEscapees();
				//_escapeeManager.removeEscapee(escapee);
				//_rootContainer.removeChild(escapee);
			//}
			if (highGraphics)
			{
				_rootContainer2.removeChild( _water2 );
			}
			_rootContainer2.removeChild(_rootContainer);
			removeChild(_terrainBar);
			removeChild(_fraserPortraitButton);
			removeChild(_chrisPortraitButton);
			removeChild(_tyPortraitButton);
			removeChild(_tylerPortraitButton);
			removeChild(_mikePortraitButton);
			removeChild(_allPortraitButton);
			removeChild(_totalEscaped);
			removeChild(_nextLevelScreenButton);
			removeChild(dead1);
			removeChild(dead2);
			removeChild(dead3);
			removeChild(dead4);
			removeChild(dead5);
			removeChild(alive1);
			removeChild(alive2);
			removeChild(alive3);
			removeChild(alive4);
			removeChild(alive5);
			removeChild(_continueeBtn);
			removeChild(_continueWithoutSaving);
			removeChild(_returnnBtn);
			_camera.view.visible = false;
			if (LevelManager.currentLevel == 3)
			{
				_rootContainer.removeChild( _skill1 );
				_rootContainer.removeChild( _skill2 );
				_rootContainer.removeChild( _skill3 );
			}
			else if (LevelManager.currentLevel == 4)
			{
				_rootContainer.removeChild(_skill3);
			}
			else if (LevelManager.currentLevel == 6)
			{
				_rootContainer.removeChild(_skill1);
			}
			_rootContainer.removeChild(myZiggurat);
			if (LevelManager.currentLevel == 5)
			{
				_rootContainer.removeChild(myWave);	
			}			
			_escapedPeoples = 0;
			didEvap = false;
			didFreeze = false;
			myFreeze = false;
			didSwim = false;
			swimWater = false;
			mySwim = false;
			freezeWater = false;
			raining = false;
			myFirstSkill = false;
			mySecondSkill = false;
			myThirdSkill = false;
			doodle = false;
			derp = false;
			herp = false;
			_in = false;
			indicator1 = false;
			indicator2 = false;
			indicator3 = false;
			indicator4 = false;
			indicator5 = false;
			indicator6 = false;
			indicator7 = false;
			indicator8 = false;
			indicator9 = false;
			indicator10 = false;
			areAllSelected = false;
			modelsLoaded = false;
			R1 = 20;
			CD1 = 60;
			CD2 = 60;
			S1 = 15;
			S2 = 20;
			min = 0;
			sec = 0;
			hour = 0;
			rainCounter = 0;
			totalEscaped = 0;
			LevelManager.currentLevel = 1;
			hasGameStarted = false;
			playIntroVideo = true;
			bonusLevel = false;
			restartingGameYo = true;
			myOceanChannel.stop();
			removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
			_gameManager.setState( GameStateEnum.GAME_OVER );
			init();	
		}
		
		private function returnToTheGame( e: MouseEvent ): void
		{
			mySelectSound.play();
			_continueWithoutSaving.visible =false;
			_continueeBtn.visible = false;
			_returnnBtn.visible = false;
		}
		
		private function returnToTheGameOver( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
		}
		
		private function continueToMainMenuOver( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
		}
		
		private function instructionButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			_newExitBtn.visible = true;	
			flvPlayer2.visible = true;
			flvPlayer2.seek(0);
			flvPlayer2.play();
			flvPlayer2.visible = true;
			myOceanChannel.stop();
			watchingTheTutorial = true;
			
			flvPlayer2.addEventListener(Event.COMPLETE, continueOnwards2);
			_newExitBtn.addEventListener(MouseEvent.CLICK, clickyExit);
		}
		
		private function clickyExit( e: MouseEvent ): void
		{
			watchingTheTutorial = false;
			mySelectSound.play();
			flvPlayer2.visible = false;
			flvPlayer2.stop();
			_newExitBtn.visible = false;
			myOceanChannel = myOceanSound.play(0, 9999, null);
		}
		
		private function continueOnwards2(e:Event):void
		{
			watchingTheTutorial = false;
			mySelectSound.play();
			flvPlayer2.visible = false;
			flvPlayer2.stop();
			_newExitBtn.visible = false;
			myOceanChannel = myOceanSound.play(0, 9999, null);
		}
		
		private function saveButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			_gameSaved.visible = true;
			savedStuff.data.currentLevel = LevelManager.currentLevel;
			savedStuff.data.waterLevel = _water.z;
			savedStuff.data.cameraX = _camera.x;
			savedStuff.data.cameraY = _camera.y;
			savedStuff.data.cameraZ = _camera.z;
			savedStuff.data.terrainPoints = _terrain.myTerrainPoints;
			savedStuff.data.min = min;
			savedStuff.data.sec = sec;
			savedStuff.data.hour = hour;
			savedStuff.data.escapedPeople = _escapedPeoples;
			
			if (dead1.visible == true)
			{
				savedStuff.data.fraserDead = true;
			}
			else
			{
				savedStuff.data.fraserDead = false;
			}
			
			if (dead2.visible == true)
			{
				savedStuff.data.chrisDead = true;
			}
			else
			{
				savedStuff.data.chrisDead = false;
			}
			
			if (dead3.visible == true)
			{
				savedStuff.data.tyDead = true;
			}
			else
			{
				savedStuff.data.tyDead = false;
			}
			
			if (dead4.visible == true)
			{
				savedStuff.data.tylerDead = true;
			}
			else
			{
				savedStuff.data.tylerDead = false;
			}
			
			if (dead5.visible == true)
			{
				savedStuff.data.mikeDead = true;
			}
			else
			{
				savedStuff.data.mikeDead = false;
			}
			
			// Escaped
			
			if (alive1.visible == true)
			{
				savedStuff.data.fraserAlive = true;
			}
			else
			{
				savedStuff.data.fraserAlive = false;
			}
			
			if (alive2.visible == true)
			{
				savedStuff.data.chrisAlive = true;
			}
			else
			{
				savedStuff.data.chrisAlive = false;
			}
			
			if (alive3.visible == true)
			{
				savedStuff.data.tyAlive = true;
			}
			else
			{
				savedStuff.data.tyAlive = false;
			}
			
			if (alive4.visible == true)
			{
				savedStuff.data.tylerAlive = true;
			}
			else
			{
				savedStuff.data.tylerAlive = false;
			}
			
			if (alive5.visible == true)
			{
				savedStuff.data.mikeAlive = true;
			}
			else
			{
				savedStuff.data.mikeAlive = false;
			}
			
			for each( var escapee:Escapee in _escapeeManager.escapees )
			{
				if (escapee.escapeeName == 'Fraser')
				{
					savedStuff.data.fraserX = escapee.x;	
					savedStuff.data.fraserY = escapee.y;	
				}
				else if (escapee.escapeeName == 'Chris')
				{
					savedStuff.data.chrisX = escapee.x;	
					savedStuff.data.chrisY = escapee.y;	
				}
				else if (escapee.escapeeName == 'Ty')
				{
					savedStuff.data.tyX = escapee.x;	
					savedStuff.data.tyY = escapee.y;	
				}
				else if (escapee.escapeeName == 'Tyler')
				{
					savedStuff.data.tylerX = escapee.x;	
					savedStuff.data.tylerY = escapee.y;	
				}
				else if (escapee.escapeeName == 'Mike')
				{
					savedStuff.data.mikeX = escapee.x;	
					savedStuff.data.mikeY = escapee.y;	
				}
			}
			
			if (_skill1.visible == true)
			{
				savedStuff.data.skill1Visible = true;
			}
			else
			{
				savedStuff.data.skill1Visible = false;
			}
			
			if (_skill2.visible == true)
			{
				savedStuff.data.skill2Visible = true;
			}
			else
			{
				savedStuff.data.skill2Visible = false;
			}
			
			if (_skill3.visible == true)
			{
				savedStuff.data.skill3Visible = true;
			}
			else
			{
				savedStuff.data.skill3Visible = false;
			}
			
			if (LevelManager.currentLevel == 5)
			{
				savedStuff.data.wavePositionX = myWave.x;
				savedStuff.data.wavePositionY = myWave.y;
				savedStuff.data.wavePositionZ = myWave.z;
			}
			
			savedStuff.flush();
		}
		
		private function warningButtonClickHandler( e: MouseEvent ): void
		{
			_showWarning.visible = false;
			mySelectSound.play();
		}
		
		private function world1ButtonClickHandler( e: MouseEvent ): void
		{
			_world1.visible = false;
			mySelectSound.play();
		}
		
		private function world2ButtonClickHandler( e: MouseEvent ): void
		{
			_world2.visible = false;
			mySelectSound.play();
		}
		
		private function world3ButtonClickHandler( e: MouseEvent ): void
		{
			_world3.visible = false;
			mySelectSound.play();
		}
		
		private function world4ButtonClickHandler( e: MouseEvent ): void
		{
			_world4.visible = false;
			mySelectSound.play();
		}
		
		private function world5ButtonClickHandler( e: MouseEvent ): void
		{
			_world5.visible = false;
			mySelectSound.play();
		}
		
		private function world6ButtonClickHandler( e: MouseEvent ): void
		{
			_world6.visible = false;
			mySelectSound.play();
		}
		
		private function loadButtonClickHandler( e: MouseEvent ): void
		{			
			mySelectSound.play();
			LevelManager.currentLevel = savedStuff.data.currentLevel;
			_loader.unloadAndStop(true);
			hasGameStarted = true;
			init();
			min = savedStuff.data.min;
			sec = savedStuff.data.sec;
			hour = savedStuff.data.hour;
			_terrain.myTerrainPoints = savedStuff.data.terrainPoints;
			_terrainBar.setValue(_terrain.myTerrainPoints);
			_water.z = savedStuff.data.waterLevel;
			_camera.x = savedStuff.data.cameraX;
			_camera.y = savedStuff.data.cameraY;
			_camera.z = savedStuff.data.cameraZ;
			_escapedPeoples = savedStuff.data.escapedPeople;
			_hud.setDetailText('Game sucessfully loaded.');
			myChatSound.play();
			
			if (savedStuff.data.skill1Visiable == true)
			{
				_skill1.visible = true;
			}
			else
			{
				_skill1.visible = false;
				myFirstSkill = true;
			}
			
			if (savedStuff.data.skill2Visiable == true)
			{
				_skill2.visible = true;
			}
			else
			{
				_skill2.visible = false;
				mySecondSkill = true;
			}
			
			if (savedStuff.data.skill3Visiable == true)
			{
				_skill3.visible = true;
			}
			else
			{
				_skill3.visible = false;
				myThirdSkill = true;
			}
			
			for each( var escapee1:Escapee in _escapeeManager.escapees )
			{
				if (escapee1.escapeeName == 'Fraser')
				{
					escapee1.x = savedStuff.data.fraserX;	
					escapee1.y = savedStuff.data.fraserY;	
				}
				else if (escapee1.escapeeName == 'Chris')
				{
					escapee1.x = savedStuff.data.chrisX;	
					escapee1.y = savedStuff.data.chrisY;	
				}
				else if (escapee1.escapeeName == 'Ty')
				{
					escapee1.x = savedStuff.data.tyX;	
					escapee1.y = savedStuff.data.tyY;	
				}
				else if (escapee1.escapeeName == 'Tyler')
				{
					escapee1.x = savedStuff.data.tylerX;	
					escapee1.y = savedStuff.data.tylerY;	
				}
				else if (escapee1.escapeeName == 'Mike')
				{
					escapee1.x = savedStuff.data.mikeX;	
					escapee1.y = savedStuff.data.mikeY;	
				}
			}
			
			for each( var escapee:Escapee in _escapeeManager.escapees )
			{
				if (savedStuff.data.fraserDead == true)
				{
					if (escapee.escapeeName == 'Fraser')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator1 = true;
					}				
				}
			
				if (savedStuff.data.chrisDead == true)
				{
					if (escapee.escapeeName == 'Chris')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator2 = true;
					}			
				}
				
				if (savedStuff.data.tyDead == true)
				{
					if (escapee.escapeeName == 'Ty')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator3 = true;
					}				
				}
				
				if (savedStuff.data.tylerDead == true)
				{
					if (escapee.escapeeName == 'Tyler')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator4 = true;
					}			
				}
				
				if (savedStuff.data.mikeDead == true)
				{
					if (escapee.escapeeName == 'Mike')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator5 = true;
					}				
				}
				
				// Escaped
				
				if (savedStuff.data.fraserAlive == true)
				{
					if (escapee.escapeeName == 'Fraser')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator6 = true;
					}				
				}
			
				if (savedStuff.data.chrisAlive == true)
				{
					if (escapee.escapeeName == 'Chris')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator7 = true;
					}			
				}
				
				if (savedStuff.data.tyAlive == true)
				{
					if (escapee.escapeeName == 'Ty')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator8 = true;
					}				
				}
				
				if (savedStuff.data.tylerAlive == true)
				{
					if (escapee.escapeeName == 'Tyler')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator9 = true;
					}			
				}
				
				if (savedStuff.data.mikeAlive == true)
				{
					if (escapee.escapeeName == 'Mike')
					{
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						indicator10 = true;
					}				
				}
			}
			
			if (LevelManager.currentLevel == 5)
			{
				myWave.x = savedStuff.data.wavePositionX;
				myWave.y = savedStuff.data.wavePositionY;
				myWave.z = savedStuff.data.wavePositionZ;
			}
			
			_startGame.visible = false;
			removeChild(_loader);
			_loadGame.visible = false;
			nothingToLoad.visible = false;
			_optionsExplained.visible = false;
			_controlsExplained.visible = false;
			_infoExplained.visible = false;
			_controls.visible = false;
			_info.visible = false;
			_gameVersion.visible = false;
			myTitle2.visible = false;
			_gameOption.visible = false;
			_dimmer2.visible = false;
			_controls.visible = false;
			_quality.visible = false;
			_graphics.visible = false;
			wantCursor.visible = false;
			graphicsSettings.visible = false;
			_howDifficult.visible = false;
		}
		
		private function pauseButtonClickHandler( e: MouseEvent ): void
		{
			mySelectSound.play();
			if (myFreeze)
			{
				CD1 = 60;						
				myTimer2.reset();
				myTimer2.start();
			}
			
			if (mySwim)
			{
				CD2 = 60;
				swimTimerCD.reset();
				swimTimerCD.start();
			}
			
			if (raining)
			{
				R1 = 20;
				rainTimer.reset();
				rainTimer.start();
				rain.visible = true;
			}
			_gameSaved.visible = false;
			_pauseGame.visible = false;
			_saveGame.visible = false;
			_instructionV.visible = false;
			_mainMenu.visible = false;
			_pauseMenu.visible = false;
			dimmer.visible = false;
			_hud.setDetailText( 'Game unpaused. Some Timers Reset.' );
			Tweener.resumeAllTweens();
			stopTweens = false;
			freezeWater = false;
			swimWater = false;
			didFreeze = false;
			didSwim = false;
			totalTimer.start();
			addEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
			_gameManager.setState( GameStateEnum.PLAYING );
		}
		
		private function timerListener (e:TimerEvent):void
		{
			_hud.setDetailText('Water has melted and is rising again!');
			myChatSound.play();
			didFreeze = false;
			S1 = 15;
		}		
		
		private function timerListener2 (e:TimerEvent):void
		{
			myCDfinishedSound.play();
			_hud.setDetailText('You may now freeze the water again!');
			myFreeze = false;
			CD1 = 60;
		}
		
		private function swimTimerListener (e:TimerEvent):void
		{
			_hud.setDetailText('You are too tired to swim!');
			myChatSound.play();
			didSwim = false;
			S2 = 20;
		}
		
		private function swimTimerCDListener (e:TimerEvent):void
		{
			myCDfinishedSound.play();
			_hud.setDetailText('You are rested enough to swim again!');
			mySwim = false;
			CD2 = 60;
		}
		
		private function rainTimerListener (e:TimerEvent):void
		{
			raining = false;
			removeChild(rain);
			R1 = 20;
		}
		
		private function clock (e:TimerEvent):void
		{	
			var terrain:Terrain = _terrain;
			var randVar:int = (Math.random() * (100 - 1) + 1);
			var myString:String;
			sec++;
			rainCounter++;
			if (sec > 59)
			{
				min++;
				sec=0;
			}
			if (min==60)
			{
				hour++;
				min=0;
				sec=0;
			}
			
			if (sec > 1)
			{
				flvPlayer2.stop();
				modelsLoaded = true;
				if (lowGraphics)
				{
					myZiggurat.visible = false;
				}
			}
			
			if (sec > 3)
			{
				initLoad =  true;
			}
		
			if (sec<=9 && min<=9)
			{
				myString = hour + ":0" + min + ":0" + sec;
			}
			else if (sec>9 && min<=9)
			{
				myString = hour + ":0" + min + ":" + sec;
			}
			else if (sec<=9 && min>9)
			{
				myString = hour + ":" + min + ":0" + sec;
			}
			else if (sec>9 && min>9)
			{
				myString = hour + ":" + min + ":" + sec;
			}
			
			if (LevelManager.currentLevel == 5)
			{
				if (rainCounter == 47)
				{
					_hud.setDetailText('Watch out! A tsunami approaches!');
					myWave.visible = true;
					Tweener.addTween( myWave, { x: 200, y: 350, z: _water.z + 22, time:3, transition:"linear" } );
				}
				else if (rainCounter == 50)
				{
					Tweener.addTween( myWave, { x: 100, y: -500, time:30, transition:"linear" } );
					mytidalWaveSound.play();
				}
				else if (rainCounter == 79)
				{
					Tweener.addTween( myWave, { x: 100, y: -600, z: _water.z -75, time:3, transition:"linear" } );
				}
				else if (rainCounter == 83)
				{
					myWave.visible = false;
					_rootContainer2.removeChild(myWave);
				}
				
				if (rainCounter > 58 && rainCounter < 68)
				{
					_terrain.myTsunami();
				}
			}			
			
			if (rainCounter == 50)
			{
				if (LevelManager.currentLevel >= 2)
				{
					_hud.setDetailText('Beware of natural disastors!');
					myChatSound.play();
				}
			}
			
			if (rainCounter == 40)
			{
				if (LevelManager.currentLevel == 2)
				{
					myQuakeSound.play();
					_hud.setDetailText('An earthquake has occured!');
					myChatSound.play();
					terrain.myQuake();
					shakescreen(3);
				}
			}
			else if (rainCounter == 20)
			{
				if (LevelManager.currentLevel == 4)
				{
					myQuakeSound.play();
					_hud.setDetailText('An earthquake has occured!');
					myChatSound.play();
					terrain.myQuake();
					shakescreen(3);
				}
				if (LevelManager.currentLevel == 6)
				{
					if (!raining)
					{
						myRainSound.play();
						_hud.setDetailText('It has started to rain! The water rises quickly!');
						myChatSound.play();
						raining = true;
						rain = new Rain();  
						rainTimer.start();
						rain.init(225, 55, 10, 800, 800, "left");  
						addChild(rain);
					}
				}
			}			
			
			if (rainCounter >= 65)
			{
				if (LevelManager.currentLevel >= 2)
				{
					if (randVar == 55)
					{					
						_hud.setDetailText('An earthquake has occured!');
						myChatSound.play();
						terrain.myQuake();
						shakescreen(3);
					}
					if (!raining)
					{
						if (LevelManager.currentLevel == 6)
						{
							if (randVar == 25 || randVar == 26 || randVar == 27)
							{
								myRainSound.play();
								_hud.setDetailText('It has started to rain! The water rises quickly!');
								myChatSound.play();
								raining = true;
								rain = new Rain();  
								rainTimer.start();
								rain.init(225, 55, 10, 800, 800, "left");  
								addChild(rain);
							}
						}
						else
						{
							if (randVar == 25)
							{
								myRainSound.play();
								_hud.setDetailText('It has started to rain! The water rises quickly!');
								myChatSound.play();
								raining = true;
								rain = new Rain();  
								rainTimer.start();
								rain.init(225, 55, 10, 800, 800, "left");  
								addChild(rain);
							}
						}
					}
				}
			}
			
			// Skill timers start			
			if (myFreeze)
			{
				_coolDownBG1.visible = false;
				_coolDownBG.visible = true;
				var myString2:String;
				CD1--;
				myString2 = '' +  CD1;				
				_hud.setDetailText4('Water can be frozen again in: ' + myString2 + ' seconds.');
			}
			else
			{
				_coolDownBG1.visible = true;
				_coolDownBG.visible = false;
				_hud.setDetailText4('');
			}
			
			if (mySwim)
			{
				_coolDownBG1.visible = false;
				_coolDownBG.visible = true;
				var myString3:String;
				CD2--;
				myString3 = '' +  CD2;				
				_hud.setDetailText5('You can swim again in: ' + myString3 + ' seconds.');
			}
			else
			{
				_coolDownBG1.visible = true;
				_coolDownBG.visible = false;
				_hud.setDetailText5('');
			}
			
			if (didFreeze)
			{
				_coolDownBG1.visible = false;
				_coolDownBG.visible = true;
				var myString4:String;
				S1--;
				myString4 = '' +  S1;				
				_hud.setDetailText6('Water is frozen for: ' + myString4 + ' more seconds.');
			}
			else
			{
				_coolDownBG1.visible = true;
				_coolDownBG.visible = false;
				_hud.setDetailText6('');
			}
			
			if (didSwim)
			{
				_coolDownBG1.visible = false;
				_coolDownBG.visible = true;
				var myString5:String;
				S2--;
				myString5 = '' +  S2;				
				_hud.setDetailText7('You can swim for: ' + myString5 + ' more seconds.');
			}
			else
			{
				_coolDownBG1.visible = true;
				_coolDownBG.visible = false;
				_hud.setDetailText7('');
			}
			
			if (raining)
			{
				_coolDownBG1.visible = false;
				_coolDownBG.visible = true;
				var myString6:String;
				R1--;
				myString6 = '' + R1;
				_hud.setDetailText8('The rain will fall for: ' + myString6 + ' more seconds.');
			}
			else
			{
				_coolDownBG1.visible = true;
				_coolDownBG.visible = false;
				_hud.setDetailText8('');
			}
			
			// Skill timers end
			
			_hud.setDetailText3('' + myString);
		}	
		
		private function firstSkill():void 
		{
			if (doodle == false)
			{
				_hud.setDetailText('You have unlocked the ability to evaporate water!');
				myEscapedSound.play();
			}
			doodle = true;
			_evaporateButton.visible = true;
			_skill1.visible = false;
			myFirstSkill = true;
		}
		
		private function secondSkill():void 
		{
			if (derp == false)
			{
				_hud.setDetailText('You have unlocked the ability to freeze water!');
				myEscapedSound.play();
			}
			derp = true;
			_freezeButton.visible = true;
			_skill2.visible = false;
			mySecondSkill = true;
		}
		
		private function thirdSkill():void 
		{
			if (herp == false)
			{
				_hud.setDetailText('You have unlocked the ability to swim in water!');
				myEscapedSound.play();
			}
			herp = true;
			_swimButton.visible = true;
			_skill3.visible = false;
			myThirdSkill = true;
		}
		
		private function onWaterClickHandler( e: MouseEvent3D ): void
		{
			_hud.setDetailText("Dat's water.");
		}
		
		private function onPlayerMouseOverHandler( e: MouseEvent3D ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			
			var escapee: Escapee = ( e.target ) as Escapee;
			
			var text: String = "";
			text = "Name: " + escapee.escapeeName;
			text +=  "\nSpeed: " + Math.floor( escapee.speed  * 100 ) + "%";			
			_hud.setDetailText( text );
		}
		
		private function skill1MouseOverHandler( e: MouseEvent3D ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText('Evaporate Water Skill');
		}
		
		private function skill2MouseOverHandler( e: MouseEvent3D ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText('Freeze Water Skill');
		}
		
		private function skill3MouseOverHandler( e: MouseEvent3D ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText('Swim In Water Skill');
		}
		
		private function _expandButtonMouseOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Expand the radius of the Godsend.' );
		}
		
		private function _expandButtonMouseOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText( '' );
		}
		
		private function _contractButtonMouseOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Reduce the radius of the Godsend.' );
		}
		
		private function _contractButtonMouseOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText( '' );
		}
		
		private function _increaseButtonMouseOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Increase the strength of the Godsend.' );
		}
		
		private function _increaseButtonMouseOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText( '' );
		}
		
		private function _decreaseButtonMouseOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Decrease the strength of the Godsend.' );
		}
		
		private function _decreaseButtonMouseOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText( '' );
		}
		
		private function _evaporateButtonMouseOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Evaporate some of the water\n(only 1 use per level).' );
		}
		
		private function _evaporateButtonMouseOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText( '' );
		}
		
		private function _freezeButtonMouseOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Freeze the water for 15 seconds.\n(1 minute cooldown).' );
		}

		private function _freezeButtonMouseOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText( '' );
		}
		
		private function _swimButtonMouseOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Swim in the water for 20 seconds.\n(1 minute cooldown).' );
		}

		private function _swimButtonMouseOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText( '' );
		}
		
		private function exitMouseOver( e: MouseEvent3D ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'This is the exit portal. Navigate your tribe\nmembers here to escape this area.' );
		}	
		
		private function onPlayerMouseOutHandler( e: MouseEvent3D ): void
		{
			_hud.setDetailText('');
		}
		
		private function fraserPortraitButtonOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText('');
		}
		
		private function chrisPortraitButtonOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText('');
		}
		
		private function tyPortraitButtonOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText('');
		}
		
		private function tylerPortraitButtonOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText('');
		}
		
		private function mikePortraitButtonOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText('');
		}
		
		private function allPortraitButtonOutHandler( e: MouseEvent ): void
		{
			_hud.setDetailText('');
		}
		
		private function fraserPortraitButtonOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Select Fraser?' );
		}
		
		private function chrisPortraitButtonOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Select Chris?' );
		}
		
		private function tyPortraitButtonOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Select Ty?' );
		}
		
		private function tylerPortraitButtonOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Select Tyler?' );
		}
		
		private function mikePortraitButtonOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Select Mike?' );
		}
		
		private function allPortraitButtonOverHandler( e: MouseEvent ): void
		{
			var myHoverSound:Sound = (new hoverSound) as Sound;
			myHoverSound.play();
			_hud.setDetailText( 'Select everyone?' );
		}
		
		private function saveButtonOverHandler( e: MouseEvent ): void
		{
			if (!watchingTheTutorial)
			{
				var myHoverSound:Sound = (new hoverSound) as Sound;
				myHoverSound.play();
			}
		}
		
		private function pauseButtonOverHandler( e: MouseEvent ): void
		{
			if (!watchingTheTutorial)
			{
				var myHoverSound:Sound = (new hoverSound) as Sound;
				myHoverSound.play();
			}
		}
		
		private function instructionButtonOverHandler( e: MouseEvent ): void
		{
			if (!watchingTheTutorial)
			{
				var myHoverSound:Sound = (new hoverSound) as Sound;
				myHoverSound.play();
			}
		}
		
		private function mainMenuButtonOverHandler( e: MouseEvent ): void
		{
			if (!watchingTheTutorial)
			{			
				var myHoverSound:Sound = (new hoverSound) as Sound;
				myHoverSound.play();
			}
		}
		
		private function onPlayerMouseDownHandler( e: MouseEvent3D ): void
		{
			mySelectSound.play();
			areAllSelected = false;
			var escapee: Escapee = e.target as Escapee;
			_escapeeManager.setActiveEscapee( escapee );
			if (escapee.escapeeName == 'Fraser')
			{
				_fraserPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
				_chrisPortraitButton.filters = [];
				_tyPortraitButton.filters = [];
				_tylerPortraitButton.filters = [];
				_mikePortraitButton.filters = [];
				_allPortraitButton.filters = [];
			}
			else if (escapee.escapeeName == 'Chris')
			{
				_chrisPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
				_fraserPortraitButton.filters = [];
				_tyPortraitButton.filters = [];
				_tylerPortraitButton.filters = [];
				_mikePortraitButton.filters = [];
				_allPortraitButton.filters = [];
			}
			else if (escapee.escapeeName == 'Ty')
			{
				_tyPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
				_chrisPortraitButton.filters = [];
				_fraserPortraitButton.filters = [];
				_tylerPortraitButton.filters = [];
				_mikePortraitButton.filters = [];
				_allPortraitButton.filters = [];
			}
			else if (escapee.escapeeName == 'Tyler')
			{
				_tylerPortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
				_chrisPortraitButton.filters = [];
				_tyPortraitButton.filters = [];
				_fraserPortraitButton.filters = [];
				_mikePortraitButton.filters = [];
				_allPortraitButton.filters = [];
			}
			else if (escapee.escapeeName == 'Mike')
			{
				_mikePortraitButton.filters = [ new GlowFilter( 0xFFFFFF, 1, 10, 10, 3 ) ];
				_chrisPortraitButton.filters = [];
				_tyPortraitButton.filters = [];
				_tylerPortraitButton.filters = [];
				_fraserPortraitButton.filters = [];
				_allPortraitButton.filters = [];
			}
		}
		
		 private function setObjectsOnGround() : void
        {
            var _loc_1:Escapee = null;
            var _loc_2:RayIntersectionData = null;
            var _loc_3:RayIntersectionData = null;
			var _loc_4:RayIntersectionData = null;
			var _loc_5:RayIntersectionData = null;
			var _loc_6:RayIntersectionData = null;
			var _loc_7:RayIntersectionData = null;
			var _loc_8:RayIntersectionData = null;
			var _loc_9:RayIntersectionData = null;
			var _loc_10:RayIntersectionData = null;
			var _loc_11:RayIntersectionData = null;
			var _loc_12:RayIntersectionData = null;
			var _loc_13:RayIntersectionData = null;
			var _loc_14:RayIntersectionData = null;
			var _loc_15:RayIntersectionData = null;
			var _loc_16:RayIntersectionData = null;
			var _loc_17:RayIntersectionData = null;	
			var _loc_18:RayIntersectionData = null;			
			var _loc_19:RayIntersectionData = null;
			
            for each (_loc_1 in this._escapeeManager.escapees)
            {
                
                _loc_3 = this._terrain.intersectRay(new Vector3D(_loc_1.x, _loc_1.y, 800), new Vector3D(0, 0, -1), null, null);
                if (_loc_3)
                {
                    _loc_1.z = _loc_3.point.z + _loc_1.height;
                }
            }
            _loc_2 = this._terrain.intersectRay(new Vector3D(this._exitPoint.x, this._exitPoint.y, 800), new Vector3D(0, 0, -1), null, null);
            if (_loc_2)
            {
                this._exitPoint.z = _loc_2.point.z;
            }
			_loc_4 = this._terrain.intersectRay(new Vector3D(this._skill1.x, this._skill1.y, 800), new Vector3D(0, 0, -1), null, null);
            if (_loc_4)
            {
                this._skill1.z = _loc_4.point.z;
            }
			_loc_5 = this._terrain.intersectRay(new Vector3D(this._skill2.x, this._skill2.y, 800), new Vector3D(0, 0, -1), null, null);
            if (_loc_5)
            {
                this._skill2.z = _loc_5.point.z;
            }
			_loc_6 = this._terrain.intersectRay(new Vector3D(this._skill3.x, this._skill3.y, 800), new Vector3D(0, 0, -1), null, null);
            if (_loc_6)
            {
                this._skill3.z = _loc_6.point.z;
            }
			if (modelsLoaded)
			{				
				_loc_18 = this._terrain.intersectRay(new Vector3D(this.myZiggurat.x, this.myZiggurat.y, 800), new Vector3D(0, 0, -1), null, null);
				if (_loc_18)
				{
					myZiggurat.z = _loc_18.point.z - 1;
				}
			}				
			return;
        }// end function
		
		private var _level: Bitmap;
		
		private function onEnterFrameHandler( e: Event ): void
		{	
			var escapeePosition: Vector3D = new Vector3D();
			var escapeePosition2: Vector3D = new Vector3D();
			var exitPosition: Vector3D = new Vector3D( _exitPoint.x, _exitPoint.y, _exitPoint.z );	
			
			var skill1Position: Vector3D = new Vector3D( _skill1.x, _skill1.y, _skill1.z );
			var skill2Position: Vector3D = new Vector3D( _skill2.x, _skill2.y, _skill2.z );
			var skill3Position: Vector3D = new Vector3D( _skill3.x, _skill3.y, _skill3.z );
			
			if (LevelManager.currentLevel == 5)
			{
				if (modelsLoaded)
				{
					var tsunamiPositionXplus:Number = myWave.x + 450;
					var tsunamiPositionXminus:Number = myWave.x - 450;
					var tsunamiPositionYminus:Number = myWave.y + 20;
					var tsunamiPositionYplus:Number = myWave.y + (-90);
					var tsunamiPositionZ:Number = myWave.z;
				}
			}
			
			_hud.setDetailText2("Water Level: " + ((_water.z / 50.2) * 100).toFixed(1) + "%");
			setObjectsOnGround();
			
			if (initLoad)
			{
				if (!warningAlreadyShown)
				{
					if (checkFPS < 4)
					{
						_showWarning.visible = true;
						warningAlreadyShown = true;
					}
				}
			}
			
			if (_terrain.myTerrainPoints <= 0)
			{
				_terrainBar.filters = [ new GlowFilter( 0xFFCC33, 1, 10, 10, 3 ) ];
			}
			else if (_terrain.myTerrainPoints >= 1)
			{
				_terrainBar.filters = [ new GlowFilter( 0x00A300, 1, 10, 10, 3 ) ];
			}
			else 
			{
				_terrainBar.filters = [ new GlowFilter( 0xFFCC33, 0, 10, 10, 3 ) ];
			}
			
			//_hud.setDetailText("(" + mousePlane.x.toFixed(1) + ", " + mousePlane.y.toFixed(1) + ", " + mousePlane.z.toFixed(1) + ")");
			
			// Underwater Camera Image
			if (_camera.z < _water.z)
			{
				myWaterScreen.visible = true;
			}
			else if (_camera.z >= _water.z)
			{
				myWaterScreen.visible = false;
			}
			
			if (_camera.z >= 200)
			{
				_camera.z -= 3;
			}
			
			if (_camera.x <= -230)
			{
				_camera.x += 3;
			}
			else if (_camera.x >= 230)
			{
				_camera.x -= 3;
			}
			
			if (_camera.y <= -230)
			{
				_camera.y += 3;
			}
			else if (_camera.y >= 230)
			{
				_camera.y -= 3;
			}
			
			for each( var escapee:Escapee in _escapeeManager.escapees )
			{	
				var rayIntersectionData: RayIntersectionData = _terrain.intersectRay( new Vector3D( escapee.x, escapee.y, 800 ), new Vector3D( 0, 0, -1), null, null );
				if ( rayIntersectionData )
				{
					escapee.z = rayIntersectionData.point.z + escapee.height;
				}
				
				escapeePosition.x = escapee.x;
				escapeePosition.y = escapee.y;
				escapeePosition.z = escapee.z;
				
				if (escapee.escapeeName == 'Fraser')
				{
					if (dead1.visible == false)
					{
						myMinimapOne.x = escapee.x + 415;
						myMinimapOne.y = escapee.y + 235;
					}
					else 
					{
						myMinimapOne.visible = false;
					}
				}
				else if (escapee.escapeeName == 'Chris')
				{
					if (dead2.visible == false)
					{
						myMinimapTwo.x = escapee.x + 415;
						myMinimapTwo.y = escapee.y + 235;
					}
					else 
					{
						myMinimapTwo.visible = false;
					}
				}
				else if (escapee.escapeeName == 'Ty')
				{
					if (dead3.visible == false)
					{
						myMinimapThree.x = escapee.x + 415;
						myMinimapThree.y = escapee.y + 235;
					}
					else 
					{
						myMinimapThree.visible = false;
					}
				}
				else if (escapee.escapeeName == 'Tyler')
				{
					if (dead4.visible == false)
					{
						myMinimapFour.x = escapee.x + 415;
						myMinimapFour.y = escapee.y + 235;
					}
					else 
					{
						myMinimapFour.visible = false;
					}
				}
				else if (escapee.escapeeName == 'Mike')
				{
					if (dead5.visible == false)
					{
						myMinimapFive.x = escapee.x + 415;
						myMinimapFive.y = escapee.y + 235;
					}
					else 
					{
						myMinimapFive.visible = false;
					}
				}
				
				if ( Vector3D.distance( skill1Position, escapeePosition ) < 2 )
				{
					firstSkill();
				}
				
				if ( Vector3D.distance( skill2Position, escapeePosition ) < 2 )
				{
					secondSkill();
				}
				
				if ( Vector3D.distance( skill3Position, escapeePosition ) < 2 )
				{
					thirdSkill();
				}
				
				// check to see if we got hit by a tsunami
				if (modelsLoaded)
				{
					if (escapee.x >= tsunamiPositionXminus && escapeePosition.x <= tsunamiPositionXplus)
					{
						if (escapee.y <= tsunamiPositionYminus && escapeePosition.y >= tsunamiPositionYplus)
						{
							if (escapee.z < 78.5)
							{
								myDeadSound.play();
								_escapeeManager.removeEscapee( escapee );
								escapee.visible = false;
								Tweener.removeTweens(escapee);
								
								if (_in)
								{
									if (escapee.escapeeName == 'Fraser')
									{
										dead1.visible = true;
										indicator1 = true;
									}
									else if (escapee.escapeeName == 'Chris')
									{
										dead2.visible = true;
										indicator2 = true;
									}
									else if (escapee.escapeeName == 'Ty')
									{
										dead3.visible = true;
										indicator3 = true;
									}
									else if (escapee.escapeeName == 'Tyler')
									{
										dead4.visible = true;
										indicator4 = true;
									}
									else if (escapee.escapeeName == 'Mike')
									{
										dead5.visible = true;
										indicator5 = true;
									}
								}
								else 
								{
									if (escapee.escapeeName == 'Fraser')
									{
										indicator1 = true;
									}
									else if (escapee.escapeeName == 'Chris')
									{
										indicator2 = true;
									}
									else if (escapee.escapeeName == 'Ty')
									{
										indicator3 = true;
									}
									else if (escapee.escapeeName == 'Tyler')
									{
										indicator4 = true;
									}
									else if (escapee.escapeeName == 'Mike')
									{
										indicator5 = true;
									}
								}							
						
								_hud.setDetailText(escapee.escapeeName + " just got hit by the tsunami and died.");
								myChatSound.play();
					
								if ( _escapeeManager.escapees.length == 0 )
								{
									if (_escapedPeoples >= 3)
									{	
										dimmer.visible = true;
										_nextLevelScreenButton.visible = true;
										_totalEscaped.visible = true;
										_totalEscaped.text = "" + (totalEscaped / 2);
										totalTimer.stop();
										removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
										_gameManager.setState( GameStateEnum.GAME_OVER );
									}
									else
									{
										dimmer.visible = true;
										_restartGame.x = 5;
										_restartGame.y = 100;
										_restartGame.visible = true;
										totalTimer.stop();
										_hud.setDetailText("Most of your tribe members died\nGAME OVER");
										removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
										_gameManager.setState( GameStateEnum.GAME_OVER );
									}
								}
							}
						}
					}
				}
				
				// check if we are under water
				if ( escapee.z < _water.z ) 
				{				
					if (!didSwim && !swimWater)
					{
						if (easy)
						{
							escapee._currentHealth = escapee._currentHealth - 0.006;
							escapee.updateHealth();
						}
						else if (medium)
						{
							escapee._currentHealth = escapee._currentHealth - 0.008;
							escapee.updateHealth();
						}
						else if (hard)
						{
							escapee._currentHealth = escapee._currentHealth - 0.01;
							escapee.updateHealth();
						}
						
						// CHANGE SPEED
						if (escapee.escapeeName == 'Fraser')
						{
							escapee.speed = 2.5;
						}
						else if (escapee.escapeeName == 'Chris')
						{
							escapee.speed = 2.5;
						}
						else if (escapee.escapeeName == 'Ty')
						{
							escapee.speed = 2.5;
						}
						else if (escapee.escapeeName == 'Tyler')
						{
							escapee.speed = 2.5;
						}
						else if (escapee.escapeeName == 'Mike')
						{
							escapee.speed = 2.5;
						}
						
						if (escapee._currentHealth <= 0)
						{						
							myDeadSound.play();
							_escapeeManager.removeEscapee( escapee );
							escapee.visible = false;
							Tweener.removeTweens(escapee);
							
							if (_in)
							{
								if (escapee.escapeeName == 'Fraser')
								{
									dead1.visible = true;
									indicator1 = true;
								}
								else if (escapee.escapeeName == 'Chris')
								{
									dead2.visible = true;
									indicator2 = true;
								}
								else if (escapee.escapeeName == 'Ty')
								{
									dead3.visible = true;
									indicator3 = true;
								}
								else if (escapee.escapeeName == 'Tyler')
								{
									dead4.visible = true;
									indicator4 = true;
								}
								else if (escapee.escapeeName == 'Mike')
								{
									dead5.visible = true;
									indicator5 = true;
								}
							}
							else 
							{
								if (escapee.escapeeName == 'Fraser')
								{
									indicator1 = true;
								}
								else if (escapee.escapeeName == 'Chris')
								{
									indicator2 = true;
								}
								else if (escapee.escapeeName == 'Ty')
								{
									indicator3 = true;
								}
								else if (escapee.escapeeName == 'Tyler')
								{
									indicator4 = true;
								}
								else if (escapee.escapeeName == 'Mike')
								{
									indicator5 = true;
								}
							}							
					
							_hud.setDetailText(escapee.escapeeName + " just drowned. Nice one.");
							myChatSound.play();
				
							if ( _escapeeManager.escapees.length == 0 )
							{
								if (_escapedPeoples >= 3)
								{	
									dimmer.visible = true;
									_nextLevelScreenButton.visible = true;
									_totalEscaped.visible = true;
									_totalEscaped.text = "" + (totalEscaped / 2);
									totalTimer.stop();
									removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
									_gameManager.setState( GameStateEnum.GAME_OVER );
								}
								else
								{
									dimmer.visible = true;
									_restartGame.x = 5;
									_restartGame.y = 100;
									_restartGame.visible = true;
									totalTimer.stop();
									_hud.setDetailText("Most of your tribe members died\nGAME OVER");
									removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
									_gameManager.setState( GameStateEnum.GAME_OVER );
								}
							}
						}
					}
					// CHANGE SPEED
					if (escapee.escapeeName == 'Fraser')
					{
						escapee.speed = 2.5;
					}
					else if (escapee.escapeeName == 'Chris')
					{
						escapee.speed = 2.5;
					}
					else if (escapee.escapeeName == 'Ty')
					{
						escapee.speed = 2.5;
					}
					else if (escapee.escapeeName == 'Tyler')
					{
						escapee.speed = 2.5;
					}
					else if (escapee.escapeeName == 'Mike')
					{
						escapee.speed = 2.5;
					}
				}
				else
				{					
					// CHANGE SPEED
					if (escapee.escapeeName == 'Fraser')
					{
						escapee.speed = 4.72;
					}
					else if (escapee.escapeeName == 'Chris')
					{
						escapee.speed = 4.38;
					}
					else if (escapee.escapeeName == 'Ty')
					{
						escapee.speed = 4;
					}
					else if (escapee.escapeeName == 'Tyler')
					{
						escapee.speed = 3;
					}
					else if (escapee.escapeeName == 'Mike')
					{
						escapee.speed = 5;
					}	
				
					if (escapee._currentHealth < 1)
					{
						if (easy)
						{
							escapee._currentHealth = escapee._currentHealth + 0.001;
							escapee.updateHealth();
						}
						else if (medium)
						{
							escapee._currentHealth = escapee._currentHealth + 0.0008;
							escapee.updateHealth();
						}
						else if (hard)
						{
							escapee._currentHealth = escapee._currentHealth + 0.00008;
							escapee.updateHealth();
						}
					}				
					
					escapeePosition.x = escapee.x;
					escapeePosition.y = escapee.y;
					escapeePosition.z = escapee.z;
					
					if ( Vector3D.distance( escapeePosition, exitPosition ) < 12 )
					{
						myEscapedSound.play();
						_escapeeManager.removeEscapee( escapee );
						escapee.visible = false;
						
						_hud.setDetailText(escapee.escapeeName + " just escaped. Nice one!");
						myEscapedSound.play();
						_escapedPeoples++;
						totalEscaped++;
						
						if (_in)
							{
								if (escapee.escapeeName == 'Fraser')
								{
									alive1.visible = true;
									indicator6 = true;
								}
								else if (escapee.escapeeName == 'Chris')
								{
									alive2.visible = true;
									indicator7 = true;
								}
								else if (escapee.escapeeName == 'Ty')
								{
									alive3.visible = true;
									indicator8 = true;
								}
								else if (escapee.escapeeName == 'Tyler')
								{
									alive4.visible = true;
									indicator9 = true;
								}
								else if (escapee.escapeeName == 'Mike')
								{
									alive5.visible = true;
									indicator10 = true;
								}
							}
							else 
							{
								if (escapee.escapeeName == 'Fraser')
								{
									indicator6 = true;
								}
								else if (escapee.escapeeName == 'Chris')
								{
									indicator7 = true;
								}
								else if (escapee.escapeeName == 'Ty')
								{
									indicator8 = true;
								}
								else if (escapee.escapeeName == 'Tyler')
								{
									indicator9 = true;
								}
								else if (escapee.escapeeName == 'Mike')
								{
									indicator10 = true;
								}
							}
						
						if ( _escapeeManager.escapees.length == 0 )
						{
							if (_escapedPeoples >= 6)
							{	
								dimmer.visible = true;
								_nextLevelScreenButton.visible = true;
								_totalEscaped.visible = true;
								_totalEscaped.text = "" + (totalEscaped / 2);
								totalTimer.stop();
								removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
								_gameManager.setState( GameStateEnum.GAME_OVER );
							}
							else
							{
								dimmer.visible = true;
								_restartGame.x = 5;
								_restartGame.y = 100;
								_restartGame.visible = true;
								totalTimer.stop();
								_hud.setDetailText("Most of your tribe members died\nGAME OVER");
								removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler );
								_gameManager.setState( GameStateEnum.GAME_OVER );
							}							
						}
					}					
				}				
				escapee.update();
			}
			
			if (easy)
			{
				if (freezeWater == false && didFreeze == false)
				{
					if (raining)
					{
						_water.z += 0.007;
						if (highGraphics)
						{
							_water2.z += 0.007;
						}
					}
					else
					{
						_water.z += 0.003;
						if (highGraphics)
						{
							_water2.z += 0.003;
						}
					}
				}
			}
			else if (medium)
			{
				if (freezeWater == false && didFreeze == false)
				{
					if (raining)
					{
						_water.z += 0.011;
						if (highGraphics)
						{
							_water2.z += 0.011;
						}
					}
					else
					{
						_water.z += 0.006;
						if (highGraphics)
						{
							_water2.z += 0.006;
						}
					}
				}
			}
			else if (hard)
			{
				if (freezeWater == false && didFreeze == false)
				{
					if (raining)
					{
						_water.z += 0.07;
						if (highGraphics)
						{
							_water2.z += 0.07;
						}
					}
					else
					{
						_water.z += 0.01;
						if (highGraphics)
						{
							_water2.z += 0.01;
						}
					}
				}
			}
			
			_exitPoint.rotationZ += 0.02;
			_skill1.rotationZ += 0.02;
			_skill2.rotationZ += 0.02;
			_skill3.rotationZ += 0.02;
			mousePlane.rotationZ += 0.09;
			
			_controller.update();
			_camera.render();
			_minimapCamera.render();
		}
		
		private function onResizeHandler( e: Event = null ): void
		{
			_camera.view.width = stage.stageWidth;
			_camera.view.height = stage.stageHeight;
		}
	}
}