package io.plugin.godsend.assets
{
	import alternativa.engine3d.core.Light3D;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	import alternativa.engine3d.alternativa3d; 
	import alternativa.engine3d.primitives.Plane;
	import alternativa.engine3d.materials.Material;
	import flash.geom.Vector3D;
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.Canvas; 
	import alternativa.engine3d.core.Vertex; 
	import alternativa.engine3d.core.Face;
	use namespace alternativa3d; 
 
	public class FluidPlane extends Plane
	{		
		private var theta:Number = 0;
		private var buffer:Array = new Array(2);
		private var renderBuffer:int = 0;
		private var k1:Number;
		private var k2:Number;
		private var k3:Number;
 
		private var range:int = 20;
		private var waterSegsX:int = range;
		private var waterSegsY:int = range;
		private var waterSegsXreal:int = waterSegsX+1;
		private var waterSegsYreal:int = waterSegsY+1;
		private var waterXcenter:int = range/2;
		private var waterYcenter:int= range/2;
		private var isPause:Boolean = false;
		
		private var _camera:Camera3D;
		private var _water1:FluidPlane;
 
		public function FluidPlane(_camera:Camera3D,width:Number = 5000, length:Number = 5000, widthSegments:uint = 1, lengthSegments:uint = 1, twoSided:Boolean = true, reverse:Boolean = true, triangulate:Boolean = false, bottom:Material = null, top:Material = null)
		{
			this._camera = _camera;
			widthSegments = waterSegsX
			lengthSegments = waterSegsY
			super(width, length, widthSegments, lengthSegments, twoSided, reverse, triangulate, bottom, top);
 
			prepareMath();
		}
 
 
		override alternativa3d function draw(_camera:Camera3D, parentCanvas:Canvas) : void
		{
			super.draw(_camera, parentCanvas);
 
			theta += 0.05;
			var verCounter:uint = 0;
			for(var x:int = 0 ; x < waterSegsXreal ; x++){
				for(var z:int = 0 ; z < waterSegsYreal ; z++){
					this.vertices[verCounter].z = buffer[renderBuffer][x][z].y * 3;
					verCounter++;
				}
			}
			evaluate();
 
			//calculate normals			
			this.calculateFacesNormals();
			this.calculateVerticesNormals();
			this.calculateBounds();
		}
 
 
		public function makeSplash(splashHeight:int):void 
		{
			populateBuffer();
			buffer[renderBuffer][waterXcenter][waterYcenter].y = splashHeight; 
		}
 
		public function prepareMath():void 
		{
			populateBuffer();
			//trace(buffer[0].length, buffer[1].length)
			var d:Number = 1;
			var t:Number = 0.1;
			var c:Number = 2.1;
			var mu:Number = 0.001;
			var f1:Number = c*c*t*t/(d*d);
			var f2:Number = 1/(mu*t+2); 
			k1 = (4 - 8*f1)*f2;
			k2 = (mu*t-2)*f2;
			k3 = 2 * f1 * f2;
		}
 
		public function populateBuffer():void 
		{
			var x:int,y:int,z:int;
			// 3-d displacement will be stored in the array(2*w*h)
			for(var i:int = 0 ; i < 2; i++)
			{
				var a:Array = new Array();
				for(var j:int = 0 ; j < waterSegsYreal; j++)
				{
					var aa:Array = new Array();
					for(var k:int = 0 ; k < waterSegsXreal; k++)
						aa.push(new Vector3D(j,0,k));
					a.push(aa);
				}
				buffer[i] = a;
			}
		}
 
		private function evaluate():void
		{
			for(var j:int = 1 ; j < waterSegsYreal-1; j++)
			{
				var crnt:Array = buffer[renderBuffer][j];
				var prev:Array = buffer[1-renderBuffer][j];
				for (var i:int = 1 ; i < waterSegsXreal-1; i++) 
				{
					//  trace(j, i);
					var currentN:Vector3D = (Vector3D)(buffer[renderBuffer][j + 1][i]);
					var currentP:Vector3D = (Vector3D)(buffer[renderBuffer][j - 1][i]);
					((Vector3D)(prev[i])).y = k1*((Vector3D)(crnt[i])).y + k2*((Vector3D)(prev[i])).y + k3*(((Vector3D)(crnt[i+1])).y + ((Vector3D)(crnt[i-1])).y + currentN.y + currentP.y);
				}
			}
			renderBuffer = 1-renderBuffer;
		}
 
	}
}