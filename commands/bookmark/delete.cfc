component {
	property name='ConfigService' inject='ConfigService';

	function run ( string name, string path ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		arguments.path = arguments.path?:getCWD();

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
}