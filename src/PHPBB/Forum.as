package PHPBB {
	/**
	 * @author iggyvolz
	 */
	public class Forum {
		public var parent:Board;
		public var number:uint;
		public function Forum(board:Board,num:uint):void
		{
			parent=board;
			number=num;
		}
		public function topic(tnum:uint):Topic
		{
			return new Topic(this,tnum);
		}
	}
}
