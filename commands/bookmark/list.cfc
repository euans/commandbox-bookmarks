component {
	property name='ConfigService' inject='ConfigService';

	function run ( string name ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		if ( !isNull(arguments?.name) ) {
 			print.line(bookmarks[trim(arguments.name)]);

 		} else {
 			print.line(bookmarks);
 		}		
	}
}