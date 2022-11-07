String GetFirtsName(String fullName) {
  var names = fullName.split(' ');
  String firstName = names[0];
  String lastName = names[1];

  return firstName;
}
