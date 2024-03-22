import '../domain/contact/contact_dto.dart';

class ContactUtilities {
  static final ContactUtilities _instance = ContactUtilities._internal();

  factory ContactUtilities() {
    return _instance;
  }

  List<ContactDto> get contact => contacts;

  ContactUtilities._internal();

  List<ContactDto> contacts = [];
}
