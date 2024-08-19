class UserData {
  final String phoneNumber;
  final String password;
  final String name;
  final String email;
  final String address;

  UserData({
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.email,
    required this.address,
  });
}

List<UserData> mockData = [
  UserData(
      phoneNumber: '0337344135',
      password: '123456',
      name: 'Ngô Ngọc Vũ',
      email: 'ngongocvu668@gmail.com',
      address: 'Tiền Giang'),
  UserData(
      phoneNumber: '0337344136',
      password: '123456',
      name: 'Nguyễn Thị Cẩm Như',
      email: 'ngongocvu668@gmail.com',
      address: 'Gia Lai'),
  UserData(
      phoneNumber: '0337344137',
      password: '123456',
      name: 'Ngô Ngọc Vũ 2',
      email: 'ngongocvu668@gmail.com',
      address: 'Tiền Giang'),
];
