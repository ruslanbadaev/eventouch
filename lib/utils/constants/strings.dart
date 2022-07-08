import 'dart:developer';

class AppStrings {
  static const String APP_NAME_TITLE = "PRES7T";
  static const String APP_NAME = "pres7t";
  static const String COULD_NOT_LAUNCH = "Could not launch";
  static const String OPTIONS = 'Options';

  static String getInitials(String name) {
    String initials = 'o_O';
    initials = initials.replaceAll('  ', ' ');
    if (name.replaceAll(' ', '').length > 0) {
      if (name.split(' ').length > 1) {
        if (name.split(' ')[0].isNotEmpty && name.split(' ')[1].isNotEmpty)
          initials = '${name.split(' ')[0][0]}${name.split(' ')[1][0]}'.toUpperCase();
      } else if (name.split(' ').length == 1) {
        initials = name.length > 2 ? '${name[0]}${name[1]}' : name[0];
      }
    }
    log(initials);
    return initials;
  }
}
