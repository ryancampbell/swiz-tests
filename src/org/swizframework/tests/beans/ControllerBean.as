package org.swizframework.tests.beans {
	import org.swizframework.factory.IInitializingBean;
	
	public class ControllerBean implements IInitializingBean {
		
		[Autowire]
		public var model:ModelBean;
		
		public var initialized:Boolean = false;
		
		public function ControllerBean() {
		}
		
		public function initialize() : void {
			initialized = true;
		}
	}
}