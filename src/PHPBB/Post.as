package PHPBB {
	/**
	 * @author iggyvolz
	 */
	public class Post {
		public var parent:Topic;
		public var number:uint;
		public function Post(topic:Topic,num:uint):void
		{
			parent=topic;
			number=num;
		}
	}
}
