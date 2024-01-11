component {

    property bookmarkUtils inject="BookmarkUtils@commandbox-bookmarks";

	function getDefaultProfile () {
        var profile = SystemSettings.getSystemSetting('commandbox_bookmarks_profile', 'default').trim();
        if ( profile == 'system.user' ) {
            profile = SystemSettings.getSystemSetting('user.name', 'default').trim();
            if ( profile != 'default' &&
                 !getProfiles().keyExists(profile) ) {
                var bookmarks = getBookmarks('default');
                if ( bookmarks.count() ) {
                    setBookmarks(bookmarks, profile);
                }
            }
        }
        return profile;
    }

    function getProfile () {
        if ( !bookmarkUtils.getProfile().len() ) {
            bookmarkUtils.setProfile(getDefaultProfile());
        }        
        return bookmarkUtils.getProfile();
    }

    function getProfiles () {
        return ConfigService.getSetting( 'modules.commandbox-bookmarks.profiles', {'default':{'bookmarks':{}}} );
    }

    function getBookmarks ( string profile=getProfile() ) {
        var profile = arguments.profile == 'default'? '' : '.profiles.' & arguments.profile; 
        return ConfigService.getSetting( 'modules.commandbox-bookmarks' & profile & '.bookmarks', {} );
    }

    function setBookmarks ( struct bookmarks={}, string profile=getProfile() ) {
        var profile = arguments.profile == 'default'? '' : '.profiles.' & arguments.profile; 
        ConfigService.setSetting( name='modules.commandbox-bookmarks' & profile & '.bookmarks', value=serializeJson(arguments.bookmarks) );                  
        this;
    }
}