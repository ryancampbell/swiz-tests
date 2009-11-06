package org.swizframework.ioc.beanFactoryTestResources
{
	import flash.display.Shape;
	
	public final class SampleBeanProvider
	{
		public var publicVarBean:Shape = new Shape();
		
		public function get readOnlyBean():String
		{
			return "readOnlyBean";
		}
		
		public function get getterSetterBean():String
		{
			return "getterSetterBean";
		}
		
		public function set getterSetterBean( value:String ):void
		{
			// store value
		}
		
		public function SampleBeanProvider()
		{
		}
	}
}