component {

    property bookmarkUtils inject="BookmarkUtils@commandbox-bookmarks";

	function getProfile () {
        if ( !bookmarkUtils.getProfile().len() ) {
            bookmarkUtils.setProfile(SystemSettings.getSystemSetting('commandbox_bookmarks_profile', 'default'));
        }        
        return bookmarkUtils.getProfile();
    }

    function getProfiles () {
        return ConfigService.getSetting( 'modules.commandbox-bookmarks.profiles', {'default':{'bookmarks':{}}} );
    }

    function getBookmarks () {
        var profile = getProfile().trim() == 'default'? '' : '.profiles.' & getProfile(); 
        return ConfigService.getSetting( 'modules.commandbox-bookmarks' & profile & '.bookmarks', {} );
    }

    function setBookmarks ( struct bookmarks={} ) {
        var profile = getProfile().trim() == 'default'? '' : '.profiles.' & getProfile(); 
        ConfigService.setSetting( name='modules.commandbox-bookmarks' & profile & '.bookmarks', value=serializeJson(arguments.bookmarks) );
        
        this;
    }
}