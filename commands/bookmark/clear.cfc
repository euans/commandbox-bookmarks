/**
* Remove all bookmarks
*/
component extends=_shared {

	function run ( ) {
		var bookmarks = getBookmarks();
 		
 		if ( confirm('Are you sure you want to remove all bookmarks?') ) {
 			structClear(bookmarks);
 			setBookmarks( bookmarks );
 			print.greenLine('Bookmarks Cleared.');
 		}
 		
	}
}