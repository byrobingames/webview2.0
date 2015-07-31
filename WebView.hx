package;

import openfl.Lib;

#if android
import openfl.utils.JNI;
#end
	
class WebView  {

	private static var initialized :Bool = false;

	private static var APIInit:Dynamic=null;
	private static var APISetCallback:Dynamic=null;
	private static var APINavigate:Dynamic=null;
	private static var APIDestroy:Dynamic=null;
	
	#if ios
	private static var listener:WebViewListener;
	#end

	#if android
	private static var _open :String -> Bool -> Array<String> -> Array<String> -> Void = null;
	private static var _isActive :Void -> Bool = null;
	private static var _poolingTimer:haxe.Timer = null;
	#end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public static var onClose:Void->Void=null;
	public static var onURLChanging:String->Void=null;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public static function open (url: String = null, floating :Bool = false, ?urlWhitelist :Array<String>, ?urlBlacklist :Array<String>) :Void {
		init();
		if(urlWhitelist!=null) urlWhitelist.push(url);
		#if android
			_open(url, floating, urlWhitelist, urlBlacklist);
			if(onClose!=null) checkActive();
		#else
			if (listener == null) listener = new WebViewListener(urlWhitelist, urlBlacklist);
			APICall("init", [listener, floating]);
			navigate(url);
		#end
	}

	#if android
	private static function checkActive(){
		if(_poolingTimer==null){
			_poolingTimer = new haxe.Timer(250);
			_poolingTimer.run = checkActive;
		}
		if(!_isActive()){
			_poolingTimer.stop();
			_poolingTimer = null;
			if(onClose!=null) onClose();
		}
	}
	#end

	#if ios
	public static function navigate(url:String):Void {
		if (url==null) return;
		if (listener != null) APICall("navigate", [url]);
	}
	
	public static function close():Void {
		if (listener != null) APICall("destroy");
	}
	#end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	private static function init():Void {
		if(initialized == true) return;
		initialized = true;
		try{
			#if android
			_open = JNI.createStaticMethod("extensions/webview/WebViewExtension", "open", "(Ljava/lang/String;Z[Ljava/lang/String;[Ljava/lang/String;)V");
			_isActive = JNI.createStaticMethod("extensions/webview/WebViewExtension", "isActive", "()Z");
			#elseif ios
            APIInit     = Lib.load("webviewex","webviewAPIInit", 3);
			APINavigate = Lib.load("webviewex","webviewAPINavigate", 1);
			APIDestroy  = Lib.load("webviewex","webviewAPIDestroy", 0);
			#end
		}catch(e:Dynamic){
			trace("INIT Exception: "+e);
		}
	}
	
	private static function APICall(method:String, args:Array<Dynamic> = null):Void	{
		init();
		try{
			#if android
			if (method == "init") {
				try {
					APIInit(args[1] == true);
				} catch (e :Dynamic) {
					APIInit(args[1] == true);
				}
			}
            if (method == "callback") APISetCallback(args[0]);
            if (method == "navigate") APINavigate(args[0]);
            if (method == "destroy") APIDestroy();
			#elseif iphone
			if (method == "init") APIInit(args[0].onClose, args[0].onURLChanging, args[1]);
            if (method == "navigate") APINavigate(args[0]);
            if (method == "destroy") APIDestroy();
			#end
		} catch(e:Dynamic) {
			trace("APICall Exception [" + method + ", " + args + "]: "+e);
		}
	}
	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#if ios
class WebViewListener {

	public var urlWhitelist :Array<String>;
	public var urlBlacklist :Array<String>;

	public function new(urlWhitelist :Array<String>, urlBlacklist :Array<String>) {
		this.urlBlacklist=urlBlacklist;
		this.urlWhitelist=urlWhitelist;
	}
	
	public function onClose():Void {
		if(WebView.onClose!=null) WebView.onClose();
	}

	private function find(urls :Array<String>, url:String):Bool{
		for(regex in urls){
			var r = new EReg(regex,"");
			if(r.match(url)) return true;
		}
		return false;
	}
	
	public function onURLChanging(url:Dynamic):Void {	
		if(urlWhitelist!=null){	
			if(!find(urlWhitelist,url)){
				WebView.close();
				return;
			}
		}
		if(urlBlacklist!=null){
			if(find(urlBlacklist,url)){
				WebView.close();
				return;
			}
		}
		if(WebView.onURLChanging!=null) WebView.onURLChanging(url);
	}
}
#end
