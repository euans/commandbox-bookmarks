/**
* Go to a bookmark. (Change the shells working directory)
*/
component aliases="goto" {

	/**
	* @name Name of bookmark to go to
	* @name.optionsUDF nameAutoComplete
	*/
	function run ( string name='' ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		if ( structKeyExists(bookmarks, trim(name)) ) {
			 var commandString = bookmarks[trim(name)];
			if(directoryExists(commandString)) {
				command('cd').params(commandString).run();
			} else {
				command( commandString );
			}
			 

 		} else {
 			error( 'Bookmark not found.' );
 		}		
	}

	function nameAutoComplete() {
		return ConfigService.getSetting( 'modules.commandbox-bookmarks.bookmarks', {} ).keyArray();
	}
	
}
