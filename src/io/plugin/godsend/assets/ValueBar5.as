package io.plugin.godsend.assets
{
    import flash.display.*;
	import io.plugin.godsend.managers.EscapeeManager;
	import alternativa.engine3d.materials.TextureMaterial;
	import flash.events.Event;
	import flash.net.URLRequest;

    public class ValueBar5 extends Sprite
    {		
		[Embed(source = '../../../../../lib/images/icons/charFive.png')]
		private var charFive: Class;
		
		private var _escapeeManager: EscapeeManager;
		private var escapee:Escapee;

        public function ValueBar5()
        {			
            this.setValue(0);
            return;
        }// end function
				
        public function setValue(param1:Number) : void
        {			
			var myBitmap: Bitmap = new charFive();
			var myBMD:BitmapData = myBitmap.bitmapData;
			
            graphics.clear();
            graphics.beginFill(16711680);
            graphics.drawRect(20, 13, 60, 10);
            graphics.endFill();
            graphics.beginFill(0x05B8FF);
            graphics.drawRect(20, 13, param1 * 60, 10);
            graphics.endFill();
            graphics.lineStyle(0, 0);
            graphics.drawRect(20, 13, 59, 9);
            graphics.lineStyle();
			
		    graphics.beginBitmapFill(myBMD);
		    graphics.drawRect(0, 0, 135, 185);
		    graphics.endFill();
            return;
        }// end function

    }
}