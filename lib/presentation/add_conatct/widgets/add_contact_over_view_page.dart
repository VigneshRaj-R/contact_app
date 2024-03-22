import 'dart:developer';

import 'package:contact_app/domain/contact/contact_dto.dart';
import 'package:contact_app/infrastructure/image_operation.dart';
import 'package:contact_app/presentation/add_conatct/widgets/image_option_widget.dart';
import 'package:contact_app/presentation/core/utils/app_color.dart';
import 'package:contact_app/presentation/core/utils/app_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddContactOverviewPage extends HookWidget {
  AddContactOverviewPage({super.key, required this.controllers});

  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight80,
            Center(
              child: CircleAvatar(
                radius: 60,
                child: IconButton(
                  onPressed: () {
                    ViewOrSelectImage();
                  },
                  icon: const Icon(Icons.camera_alt, size: 35),
                ),
              ),
            ),
            kHeight20,
            ...contactList.entries.map((e) => AppFormField(
                  fieldName: e.key,
                  iconData: e.value,
                  controller:
                      controllers[contactList.keys.toList().indexOf(e.key)],
                ))
          ],
        ),
      ),
    );
  }
}

class AppFormField extends StatelessWidget {
  AppFormField({
    super.key,
    required this.fieldName,
    required this.iconData,
    this.onChanged,
    this.controller,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final ValueNotifier<bool> isSelected = ValueNotifier(false);

  final String fieldName;
  final IconData iconData;
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSelected,
      builder: (context, value, child) => Row(
        children: [
          Transform.translate(
            offset: const Offset(0, 10),
            child: Icon(
              iconData,
              color: isSelected.value ? kPrimaryColor : Colors.grey,
            ),
          ),
          kWidth20,
          Expanded(
            child: TextFormField(
              controller: controller,
              onTap: () {
                isSelected.value = focusNode.hasPrimaryFocus;
              },
              focusNode: focusNode,
              onChanged: onChanged,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: isSelected.value ? kPrimaryColor : Colors.grey,
                ),
                labelText: fieldName,
                border: const UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final contactList = {
  'Name': Icons.person,
  'Group': Icons.group_outlined,
  'Phone': Icons.phone,
  'Email': Icons.email,
};

extension CreatecontactDTO on List<String> {
  ContactDto createContactFromList() {
    return ContactDto(
        name: this[0], group: this[1], phone: this[2], email: this[3]);
  }
}
