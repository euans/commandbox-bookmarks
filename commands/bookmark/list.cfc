/**
* List all bookmarks
* 
* Can also list a single bookmark by name
* 
* {code:bash}
* bookmark list myBookmark
* {code}
*
*/
component aliases='bookmarks' {

	/**
	* @name Name of bookmark to list 
	* @name.optionsUDF nameAutoComplete
	*/
	function run( string name ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		if ( !isNull(arguments.name) ) {
 			print.line(bookmarks[trim(arguments.name)]);

 		} else {
			var bookmarksToTable = bookmarks.keyArray().reduce((acc,x) => {
				acc.append([x,bookmarks[x]]);
				return acc;
			},[])
			if(bookmarksToTable.len()){
				print.table(bookmarksToTable,"",['Shortcut','Directory Path/Command']);
			} else {
				print.text('There are no saved bookmarks.');
			}
 		}		
	}

    function nameAutoComplete() {
        return ConfigService.getSetting( 'modules.commandbox-bookmarks.bookmarks', {} ).keyArray();
    }

}