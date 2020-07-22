component extends="commandbox.system.BaseCommand" {
	property name='ConfigService' inject='ConfigService';

	function run ( string name='', string path ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
 		if ( !arguments.name.len() ) {
 			print.redBoldLine( 'Name is Required.' );
 			return;
		}

		arguments.path = arguments.path?:getCWD();
		bookmarks[trim(arguments.name)] = arguments.path;
		
		ConfigService.setConfigSettings( configSettings );
		
		print.greenLine('Bookmark Saved.')
 	}
}