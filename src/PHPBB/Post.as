package PHPBB {
	import flash.events.TimerEvent;
	import mx.utils.StringUtil;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	/**
	 * @author iggyvolz
	 */
	public class Post extends EventDispatcher {
		public var parent:Topic;
		public var number:uint;
		private var ready:Boolean=false;
		private var _author:String; // cache response
		private var _text:String; // cache response
		private var _url:String; // cache response
		private var _contents:String; // cache response
		public function Post(topic:Topic,num:uint):void
		{
			parent=topic;
			number=num;
			contents; // Load contents
		}
		
		private function loadContentsA():void {
			var timer:Timer=new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,loadContentsB);
			timer.start();
		}
		
		private function loadContentsB(event:Event):void
		{
			var loader:URLLoader=new URLLoader();
			loader.addEventListener(Event.COMPLETE,loadContentsC);
			loader.load(new URLRequest(url));
		}

		private function loadContentsC(event : Event) : void {
			var html:String=event.target.data as String;
			html=html.split("<div class=\"postbody\">")[1];
			html=html.split("<dl class=\"postprofile\"")[0];
			html=StringUtil.trim(html);
			_contents=html;
			ready=true;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function get contents():String
		{
			if(_contents!=null)
			{
				return _contents;
			}
			loadContentsA();
			return null;
		}
		public function get url():String
		{
			if(_url!=null)
			{
				return _url;
			}
			_url=parent.parent.parent.url+"/viewtopic.php?f="+parent.parent.number.toString()+"&t="+parent.number.toString()+"&start="+number.toString();
			return _url;
		}
		public function get author():String
		{
			if(!ready)
			{
				return null;
			}
			if(_author!=null)
			{
				return _author;
			}
			_author=contents.split("<p class=\"author\">")[1];
			_author=_author.split("<strong>")[1];
			_author=_author.split("<a href")[1];
			_author=_author.split(">")[1];
			_author=_author.split("</a")[0];
			return _author;
		}
		public function get text():String
		{
			if(!ready)
			{
				return null;
			}
			if(_text!=null)
			{
				return _text;
			}
			_text=contents.split("<div class=\"content\">")[1];
			_text=_text.split("<div id=\"sig")[0];
			_text=StringUtil.trim(_text);
			var noQuotes:String="";
			var tmpText:String="";
			var quoteLevel:uint=0;
			var i:uint;
			while(_text.indexOf("<blockquote>")!=-1 || _text.indexOf("</blockquote>")!=-1)
			{
				
				if(_text.indexOf("<blockquote>")!=-1 && _text.indexOf("<blockquote>")<_text.indexOf("</blockquote>"))
				{
					
					if(_text.indexOf("<blockquote>")!=0&&quoteLevel==0)
					{
						
						noQuotes+=_text.split("<blockquote>")[0];
					}
					else
					{
						
					}
					quoteLevel++;
					tmpText="";
					
					for(i=1;i<_text.split("<blockquote>").length;i++)
					{
						if(i!=1)
						{
							tmpText+="<blockquote>";
						}
						
						tmpText+=_text.split("<blockquote>")[i];
						
					}
					_text=tmpText;
				}
				else
				{
					
					quoteLevel--;
					tmpText="";
					for(i=1;i<_text.split("</blockquote>").length;i++)
					{
						if(i!=1)
						{
							tmpText+="</blockquote>";
						}
						tmpText+=_text.split("</blockquote>")[i];
						
					}
					_text=tmpText;
				}
			}
			while(_text.slice(0,6)=="<br />")
			{
				
				_text=_text.slice(6,text.length);
			}
			return _text;
		}
	}
}
