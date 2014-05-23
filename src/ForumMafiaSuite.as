package {
	import PHPBB.*;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author iggyvolz
	 */
	public class ForumMafiaSuite extends Sprite {
		public var board:Board=new Board("http://www.blankmediagames.com/phpbb");
		public var post:Post;
		public function ForumMafiaSuite() {
			post=board.forum(17).topic(1515).post(52);
			post.addEventListener(Event.COMPLETE,postLoaded);
		}

		private function postLoaded(event : Event) : void {
			trace("Authored by \""+post.author+"\"");
		}
	}
}
