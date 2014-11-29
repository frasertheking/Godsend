package io.plugin.godsend.terrain 
{
	import alternativa.engine3d.core.Face;
	import alternativa.engine3d.core.RayIntersectionData;
	import alternativa.engine3d.core.Sorting;
	import alternativa.engine3d.core.Vertex;
	import alternativa.engine3d.materials.Material;
	import alternativa.engine3d.objects.Mesh;
	import flash.display.BitmapData;
	import flash.geom.Vector3D;

	public class Terrain extends Mesh
	{
		
		public var segmentsW:int;
		public var segmentsH:int; 
		public var material:Material;
		
		public function get minW():Number{ return _minW;}
		private var _minW:Number;
		
		
		public function get minH():Number{ return _minH; }
		private var _minH:Number;
		
		
		public function get maxW():Number{ return _maxW; }
		private var _maxW:Number;
		
		
		public function get maxH():Number{ return _maxH; }
		private var _maxH:Number;
		
		
		public function get dw():Number{ return _dw; }
		private var _dw:Number;
		
		
		public function get dh():Number{ return _dh; }
		private var _dh:Number;
		
		
		public function get sw():int{ return this.segmentsW; }
		public function get sh():int{ return this.segmentsH; }
		
		
		public function get heights():Array{ return _heights; }
		private var _heights:Array;
		
		public static var DEFAULT_SIZE:Number = 500;
		public static var DEFAULT_SCALE:int = 1;
		public static var DEFAULT_SEGMENTS:int = 1;

		public var myTerrainPoints:Number = 0.5;
		
		public function Terrain( terrainHeightMap:BitmapData, material:Material = null, width:Number = 0, depth:Number = 0, maxHeight:Number = 0, segmentsW:int = 0, segmentsH:int = 0 )
		{
			super();
			
			this.segmentsW = segmentsW || DEFAULT_SEGMENTS;
			this.segmentsH = segmentsH || this.segmentsW;
			this.material = material;
			
			var scale:Number = DEFAULT_SCALE;
			
			if( !depth )
			{
				if( width ){ scale = width; }
				
				width = DEFAULT_SIZE * scale;
				depth = DEFAULT_SIZE * scale;
			}
			_buildTerrain( width, depth, maxHeight, terrainHeightMap );
			
			sorting = Sorting.AVERAGE_Z;
			weldVertices( 1e-10 );
			calculateBounds();
		}
		
		private function _buildTerrain( width:Number, depth:Number, maxHeight:Number, map:BitmapData ):void
		{
			var gridX:int = this.segmentsW;
			var gridY:int = this.segmentsH;
			var gridX1:int = gridX + 1;
			var gridY1:int = gridY + 1;
			
			var vertVect:Vector.<Vertex> = new Vector.<Vertex>();
			var faceVect:Vector.<Face> = new Vector.<Face>();
			
			var textureX:Number = width / 2;
			var textureY:Number = depth / 2;
			
			var id:int = 0;
			
			_minW = -textureX;
			_minH = -textureY;
			_maxW = textureX;
			_maxH = textureY;
			_dw = width / gridX;
			_dh = depth / gridY;
			
			_heights = [];
			//Vertex
			for ( var ix:int = 0; ix < gridX1; ix++ )
			{
				_heights[ix] = [];
				for( var iy:int = 0; iy < gridY1; iy++ )
				{
					var x:Number = ix * _dw - textureX;
					var y:Number = iy * _dh - textureY;
					var u:Number = ( x + textureX ) / width;
					var v:Number = ( y + textureY ) / depth;
					
					_heights[ix][iy] = ( map.getPixel(( ix / gridX1 ) * map.width, ( iy / gridY1 ) * map.height ) & 0xFF );
					_heights[ix][iy] *= ( maxHeight / 255 );
					vertVect[id] = addVertex( x, y, _heights[ix][iy], u, v, "terrain" + id );
					id++;
				}
			}
			var n1:Number;
			var n2:Number;
			var n3:int;
			
			var v1:Vertex;
			var v2:Vertex;
			var v3:Vertex;
			var v4:Vertex;
			id = 0;
			for( ix = 0; ix < gridX; ix++ )
			{
				for ( iy = 0; iy < gridY; iy++ )
				{
					v1 = vertVect[ ix * gridY1 + iy ];
					v2 = vertVect[ ix * gridY1 + (iy + 1 )];
					v3 = vertVect[ ( ix + 1 ) * gridY1 + iy ];
					
					this.addTriFace( v3, v2, v1, material, "terrian" + id );
					
					v1 = vertices[ ( ix + 1 ) * gridY1 + ( iy + 1 ) ];
					v2 = vertices[ ( ix + 1 ) * gridY1 + iy ];
					v3 = vertices[ ix * gridY1 + ( iy + 1 ) ];
					
					this.addTriFace( v3, v2, v1, material, "terrian_back" + id );
					
					id++;
				}
			}			
			this.calculateFacesNormals();			
		}
		
		public function alterHeightMap( intersectData: RayIntersectionData, direction:String = "up", radius: Number = 10, maxClamp: Number = 5): void
		{
			var vertex: Vertex;
			var position: Vector3D = new Vector3D();
			for each( vertex in this.vertices )
			{
				position.x = vertex.x;
				position.y = vertex.y;
				position.z = vertex.z;
				var vertexDistance: Number = Vector3D.distance( position, intersectData.point );
				
				if ( vertexDistance < radius )
				{
					switch( direction )
					{
						case "up":
							vertex.z += Math.min( radius / vertexDistance, maxClamp );
							myTerrainPoints = myTerrainPoints - 0.014;
						break;
						case "down":
						if (vertex.z > 0)
						{
							vertex.z -= Math.min( radius / vertexDistance, maxClamp );
							myTerrainPoints = myTerrainPoints + 0.007;
						}
						break;
					}
					
				}
			}
			calculateBounds();
			calculateFacesNormals();
		}

		public function myQuake(): void
		{
			var vertex: Vertex;
			var position: Vector3D = new Vector3D();
			for each( vertex in this.vertices )
			{
				position.x = vertex.x;
				position.y = vertex.y;
				position.z = vertex.z;
				
				vertex.z += Math.floor(Math.random() * (1 - (-10)) + ( -10));
			}
			calculateBounds();
			calculateFacesNormals();
		}
		
		public function myTsunami(): void
		{
			var vertex: Vertex;
			var position: Vector3D = new Vector3D();
			for each( vertex in this.vertices )
			{
				position.x = vertex.x;
				position.y = vertex.y;
				position.z = vertex.z;
				
				vertex.z += Math.floor(Math.random() * ((-0.5) - (-0.75)) + (-0.75));
			}
			calculateBounds();
			calculateFacesNormals();
		}
		
	}

}