package io.plugin.godsend.assets 
{
	import flash.display.*;

    public class TerrainBar extends Sprite
    {

        public function TerrainBar()
        {
            this.setValue(0);
            return;
        }// end function

        public function setValue(param1:Number) : void
        {
            graphics.clear();
            graphics.beginFill(0xcc0000);
            graphics.drawRect(0, 0, 100, 10);
            graphics.endFill();
            graphics.beginFill(0x157f00);
            graphics.drawRect(0, 0, param1 * 100, 10);
            graphics.endFill();
            graphics.lineStyle(0, 0);
            graphics.drawRect(0, 0, 99, 9);
            graphics.lineStyle();
            return;
        }// end function

    }
}