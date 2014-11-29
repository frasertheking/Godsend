package io.plugin.godsend.level 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Vector3D;
	import io.plugin.godsend.assets.Escapee;
	import alternativa.engine3d.primitives.GeoSphere;
	
	public interface ILevel 
	{
		function get heightMap():BitmapData;
		function get textureMap(): BitmapData;
		function get exitPoint() : GeoSphere;
		function get myWaterTexture(): BitmapData;
		function get myWaterTexture2(): BitmapData;
		function get myIceTexture(): BitmapData;
		function get mySmokeTexture(): BitmapData;
		function get myWaterWrapper(): BitmapData;
		function get myMousePos(): BitmapData;
		function get escapeeList(): Vector.<Escapee>;
		function get skill1(): GeoSphere;
		function get skill2(): GeoSphere;
		function get skill3(): GeoSphere;
	}
	
}