/**
* Add a new bookmark
*/
component aliases='bookmark +' {

	/**
	* @name Name of bookmark to add
	* @path Path to bookmark
	* @lastcommand Grab last command, if used ignores current path
	*/
	function run ( string name, string path=getCWD(), boolean lastcommand=false  ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
		lc = configSettings.modules['commandbox-bookmarks'].lastcommand ?: '';

		if(arguments.lastcommand && lc != ''){
			arguments.name = arguments.name?:autoIncrementName(bookmarks);
			bookmarks[trim(arguments.name)] = lc;
		} else {
			var path = resolvePath( arguments.path );
			if(directoryExists(path)){
				arguments.name = arguments.name?:listLast(arguments.path, '\/');
				bookmarks[trim(arguments.name)] = path;
			} else {
				arguments.name = arguments.name?:autoIncrementName(bookmarks);
				bookmarks[trim(arguments.name)] = arguments.path;
			}
		}
		
		ConfigService.setConfigSettings( configSettings );
		
		print.greenLine('Bookmark Saved.')
 	}

	function autoIncrementName( bookmarks ){
		var maxNum = bookmarks.keyArray().reduce((acc,x) => (isNumeric(x) && x > acc) ? x : acc,0);
		return ++maxNum;
	}
}