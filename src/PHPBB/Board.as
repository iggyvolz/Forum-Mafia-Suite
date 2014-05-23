package PHPBB{
	/**
	 * @author iggyvolz
	 */
	public class Board {
		public var URL:String;
		public function Board(url:String):void
		{
			URL=url;
		}
		public function forum(fnum:uint):Forum
		{
			return new Forum(this,fnum);
		}
	}
}
