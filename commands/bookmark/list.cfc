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
 			labelLen = 0;
 			for ( var k in bookmarks ) {
 				labelLen = max(labelLen,k.len());
 			}
 			valueLen = 0;
 			for ( var k in bookmarks ) {
 				valueLen = max(valueLen,bookmarks[k].len());
 			}

 			if ( bookmarks.len() ) {
 				print.yellowLine(repeatString('-', labelLen + valueLen + 7));
	 			count = 0;
	 			for ( var i in bookmarks ) {
	 				count++;
	 				print
	 					.yellowText('| ')
	 					.boldLimeText(i & repeatString(' ', labelLen-i.len()) & ' ')
	 					.yellowText(':')
	 					.text(' ' & bookmarks[i] & repeatString(' ', valueLen - bookmarks[i].len()))
	 					.yellowText(' |')
	 					.line();
	 			};
	 			
	 			print.yellowLine(repeatString('-', labelLen + valueLen + 7));
	 		} else {
	 			print.text('There are no saved bookmarks.');
	 		}

 		}		
	}

    function nameAutoComplete() {
        return ConfigService.getSetting( 'modules.commandbox-bookmarks.bookmarks', {} ).keyArray();
    }

}