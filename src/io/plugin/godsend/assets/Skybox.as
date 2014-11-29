package io.plugin.godsend.assets
{
	import alternativa.engine3d.objects.SkyBox;
	import alternativa.engine3d.materials.TextureMaterial;
 
	public class Skybox extends SkyBox
	{
		[Embed(source="../../../../../lib/images/heightmap/backax2.jpg")] static private const backred:Class;
		[Embed(source="../../../../../lib/images/heightmap/frontax2.jpg")] static private const frontred:Class;
		[Embed(source="../../../../../lib/images/heightmap/leftax2.jpg")] static private const leftred:Class;
		[Embed(source="../../../../../lib/images/heightmap/rightax2.jpg")] static private const rightred:Class;
		[Embed(source="../../../../../lib/images/heightmap/topax2.jpg")] static private const topred:Class;
		[Embed(source="../../../../../lib/images/heightmap/bottomax2.jpg")] static private const bottomred:Class;
 
		public function Skybox(size:Number):void
		{ 
			var left:TextureMaterial = new TextureMaterial(new leftred().bitmapData);
			var right:TextureMaterial = new TextureMaterial(new rightred().bitmapData);
			var back:TextureMaterial = new TextureMaterial(new backred().bitmapData);
			var front:TextureMaterial = new TextureMaterial(new frontred().bitmapData);
			var bottom:TextureMaterial = new TextureMaterial(new bottomred().bitmapData);
			var top:TextureMaterial = new TextureMaterial(new topred().bitmapData);
 
			super(size, left, right, back, front, bottom, top, 0);
		}
	}
}