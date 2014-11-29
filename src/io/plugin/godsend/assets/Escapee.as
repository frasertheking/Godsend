package io.plugin.godsend.assets 
{
	import alternativa.engine3d.core.Sorting;
	import alternativa.engine3d.materials.Material;
	import alternativa.engine3d.objects.Sprite3D;
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import flash.display.BitmapData;
	import alternativa.engine3d.materials.TextureMaterial;
	
	public class Escapee extends Sprite3D 
	{
		
		private var _escapeeName: String;
		private var _description: String;
		private var _icon: Sprite;
		private var _speed: Number;
		private var _magicalPower: Number;
		public var _recoveryRate: Number;
		public var _currentHealth:Number;
        public var _bar:ValueBar;
		public var _bar2:ValueBar2;
		public var _bar3:ValueBar3;
		public var _bar4:ValueBar4;
		public var _bar5:ValueBar5;
        public var _bmpData:BitmapData;
		public var _bmpData2:BitmapData;
		public var _bmpData3:BitmapData;
		public var _bmpData4:BitmapData;
		public var _bmpData5:BitmapData;
		
		public function Escapee( width: Number, height: Number, position: Vector3D, name: String = null, description: String = null, icon: Sprite=null, speed: Number = 1, magicalPower: Number = 1, recoveryRate: Number = 1, material: Material = null, material2: Material = null ) 
		{
			_bmpData = new BitmapData(135, 185, true, 0);
			_bmpData2 = new BitmapData(135, 185, true, 0);
			_bmpData3 = new BitmapData(135, 185, true, 0);
			_bmpData4 = new BitmapData(135, 185, true, 0);
			_bmpData5 = new BitmapData(135, 185, true, 0);
			super( width, height, material );
			
			_escapeeName = 		name || "No name";
			_description =  	description || "No description";
			_icon = 			icon || new Sprite();
			_speed = 			speed;
			_magicalPower = 	magicalPower;
			_recoveryRate = 	recoveryRate;
			
			x = position.x;
			y = position.y;
			z = position.z;
			
			_currentHealth = 1;			
			sorting = Sorting.DYNAMIC_BSP;
			_bar = new ValueBar();
			_bar2 = new ValueBar2();
			_bar3 = new ValueBar3();
			_bar4 = new ValueBar4();
			_bar5 = new ValueBar5();
            _bar.setValue(_currentHealth);
			_bar2.setValue(_currentHealth);
			_bar3.setValue(_currentHealth);
			_bar4.setValue(_currentHealth);
			_bar5.setValue(_currentHealth);
            updateHealth();
		}
		
		public function updateHealth() : void
        {
            _bar.setValue(_currentHealth);
			_bar2.setValue(_currentHealth);
			_bar3.setValue(_currentHealth);
			_bar4.setValue(_currentHealth);
			_bar5.setValue(_currentHealth);
            _bmpData.draw(_bar);
			_bmpData2.draw(_bar2);
			_bmpData3.draw(_bar3);
			_bmpData4.draw(_bar4);
			_bmpData5.draw(_bar5);
			if (escapeeName == 'Fraser')
			{
            material = new TextureMaterial(_bmpData, false, true);
			}
			else if (escapeeName == 'Tyler')
			{
            material = new TextureMaterial(_bmpData2, false, true);
			}
			else if (escapeeName == 'Mike')
			{
            material = new TextureMaterial(_bmpData3, false, true);
			}
			else if (escapeeName == 'Ty')
			{
            material = new TextureMaterial(_bmpData4, false, true);
			}
			else if (escapeeName == 'Chris')
			{
            material = new TextureMaterial(_bmpData5, false, true);
			}
        }
		
		public function update(): void
		{
			if ( _currentHealth < 1 )
			{
				_currentHealth += recoveryRate / 10000;
			}
		}
		
		public function get escapeeName():String 
		{
			return _escapeeName;
		}
		
		public function set escapeeName(value:String):void 
		{
			_escapeeName = value;
		}
		
		public function get description():String 
		{
			return _description;
		}
		
		public function set description(value:String):void 
		{
			_description = value;
		}
		
		public function get icon():Sprite 
		{
			return _icon;
		}
		
		public function set icon(value:Sprite):void 
		{
			_icon = value;
		}
		
		public function get speed():Number 
		{
			return _speed;
		}
		
		public function set speed(value:Number):void 
		{
			_speed = value;
		}
		
		public function get magicalPower():Number 
		{
			return _magicalPower;
		}
		
		public function set magicalPower(value:Number):void 
		{
			_magicalPower = value;
		}
		
		public function get recoveryRate():Number 
		{
			return _recoveryRate;
		}
		
		public function set recoveryRate(value:Number):void 
		{
			_recoveryRate = value;
		}
		
		 public function get currentHealth() : Number
        {
            return _currentHealth;
        }

        public function set currentHealth(param1:Number) : void
        {
            _currentHealth = param1;
        }

		
	}

}