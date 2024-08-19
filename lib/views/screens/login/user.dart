class User {
  final String phoneNumber;
  final String password;
  final String name;
  final String email;
  final String address;

  User(
      {required this.password,
      required this.email,
      required this.address,
      required this.phoneNumber,
      required this.name});
}
