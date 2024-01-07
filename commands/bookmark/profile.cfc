/**
* Switch Profiles. (Change the working profile)
*/
component extends=_shared {

	property bookmarkUtils inject="BookmarkUtils@commandbox-bookmarks";

	/**
	* @name Name of bookmark to go to
	* @name.optionsUDF nameAutoComplete
	*/
	function run ( string name='default' ) {
 		arguments.name = trim(name);

 		if ( getProfile().lCase() == name.lCase() ) {
 			print.greenLine( 'Your working profile was already set to ' & name );

 		} else if ( name == 'default' || structKeyExists(getProfiles(), name) ) {
			bookmarkUtils.setProfile(name);
			print.greenLine( 'Your working profile has been set to ' & name );

 		} else {
 			if ( confirm( 'Profile does not exist.  Do you want to create it? [y/n]' ) ) {
 				bookmarkUtils.setProfile(name);
 				print.greenLine( 'Profile has been created.' );
 			} else {
 				print.yellowLine( 'Your working profile has NOT been changed, and remains ' &  getProfile() );
 			}
 		}		
	}

	function nameAutoComplete() {
		return getProfiles().keyArray();
	}
	
}
