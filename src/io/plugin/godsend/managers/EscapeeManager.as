package io.plugin.godsend.managers 
{
	import io.plugin.godsend.assets.Escapee;

	public class EscapeeManager 
	{
		
		public static var _instance: EscapeeManager;
		
		private var _escapees: Vector.<Escapee>;
		private var _activeEscapee: Escapee;
		
		public function EscapeeManager() 
		{
			_escapees = new Vector.<Escapee>();
		}
		
		public static function getInstance(): EscapeeManager
		{
			if ( !_instance )
			{
				_instance = new EscapeeManager();
			}
			return _instance;
		}
		
		public function setActiveEscapee( escapee: Escapee ): void
		{
			_activeEscapee = escapee;
		}
		
		public function addEscapee( escapee: Escapee ): Escapee
		{
			_escapees.push( escapee );
			return escapee;
		}
		
		public function removeEscapee( escapee: Escapee ): void
		{
			for (var i: int = 0; i < _escapees.length; i++ )
			{
				if ( _escapees[ i ] == escapee )
				{
					_escapees.splice( i, 1 );
					return;
				}
			}
		}
		
		public function clearAllEscapees(): void
		{
			_escapees.length = 0;
		}
		
		public function get escapees():Vector.<Escapee> 
		{
			return _escapees;
		}
		
		public function get activeEscapee():Escapee 
		{
			return _activeEscapee;
		}
	}

}