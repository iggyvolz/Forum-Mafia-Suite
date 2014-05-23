package {
	import PHPBB.*;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	/**
	 * @author iggyvolz
	 */
	public class ForumMafiaSuite extends Sprite {
		public var board:Board=new Board("http://www.blankmediagames.com/phpbb");
		public var post:Post;
		public var field:TextField=new TextField();
		public function ForumMafiaSuite() {
			post=board.forum(17).topic(1515).post(52);
			post.addEventListener(Event.COMPLETE,postLoaded);
			addChild(field);
			field.width=550;
			field.height=400;
			field.multiline=true;
		}

		private function postLoaded(event : Event) : void {
			field.htmlText=post.text+"<br />~"+post.author;
		}
	}
}
