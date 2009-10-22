package org.swizframework.tests.autowire.assets
{
	public class ObjectWithReadOnlyAutowireMember
	{
		[Autowire]
		public function get autowireMe():String
		{
			return "autowireMe";
		}
		
		public function ObjectWithReadOnlyAutowireMember()
		{
		}
	}
}