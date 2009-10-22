package org.swizframework.tests.autowire.assets
{
	public class AutowireTargetBean
	{
		[Autowire]
		public var injectedBeanByInterface:IAutowireSourceBean;
		
		[Autowire]
		public var injectedBeanByType:AutowireSourceBean;
		
		[Autowire( bean="autowireSourceBean" )]
		public var injectedBeanById:AutowireSourceBean;
		
		[Autowire( bean="autowireSourceBean", property="sourceBeanProperty" )]
		public var injectedBeanProperty:String;
		
		public function AutowireTargetBean()
		{
		}
	}
}