/**
* Delete a bookmark
*/
component aliases='bookmark -' {

	/**
	* @name Name of bookmark to delete
	* @path Path of bookmark(s) to delete
	* @name.optionsUDF nameAutoComplete
	*/
	function run ( string name, string path=getCWD() ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
		arguments.path = resolvePath( arguments.path );
		arguments.name = arguments.name?:listLast(arguments.path, '\/');

 		if ( !isNull(arguments.name) ) {
 			structDelete(bookmarks, trim(arguments.name));
 		} else {
 			for ( item in bookmarks ) {
 				if ( bookmarks[item] == arguments.path ) {
 					structDelete(bookmarks, item);
 				}
 			}
 		}	

 		ConfigService.setConfigSettings( configSettings );

 		print.greenLine('Bookmark Removed.')
	}

	function nameAutoComplete() {
		return ConfigService.getSetting( 'modules.commandbox-bookmarks.bookmarks', {} ).keyArray();
	}

}