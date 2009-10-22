package org.swizframework.tests.autowire.assets
{
	public class ObjectWithWriteOnlyAutowireMember
	{
		[Autowire]
		public function set autowireMe( value:String ):void
		{
			// store it
		}
		
		public function ObjectWithWriteOnlyAutowireMember()
		{
		}
	}
}