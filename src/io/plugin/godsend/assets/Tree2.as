﻿package io.plugin.godsend.assets{    import alternativa.engine3d.core.Vertex;    import alternativa.engine3d.objects.Mesh;    import alternativa.engine3d.materials.FillMaterial;	import alternativa.engine3d.core.Sorting;	    public class Tree2 extends Mesh {         private var _leafColor:uint = 0x6D7541;        private var _trunkColor:uint = 0x887755;         private var leaf:FillMaterial = new FillMaterial(_leafColor, 0.95, 0, 0x6D7541);        private var trunk:FillMaterial = new FillMaterial(_trunkColor, 1, 0, 0x887755);         public function Tree2(x: Number, y: Number, z: Number) {            super();						var v1:Vertex = addVertex((x + 0.5), (y + 0.25), (z + 0), 0, 0, "v1");            var v2:Vertex = addVertex((x + -0.5), (y + 0.25), (z + 0), 0, 1, "v2");            var v3:Vertex = addVertex((x + 0), (y + -0.575), (z + 0), 1, 1, "v3");             var v4:Vertex = addVertex((x + 0.5), (y + 0.25), (z + 1.5), 0, 0, "v4");            var v5:Vertex = addVertex((x + -0.5), (y + 0.25), (z + 1.5), 0, 1, "v5");            var v6:Vertex = addVertex((x + 0), (y + -0.575), (z + 1.5), 1, 1, "v6");             var v7:Vertex = addVertex((x + 2), (y + 1), (z + 1.5), 0, 0, "v7");            var v8:Vertex = addVertex((x + -2), (y + 1), (z + 1.5), 0, 1, "v8");            var v9:Vertex = addVertex((x + 0), (y + -2.3), (z + 1.5), 1, 1, "v9");             var v10:Vertex = addVertex((x + 0), (y + 0), (z + 5), 0, 0, "v10");             addFaceByIds(["v3", "v2", "v1"], trunk);			            addQuadFace(v1, v2, v5, v4, trunk);            addQuadFace(v3, v1, v4, v6, trunk);            addQuadFace(v6, v5, v2, v3, trunk);             addQuadFace(v4, v5, v8, v7, leaf);            addQuadFace(v6, v9, v8, v5, leaf);            addQuadFace(v7, v9, v6, v4, leaf);             addFaceByIds(["v10", "v7", "v8"], leaf);            addFaceByIds(["v8", "v9", "v10"], leaf);            addFaceByIds(["v10", "v9", "v7"], leaf);						sorting = Sorting.DYNAMIC_BSP;             calculateFacesNormals(true);            calculateBounds();        }         public function set leafColor(c:uint):void {            leaf.color = _leafColor = c;        }         public function get leafColor():uint {            return _leafColor;        }         public function set trunkColor(c:uint):void {            trunk.color = _trunkColor = c;        }         public function get trunkColor():uint {            return _trunkColor;        }    }}