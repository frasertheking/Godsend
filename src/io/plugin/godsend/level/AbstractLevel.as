package io.plugin.godsend.level 
{
	import flash.display.BitmapData;
	import flash.geom.Vector3D;
	import io.plugin.godsend.assets.Escapee;
	import alternativa.engine3d.primitives.GeoSphere;

	public class AbstractLevel implements ILevel
	{
		
		public function AbstractLevel() 
		{
			
		}
		
		public function get heightMap(): BitmapData
		{
			throw new Error("heightMap Must be overridden" );
		}
		
		public function get textureMap(): BitmapData
		{
			throw new Error("textureMap Must be overridden" );
		}
		
		public function get myWaterTexture(): BitmapData
		{
			throw new Error("WaterTexture Must be overridden" );
		}
		
		public function get myWaterTexture2(): BitmapData
		{
			throw new Error("myWaterTexture2 Must be overridden" );
		}
		
		public function get myIceTexture(): BitmapData
		{
			throw new Error("iceTexture Must be overridden" );
		}
		
		public function get mySmokeTexture(): BitmapData
		{
			throw new Error("smokeTexture Must be overridden" );
		}
		
		public function get myWaterWrapper(): BitmapData
		{
			throw new Error("waterWrapper Must be overridden" );
		}
		
		public function get myCharOne(): BitmapData
		{
			throw new Error("myCharOne Must be overridden" );
		}
		
		public function get myCharTwo(): BitmapData
		{
			throw new Error("myCharTwo Must be overridden" );
		}
		
		public function get myCharThree(): BitmapData
		{
			throw new Error("myCharThree Must be overridden" );
		}
		
		public function get myCharFour(): BitmapData
		{
			throw new Error("myCharFour Must be overridden" );
		}
		
		public function get myCharFive(): BitmapData
		{
			throw new Error("myCharFive Must be overridden" );
		}
		
		public function get myMousePos(): BitmapData
		{
			throw new Error("myMousePos Must be overridden" );
		}
		
		public function get escapeeList(): Vector.<Escapee>
		{
			throw new Error("escapeeList Must be overridden" );
		}
		
		public function get exitPoint(): GeoSphere
		{
			throw new Error("exitPoint Must be overridden" );
		}
		
		public function get skill1(): GeoSphere
		{
			throw new Error("Skill1 point Must be overridden" );
		}
		
		public function get skill2(): GeoSphere
		{
			throw new Error("Skill2 point Must be overridden" );
		}
		
		public function get skill3(): GeoSphere
		{
			throw new Error("Skill3 point Must be overridden" );
		}
	}

}