package PHPBB {
	/**
	 * @author iggyvolz
	 */
	public class Topic {
		public var parent:Forum;
		public var number:uint;
		public function Topic(forum:Forum,num:uint):void
		{
			parent=forum;
			number=num;
		}
		public function post(pnum:uint):Post
		{
			return new Post(this,pnum);
		}
	}
}
