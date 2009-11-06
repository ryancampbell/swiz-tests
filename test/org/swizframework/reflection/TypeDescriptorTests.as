package org.swizframework.reflection
{
	import flash.display.Sprite;
	import flash.utils.describeType;
	
	import org.flexunit.Assert;
	import org.swizframework.reflection.typeDescriptorTestResources.SampleBean;
	
	public class TypeDescriptorTests
	{
		/**
		 * 
		 */
		protected var td:TypeDescriptor;
		
		// ========================================
		// setup and teardown
		// ========================================
		
		[Before]
		public function beforeEachTest():void
		{
			td = new TypeDescriptor();
		}
		
		[After]
		public function afterEachTest():void
		{
			td = null;
		}
		
		// ========================================
		// tests
		// ========================================
		
		[Test]
		public function classNameAndSuperClassNameAreCorrect():void
		{
			td.fromXML( describeType( new Sprite() ) );
			
			Assert.assertEquals( "flash.display::Sprite", td.className );
			Assert.assertEquals( "flash.display::DisplayObjectContainer", td.superClassName );
		}
		
		[Test]
		public function interfacesAreCorrect():void
		{
			td.fromXML( describeType( new Sprite() ) );
			
			Assert.assertEquals( 2, td.interfaces.length );
			Assert.assertEquals( "flash.display::IBitmapDrawable", td.interfaces[ 0 ] );
			Assert.assertEquals( "flash.events::IEventDispatcher", td.interfaces[ 1 ] );
		}
		
		[Test]
		public function metadataHostsAreCorrect():void
		{
			td.fromXML( describeType( new SampleBean() ) );
			
			Assert.assertEquals( 6, td.metadataHosts.length );
			Assert.assertEquals( 5, td.getMetadataHostsWithTag( "Autowire" ).length );
			Assert.assertEquals( 2, td.getMetadataHostsWithTag( "Bindable" ).length );
			Assert.assertEquals( 1, td.getMetadataHostsWithTag( "Mediate" ).length );
			Assert.assertEquals( 5, td.getMetadataHostProperties().length );
			Assert.assertEquals( 1, td.getMetadataHostMethods().length );
		}
		
		[Test]
		public function metadataTagsAreCorrect():void
		{
			td.fromXML( describeType( new SampleBean() ) );
			
			Assert.assertTrue( td.hasMetadataTag( "Autowire" ) );
			Assert.assertTrue( td.hasMetadataTag( "Bindable" ) );
			Assert.assertNotNull( td.getMetadataTagsForMember( "bindableAccessor" ) );
			Assert.assertEquals( 2, td.getMetadataTagsForMember( "bindableAccessor" ).length );
		}
		
		[Test]
		public function metadataArgsAreCorrect():void
		{
			td.fromXML( describeType( new SampleBean() ) );
			
			var tag:MetadataTag = MetadataTag( td.getMetadataTagsForMember( "autowireBeanPropertyVariable" )[ 0 ] );
			var arg1:MetadataArg = tag.args[ 0 ];
			var arg2:MetadataArg = tag.args[ 1 ];
			
			Assert.assertEquals( 2, tag.args.length );
			Assert.assertEquals( "bean", arg1.key );
			Assert.assertEquals( "beanId", arg1.value );
			Assert.assertEquals( "property", arg2.key );
			Assert.assertEquals( "beanPropertyName", arg2.value );
		}
	}
}