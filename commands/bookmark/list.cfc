component {
	property name='ConfigService' inject='ConfigService';

	function run ( string name ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		if ( !isNull(arguments?.name) ) {
 			print.line(bookmarks[trim(arguments.name)]);

 		} else {
 			labelLen = 0;
 			for ( k in bookmarks ) {
 				labelLen = max(labelLen,k.len());
 			}
 			valueLen = 0;
 			for ( k in bookmarks ) {
 				valueLen = max(valueLen,bookmarks[k].len());
 			}

 			print.line(repeatString('-', labelLen + valueLen + 7));
 			count = 0;
 			for ( i in bookmarks ) {
 				count++;
 				print.line('| ' & i & repeatString(' ', labelLen-i.len()) & ' : ' & bookmarks[i] & repeatString(' ', valueLen - bookmarks[i].len()) & ' |');
 				//if ( count < bookmarks.len() ) {
 				//	print.line('| ' & repeatString(chr(183), labelLen + valueLen + 3) & ' |');
 				//}
 			};
 			print.line(repeatString('-', labelLen + valueLen + 7));
 		}		
	}
}