package io.plugin.godsend.managers 
{
	public class SelectionManager 
	{
		
		private static var _instance: SelectionManager;
		
		private var _selectionState: int;
		
		public function SelectionManager() 
		{
			_selectionState = SelectionStateEnum.MOVING_CAMERA;
		}
		
		public static function getInstance(): SelectionManager
		{
			if ( !_instance )
			{
				_instance = new SelectionManager();
			}
			return _instance;
		}
		public function get selectionState():int 
		{
			return _selectionState;
		}
		
		public function set selectionState(value:int):void 
		{
			_selectionState = value;
		}
		
	}

}