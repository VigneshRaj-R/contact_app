import 'package:contact_app/presentation/conatct_details/widgets/contact_details_over_view_page.dart';
import 'package:contact_app/presentation/core/utils/app_color.dart';
import 'package:contact_app/presentation/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../domain/contact/contact_dto.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactDto contactDto =
        ModalRoute.of(context)?.settings.arguments as ContactDto;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kWhitColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Contact Details',
            style: kTextStyleTitle.copyWith(
              color: kWhitColor,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.star_border_outlined,
                color: kWhitColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: kWhitColor,
              ),
              onPressed: () {},
            )
          ],
        ),
        body:  ContactDetailsOverviewPage(contactDto: contactDto,));
  }
}
