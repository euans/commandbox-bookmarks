component {

	function configure () {
		settings = {
			bookmarks = {}
		};
	}

	function onLoad () {
		binder
            .map('bookmarkUtils@commandbox-bookmarks')
            .to('#moduleMapping#.models.BookmarkUtils')
            .asSingleton();
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

	function postProcessLine( interceptData ) {
		var bookmarkUtils = wirebox.getInstance('bookmarkUtils@commandbox-bookmarks');
		//if not an interal command
		if(['bookmark','bookmarks','goto'].containsNoCase(listFirst(trim(interceptData.line))) == 0){
			bookmarkUtils.setLastCommand(interceptData.line);
		}
		return;
	}

}
