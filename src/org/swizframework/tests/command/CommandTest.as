package org.swizframework.tests.command {
	import flash.events.Event;
	
	import org.flexunit.Assert;
	import org.swizframework.command.CommandChain;
	import org.swizframework.command.ICommand;
	
	public class CommandTest {
		
		[Test]
		public function testSeriesCommandCompleteHandler() : void {
			var cc:CommandChain = new CommandChain( CommandChain.SERIES );
			cc.addEventListener( CommandChain.COMPLETE, completeHandler );
			
			var tc1:ICommand = new TestCommand();
			var tc2:ICommand = new TestCommand();
			cc.addCommand( tc1 );
			cc.addCommand( tc2 );
			
			cc.proceed();
			
			Assert.assertTrue( tc1.executed );
		}
		
		private function completeHandler(e:Event) : void {
			trace( "completeHandler" );
			Assert.assertTrue(e.currentTarget is CommandChain);
		}
	}
}
import org.swizframework.command.CommandChain;
import org.swizframework.command.ICommand;

class TestCommand implements ICommand {
	
	private var _executed:Boolean = false;
	private var _complete:Boolean = false;
	private var chain:CommandChain;
	
	public function get complete() : Boolean {
		return _complete;
	}
	
	public function get executed() : Boolean {
		return _executed;
	}
	
	public function setCommandChain( chain : CommandChain ) : void {
		this.chain = chain;
	}
	
	public function execute() : void {
		trace( "execute" );
		_executed = true;
		_complete = true;
		chain.proceed();
	}
}