package org.swizframework.tests.autowire.assets
{
	public class ObjectWithReadWriteAutowireMember
	{
		[Autowire]
		public function get autowireMe():String
		{
			return "autowireMe";
		}
		
		public function set autowireMe( value:String ):void
		{
			// store it
		}
		
		public function ObjectWithReadWriteAutowireMember()
		{
		}
	}
}