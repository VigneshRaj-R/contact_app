import 'package:contact_app/infrastructure/contact_operation.dart';
import 'package:contact_app/presentation/conatct_details/contact_details_page.dart';
import 'package:contact_app/presentation/controller_and_binding/contact_controller.dart';
import 'package:contact_app/presentation/core/utils/app_sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/contact/contact_dto.dart';

List<ContactDto> contacts = [
  ContactDto(
      name: 'sourav',
      group: 'school',
      phone: '987456221',
      email: 'abc@mail.com')
];

class ContactOverviewPage extends StatelessWidget {
  const ContactOverviewPage({super.key, required this.contacts});
  final RxList<ContactDto> contacts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ContactTile(
          contactDto: contacts[index],
          onTap: (contactDto) {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const ContactDetailsPage(),
                settings: RouteSettings(
                  arguments: contactDto,
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return kHeight10;
      },
      itemCount: contacts.length,
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({super.key, required this.contactDto, this.onTap});

  final ContactDto contactDto;
  final void Function(ContactDto contactDto)? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap != null ? () => onTap!(contactDto) : null,
      leading: CircleAvatar(
        child: Text(contactDto.name.substring(0, 1)),
      ),
      title: Text(contactDto.name),
      subtitle: Text(contactDto.phone),
    );
  }
}
