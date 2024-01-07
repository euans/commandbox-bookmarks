/**
* Delete a bookmark
*/
component extends=_shared aliases='bookmark -' {

	/**
	* @name Name of bookmark to delete
	* @path Path of bookmark(s) to delete
	* @name.optionsUDF nameAutoComplete
	*/
	function run ( string name, string path=getCWD() ) {
		var bookmarks = getBookmarks();
 		
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

 		setBookmarks( bookmarks );;

 		print.greenLine('Bookmark Removed.')
	}

	function nameAutoComplete() {
		return getBookmarks().keyArray();
	}

}