component {
	function configure () {
		settings = {
			bookmarks = {},
			lastcommand = ""
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

	function postProcessLine(interceptData){
		var ConfigService = shell.getConfigService();
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-bookmarks"].lastcommand', default={});
		//if not an interal command
		if(['bookmark','bookmarks','goto'].containsNoCase(listFirst(trim(interceptData.line))) == 0){
			configSettings.modules["commandbox-bookmarks"]['lastcommand'] = interceptData.line;
			ConfigService.setConfigSettings( configSettings );
		}
		return;
	}

}