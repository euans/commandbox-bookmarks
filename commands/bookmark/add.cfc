component extends="commandbox.system.BaseCommand" {
	property name='ConfigService' inject='ConfigService';

	function run ( string name, string path ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].bookmarks', default={});
		bookmarks = configSettings.modules['commandbox-bookmarks'].bookmarks;
 		
		arguments.path = arguments.path?:getCWD();
		arguments.name = arguments.name?:listLast(arguments.path, '\/');
		bookmarks[trim(arguments.name)] = arguments.path;
		
		ConfigService.setConfigSettings( configSettings );
		
		print.greenLine('Bookmark Saved.')
 	}
}