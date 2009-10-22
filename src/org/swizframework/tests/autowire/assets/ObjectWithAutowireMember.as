package org.swizframework.tests.autowire.assets
{
	public class ObjectWithAutowireMember
	{
		[Autowire]
		public var autowireMe:String;
		
		public function ObjectWithAutowireMember()
		{
		}
	}
}