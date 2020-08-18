/**
* Add a new bookmark
*/
component aliases='bookmark +' {

	/**
	* @name Name of bookmark to add
	* @path Path to bookmark
	*/
	function run ( string name, string path=getCWD() ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
		arguments.path = resolvePath( arguments.path );
		arguments.name = arguments.name?:listLast(arguments.path, '\/');
		bookmarks[trim(arguments.name)] = arguments.path;
		
		ConfigService.setConfigSettings( configSettings );
		
		print.greenLine('Bookmark Saved.')
 	}
}