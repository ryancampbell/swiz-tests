package org.swizframework.tests.autowire
{
	import flash.display.Sprite;
	
	import mx.utils.UIDUtil;
	
	import org.flexunit.Assert;
	import org.swizframework.di.AutowireManager;
	import org.swizframework.tests.autowire.assets.ObjectWithAutowireMember;
	import org.swizframework.tests.autowire.assets.ObjectWithReadOnlyAutowireMember;
	import org.swizframework.tests.autowire.assets.ObjectWithReadWriteAutowireMember;
	import org.swizframework.tests.autowire.assets.ObjectWithWriteOnlyAutowireMember;
	
	public class AutowireManagerTests
	{
		/**
		 * 
		 */
		private var manager:AutowireManager;
		
		public function AutowireManagerTests()
		{
			
		}
		
		[Before]
		public function beforeEachTest():void
		{
			manager = new AutowireManager();
		}
		
		[After]
		public function afterEachTest():void
		{
			manager = null;
		}
		
		[Test]
		public function objectsWithoutWritableAutowireMembersDoNotGetStored():void
		{
			var obj:Object = { key: "value" };
			manager.autowire( obj );
			Assert.assertNull( manager.getBeanByUID( UIDUtil.getUID( obj ) ) );
			
			var sprite:Sprite = new Sprite();
			manager.autowire( sprite );
			Assert.assertNull( manager.getBeanByUID( UIDUtil.getUID( sprite ) ) );
			
			var readOnly:ObjectWithReadOnlyAutowireMember = new ObjectWithReadOnlyAutowireMember();
			manager.autowire( readOnly );
			Assert.assertNull( manager.getBeanByUID( UIDUtil.getUID( readOnly ) ) );
		}
		
		[Test]
		public function objectsWithWritableAutowireMembersGetStored():void
		{
			var plainMember:ObjectWithAutowireMember = new ObjectWithAutowireMember();
			manager.autowire( plainMember );
			Assert.assertStrictlyEquals( plainMember, manager.getBeanByUID( UIDUtil.getUID( plainMember ) ) );
			
			var readWrite:ObjectWithReadWriteAutowireMember = new ObjectWithReadWriteAutowireMember();
			manager.autowire( readWrite );
			Assert.assertStrictlyEquals( readWrite, manager.getBeanByUID( UIDUtil.getUID( readWrite ) ) );
			
			var writeOnly:ObjectWithWriteOnlyAutowireMember = new ObjectWithWriteOnlyAutowireMember();
			manager.autowire( writeOnly );
			Assert.assertStrictlyEquals( writeOnly, manager.getBeanByUID( UIDUtil.getUID( writeOnly ) ) );
		}
	}
}