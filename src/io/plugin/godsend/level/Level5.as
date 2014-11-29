package io.plugin.godsend.level 
{
	import alternativa.engine3d.materials.FillMaterial;
	import alternativa.engine3d.materials.Material;
	import alternativa.engine3d.materials.TextureMaterial;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import io.plugin.godsend.assets.Escapee;
	import alternativa.engine3d.primitives.GeoSphere;
	import alternativa.engine3d.core.Sorting;
	
	public class Level5 extends AbstractLevel 
	{
		[Embed(source='../../../../../lib/images/heightmap/hm6.png')]
		private var HeightMap: Class;
		
		[Embed(source = '../../../../../lib/images/heightmap/tm6.png')]
		private var TextureMap: Class;
		
		[Embed(source = '../../../../../lib/images/icons/waterTexture.png')]
		private var waterTexture: Class;
		
		[Embed(source = '../../../../../lib/images/icons/waterTexture2.png')]
		private var waterTexture2: Class;
		
		[Embed(source = '../../../../../lib/images/icons/myIce.jpg')]
		private var iceTexture: Class;
		
		[Embed(source = '../../../../../lib/images/icons/mySmoke.png')]
		private var smokeTexture: Class;
		
		[Embed(source = '../../../../../lib/images/icons/waterWrapper.png')]
		private var waterWrapper: Class;
		
		[Embed(source = '../../../../../lib/images/icons/charOne.png')]
		private var charOne: Class;
		
		[Embed(source = '../../../../../lib/images/icons/charTwo.png')]
		private var charTwo: Class;	
		
		[Embed(source = '../../../../../lib/images/icons/charThree.png')]
		private var charThree: Class;	
		
		[Embed(source = '../../../../../lib/images/icons/charFour.png')]
		private var charFour: Class;	
		
		[Embed(source = '../../../../../lib/images/icons/charFive.png')]
		private var charFive: Class;			
		
		[Embed(source = '../../../../../lib/images/icons/groundCursor.png')]
		private var mousePos: Class;	
		
		private var _escapeeList: Vector.<Escapee>
		
		private var _exitPoint: GeoSphere;
		
		private var _skill1: GeoSphere;
		private var _skill2: GeoSphere;
		private var _skill3: GeoSphere;
		
		public function Level5() 
		{
			super();			
			_escapeeList = new Vector.<Escapee>();
			_escapeeList.push( new Escapee( 0.8, 1.4, new Vector3D( -145, -148, 35 ), "Fraser", "Blah...", null, 4.72, 0.4, 0.2, new TextureMaterial( myCharOne ) ));
			_escapeeList.push( new Escapee( 0.8, 1.4, new Vector3D( -142, -146, 35 ), "Chris", "Blah...", null, 4.38, 0.2, 0.72, new TextureMaterial( myCharFive ) ));
			_escapeeList.push( new Escapee( 0.8, 1.4, new Vector3D( -141, -143, 35 ), "Mike", "Blah...", null, 5.00, 0.3, 0.97, new TextureMaterial( myCharThree ) ));
			_escapeeList.push( new Escapee( 0.8, 1.4, new Vector3D( -139, -141, 35 ), "Ty", "Blah...", null, 4.00, 0.1, 0.66, new TextureMaterial( myCharFour ) ));
			_escapeeList.push( new Escapee( 0.8, 1.4, new Vector3D( -144, -144, 35 ), "Tyler", "Blah...", null, 3, 0.4, 0.51, new TextureMaterial( myCharTwo ) ));
			
			_exitPoint = new GeoSphere(13.75, 11, false, new FillMaterial(0xFFFB00, 0.3));
            _exitPoint.x = 157;
            _exitPoint.y = 160;
            _exitPoint.mouseEnabled = false;
			
			_skill1 = new GeoSphere( 2, 1, false, new TextureMaterial (mySmokeTexture));
			_skill2 = new GeoSphere( 2, 1, false, new TextureMaterial (myIceTexture));
			_skill3 = new GeoSphere( 2, 1, false, new TextureMaterial (myWaterWrapper));		
			
			_exitPoint.sorting = Sorting.DYNAMIC_BSP;
			_skill1.sorting = Sorting.DYNAMIC_BSP;
			_skill2.sorting = Sorting.DYNAMIC_BSP;
			_skill3.sorting = Sorting.DYNAMIC_BSP;	

			_skill1.mouseEnabled = false;		
			_skill2.mouseEnabled = false;	
			_skill3.mouseEnabled = false;
			
			_skill1.x = 900;
			_skill1.y = 900;
			_skill2.x = 900;
			_skill2.y = 900;
			_skill3.x = 900;
			_skill3.y = 900;			
		}
		
		override public function get heightMap():BitmapData 
		{
			var bitmap: Bitmap = new HeightMap() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get textureMap():BitmapData 
		{
			var bitmap: Bitmap = new TextureMap() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myIceTexture():BitmapData 
		{
			var bitmap: Bitmap = new iceTexture() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get mySmokeTexture():BitmapData 
		{
			var bitmap: Bitmap = new smokeTexture() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myWaterWrapper():BitmapData 
		{
			var bitmap: Bitmap = new waterWrapper() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myWaterTexture():BitmapData 
		{
			var bitmap: Bitmap = new waterTexture() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myWaterTexture2():BitmapData 
		{
			var bitmap: Bitmap = new waterTexture2() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myCharOne():BitmapData 
		{
			var bitmap: Bitmap = new charOne() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myCharTwo():BitmapData 
		{
			var bitmap: Bitmap = new charTwo() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myCharThree():BitmapData 
		{
			var bitmap: Bitmap = new charThree() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myCharFour():BitmapData 
		{
			var bitmap: Bitmap = new charFour() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myCharFive():BitmapData 
		{
			var bitmap: Bitmap = new charFive() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get myMousePos():BitmapData 
		{
			var bitmap: Bitmap = new mousePos() as Bitmap;
			return bitmap.bitmapData;
		}
		
		override public function get escapeeList():Vector.<Escapee> 
		{
			return _escapeeList;
		}
		
		override public function get exitPoint():GeoSphere
		{
			return _exitPoint;
		}
		
		override public function get skill1():GeoSphere
		{
			return _skill1;
		}
		
		override public function get skill2():GeoSphere
		{
			return _skill2;
		}
		
		override public function get skill3():GeoSphere 
		{
			return _skill3;
		}	
		
	}

}