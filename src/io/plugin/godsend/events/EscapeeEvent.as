package io.plugin.godsend.events 
{
	import flash.events.Event;
	
	public class EscapeeEvent extends Event 
	{
		
		public static const ESCAPEE_DROWNED: String = "drowned"
		
		public function EscapeeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new EscapeeEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("EscapeeEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}