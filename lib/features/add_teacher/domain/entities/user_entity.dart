class UserEntity {
  String id;
  final String name;
  final String email;
  final int phoneNumber;
  final String fatherName;
  final String motherName;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.fatherName,
      required this.motherName});
}
