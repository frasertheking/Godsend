package io.plugin.godsend.managers
{
    import io.plugin.godsend.level.*;

    public class LevelManager extends Object
    {
        public static var currentLevel:uint = 1;
        private static var _instance:LevelManager;

        public function LevelManager()
        {
            return;
        }// end function

        public function getLevel() : ILevel
        {
            var _loc_1:ILevel = null;
            switch(currentLevel)
            {
                case 1:
                {
                    _loc_1 = new Level1() as ILevel;
                    break;
                }
                case 2:
                {
                    _loc_1 = new Level2() as ILevel;
                    break;
                }
                case 3:
                {
                    _loc_1 = new Level3() as ILevel;
                    break;
                }
				case 4:
                {
                    _loc_1 = new Level4() as ILevel;
                    break;
                }
				case 5:
                {
                    _loc_1 = new Level5() as ILevel;
                    break;
                }
				case 6:
                {
                    _loc_1 = new Level6() as ILevel;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return _loc_1;
        }// end function

        public static function getInstance() : LevelManager
        {
            if (!_instance)
            {
                _instance = new LevelManager;
            }
            return _instance;
        }// end function

    }
}