import 'dart:developer';

import 'package:contact_app/domain/contact/contact_dto.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ContactController extends GetxController {
  final contacts = [].obs;
  bool addContact({required ContactDto contactDto}) {
    try {
      //contacts([...contacts, contactDto]);
      contacts.add(contactDto);
      log(contacts.length.toString());
      update();
      return true;
    } catch (e) {
      return false;
    }
  }
}
