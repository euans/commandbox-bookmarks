component aliases="goto" {
	property name='ConfigService' inject='ConfigService';

	function run ( string name='' ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		if ( structKeyExists(bookmarks, trim(name)) ) {
 			command('cd').params(bookmarks[trim(name)]).run();

 		} else {
 			print.redBoldLine( 'Bookmark not found.' );
 		}		
	}
}