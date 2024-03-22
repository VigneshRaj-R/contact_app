import 'dart:developer';

import 'package:contact_app/infrastructure/contact_operation.dart';
import 'package:contact_app/presentation/add_conatct/widgets/add_contact_over_view_page.dart';
import 'package:contact_app/presentation/controller_and_binding/contact_controller.dart';
import 'package:contact_app/presentation/core/utils/app_color.dart';
import 'package:contact_app/presentation/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactPage extends GetView<ContactController> {
  AddContactPage({super.key});
  final List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: kWhitColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Create new contact',
          style: kTextStyleTitle.copyWith(
            color: kWhitColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.addContact(
                  contactDto: controllers
                      .map((e) => e.text)
                      .toList()
                      .createContactFromList());
              Navigator.of(context).pop();
            },
            child: Text(
              'Save',
              style: kTextStyleSubTitle.copyWith(
                color: kWhitColor,
              ),
            ),
          )
        ],
      ),
      body: AddContactOverviewPage(
        controllers: controllers,
      ),
    );
  }
}
