package io.plugin.godsend.managers 
{
	public class GameManager 
	{
		
		private static var _instance: GameManager;
		
		private var _gameState: int;
		
		public function GameManager() 
		{
			_gameState = GameStateEnum.PLAYING;
		}
		
		public static function getInstance(): GameManager
		{
			if ( !_instance )
			{
				_instance = new GameManager();
			}
			return _instance;
		}
		
		
		public function setState( state: int ): void
		{
			_gameState = state;
		}
		
	}

}