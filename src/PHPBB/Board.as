package PHPBB{
	/**
	 * @author iggyvolz
	 */
	public class Board {
		public var url:String;
		public function Board(URL:String):void
		{
			url=URL;
		}
		public function forum(fnum:uint):Forum
		{
			return new Forum(this,fnum);
		}
	}
}
