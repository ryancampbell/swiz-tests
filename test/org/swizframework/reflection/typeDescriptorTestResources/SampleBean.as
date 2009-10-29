package org.swizframework.reflection.typeDescriptorTestResources
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class SampleBean extends EventDispatcher
	{
		// ========================================
		// public properties
		// ========================================
		
		[Autowire]
		[Bindable]
		public var bindableAutowireByTypeVariable:uint = 0x000000;
		
		[Autowire( bean="beanId" )]
		public var autowireByIdVariable:Number = .2;
		
		[Autowire( bean="beanId", property="beanPropertyName" )]
		public var autowireBeanPropertyVariable:Number = 5;
		
		/**
		 * Backing variable for <code>bindableAccessor</code> getter/setter.
		 */
		protected var _bindableAccessor:String;
		
		[Autowire( bean="beanId" )]
		[Bindable( "bindableAccessorChanged" )]
		/**
		 * 
		 */
		public function get bindableAccessor():String
		{
			return _bindableAccessor;
		}
		
		public function set bindableAccessor( value:String ):void
		{
			_bindableAccessor = value;
			dispatchEvent( new Event( "bindableAccessorChanged" ) );
		}
		
		[Autowire( bean="beanId" )]
		public function get getter():String
		{
			return "getter";
		}
		
		public function SampleBean()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, onAdded );
		}
		
		[Mediate( event="Event.ADDED_TO_STAGE" )]
		public function onAdded( event:Event ):void
		{
			// do stuff
		}
	}
}