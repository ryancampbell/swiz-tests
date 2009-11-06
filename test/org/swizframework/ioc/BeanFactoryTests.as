package org.swizframework.ioc
{
	import org.flexunit.Assert;
	import org.swizframework.ioc.beanFactoryTestResources.SampleBeanProvider;
	import org.swizframework.ioc.beanFactoryTestResources.SampleBeanProviderTwo;
	
	public class BeanFactoryTests
	{
		/**
		 * 
		 */
		protected var beanFactory:BeanFactory;
		
		// ========================================
		// setup and teardown
		// ========================================
		
		[Before]
		public function beforeEachTest():void
		{
			beanFactory = new BeanFactory();
		}
		
		[After]
		public function afterEachTest():void
		{
			beanFactory = null;
		}
		
		// ========================================
		// tests
		// ========================================
		
		[Test]
		public function getBeanByIdWorksCorrectly():void
		{
			beanFactory.processBeanProviders( [ SampleBeanProvider, SampleBeanProviderTwo ] );
			
			Assert.assertNotNull( beanFactory.getBeanById( "publicVarBean" ) );
			Assert.assertNotNull( beanFactory.getBeanById( "readOnlyBean" ) );
			Assert.assertNotNull( beanFactory.getBeanById( "getterSetterBean" ) );
			Assert.assertNotNull( beanFactory.getBeanById( "publicVarBeanTwo" ) );
			
			Assert.assertNull( beanFactory.getBeanById( "nonExistentBeanId" ) );
		}
		
		[Test]
		public function getBeanByTypeWorksCorrectly():void
		{
			beanFactory.processBeanProviders( [ SampleBeanProvider, SampleBeanProviderTwo ] );
			
			Assert.assertNotNull( beanFactory.getBeanByType( "flash.display::Shape" ) );
			Assert.assertNotNull( beanFactory.getBeanByType( "flash.display.Shape" ) );
			Assert.assertNotNull( beanFactory.getBeanByType( "Object" ) );
			
			Assert.assertNull( beanFactory.getBeanById( "nonExistentBeanId" ) );
		}
	}
}