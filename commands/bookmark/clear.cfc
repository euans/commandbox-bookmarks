/**
* Remove all bookmarks
*/
component {

	function run ( ) {
		var bookmarks = ConfigService.getSetting( 'modules.commandbox-bookmarks.bookmarks', {} );
 		
 		if ( confirm('Are you sure you want to remove all bookmarks?') ) {
 			structClear(bookmarks);
 			ConfigService.setSetting( name="modules.commandbox-bookmarks.bookmarks", value=serializeJson(bookmarks) );
 			print.greenLine('Bookmarks Cleared.');
 		}
 		
	}
}