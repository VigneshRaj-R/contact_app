class ContactDto {
  final String name;
  final String group;
  final String phone;
  final String email;
  final String? photo;

  ContactDto(
      {required this.name,
      required this.group,
      required this.phone,
      required this.email,
      this.photo = ''});
}
