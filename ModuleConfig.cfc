component {

	function configure () {
		settings = {
			bookmarks = {}
		};
	}

	function onSystemSettingExpansion( struct interceptData ) {
		
		// ${bookmark.name}
		if( interceptData.setting.lcase().startsWith( 'bookmark.' ) ) {
			
			var settingName = interceptData.setting.replaceNoCase( 'bookmark.', '', 'one' );
			
			interceptData.setting = settings.bookmarks[ settingName ] ?: interceptData.defaultValue;
						
			// Stop processing expansions on this setting
			interceptData.resolved=true;
			return true;
		}
		
	}

}