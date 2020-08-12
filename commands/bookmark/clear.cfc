component {
	property name='ConfigService' inject='ConfigService';

	function run ( ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		if ( confirm('Are you sure you want to remove all bookmarks?') ) {
 			structClear(bookmarks);
 			ConfigService.setConfigSettings( configSettings );
 			print.greenLine('Bookmarks Cleared.');
 		}
 		
	}
}