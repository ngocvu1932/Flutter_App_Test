class User {
  final String phoneNumber;
  final String password;
  final String? name;
  final String? email;
  final String? address;

  User(
      {required this.password,
      required this.phoneNumber,
      this.email,
      this.address,
      this.name});
}
