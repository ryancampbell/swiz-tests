package org.swizframework.tests.command {
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.swizframework.command.CommandChain;
	import org.swizframework.rpc.DynamicCommand;
	import org.swizframework.util.TestUtil;
	
	public class DynamicCommandTest {
		
		[Test(async,timeout="1000")]
		public function testDynamicCommand() : void {
			var cc:CommandChain = new CommandChain( CommandChain.SERIES );
			cc.addEventListener( CommandChain.COMPLETE, Async.asyncHandler( this, ccComplete, 1000 ) );

			var dc:DynamicCommand = new DynamicCommand( dcServiceCall, [ "foo" ], dcResultHandler, dcFaultHandler, [ "bar" ] );
			
			cc.addCommand( dc );
			cc.proceed();
		}
		
		private function ccComplete( e : Event, foo : * ) : void {
			trace( "ccComplete" );
		}
		
		private function dcServiceCall( param : String ) : AsyncToken {
			Assert.assertTrue( param == "foo" );
			return TestUtil.mockResult( { list: ["entry"] } );
		}
		
		private function dcResultHandler( re : ResultEvent, param:String ) : void {
			var result:Object = re.result;
			Assert.assertTrue( result.list[0] == "entry" );
			Assert.assertTrue( param == "bar" );
		}
		
		private function dcFaultHandler( fe : FaultEvent ) : void {
		
		}
	}
}