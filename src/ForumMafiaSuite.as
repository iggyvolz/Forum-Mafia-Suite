package {
	import PHPBB.*;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	/**
	 * @author iggyvolz
	 */
	public class ForumMafiaSuite extends Sprite {
		public var board:Board;
		public var forum:Forum;
		public var topic:Topic;
		public var post:Post;
		public var postNum:uint=0;
		public var field:TextField=new TextField();
		public var neededPosts:Array=[];
		public function ForumMafiaSuite() {
			for(var i:uint=0;i<100;i++)
			{
				neededPosts.push(i);
			}
			board=new Board("http://www.blankmediagames.com/phpbb");
			forum=board.forum(17);
			topic=forum.topic(1515);
			addChild(field);
			field.width=550;
			field.height=400;
			field.multiline=true;
			field.wordWrap=true;
			post=topic.post(postNum);
			post.addEventListener(Event.COMPLETE,postLoaded);
		}
		private function postLoaded(event : Event) : void {
			trace("loaded post "+postNum+" with URL "+post.url);
			post.removeEventListener(Event.COMPLETE,postLoaded);
			field.htmlText+="<p>"+post.author+": "+post.text+"</p>";
			postNum=neededPosts[Math.floor(Math.random()*neededPosts.length)];
			neededPosts.splice(postNum, 1);
			post=topic.post(postNum);
			post.addEventListener(Event.COMPLETE,postLoaded);
		}
	}
}
