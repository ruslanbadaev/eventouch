String? getAbbreviation(String name) {
  List<String> nameList = name.split(' ');
  nameList.removeWhere((item) => item == '' || item == ' ');

  // if (nameList.isEmpty || name.replaceAll(' ', '').isEmpty) {
  //   return '--';
  // }
  if (nameList.length == 1) {
    return nameList[0][0];
  }
  if (nameList.length > 1) {
    return nameList[0][0] + nameList[1][0];
  }
  return null;
}
