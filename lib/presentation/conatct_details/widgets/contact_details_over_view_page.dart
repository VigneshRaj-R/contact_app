import 'package:contact_app/presentation/core/utils/app_color.dart';
import 'package:contact_app/presentation/core/utils/app_sized_box.dart';
import 'package:contact_app/presentation/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../domain/contact/contact_dto.dart';

class ContactDetailsOverviewPage extends StatelessWidget {
  const ContactDetailsOverviewPage({super.key, required this.contactDto});

  final ContactDto contactDto;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          color: kPrimaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 100,
                  color: kWhitColor,
                ),
                kHeight20,
                Text(
                  '${contactDto.name}',
                  style: kTextStyleTitle.copyWith(
                    color: kWhitColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        kHeight20,
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kWhitColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            subtitle: Text("Mobile"),
            leading: const Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            title: Text(contactDto.phone, style: kTextStyleSubTitle),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kWhitColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            subtitle: Text("E mail"),
            leading: const Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            title: Text(contactDto.email, style: kTextStyleSubTitle),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kWhitColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(
              Icons.share,
              color: kPrimaryColor,
            ),
            title: Text("share contact"),
          ),
        )
      ],
    );
  }
}
