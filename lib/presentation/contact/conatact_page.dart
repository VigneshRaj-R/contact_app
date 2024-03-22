import 'package:contact_app/presentation/add_conatct/add_contact_page.dart';
import 'package:contact_app/presentation/conatct_details/contact_details_page.dart';
import 'package:contact_app/presentation/contact/widgets/conatct_over_view_page.dart';
import 'package:contact_app/presentation/controller_and_binding/contact_controller.dart';
import 'package:contact_app/presentation/core/utils/app_color.dart';
import 'package:contact_app/presentation/core/utils/app_sized_box.dart';
import 'package:contact_app/presentation/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactController());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            centerTitle: false,
            title: Text(
              'Contacts',
              style: kTextStyleTitle.copyWith(
                color: kWhitColor,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.sort_sharp,
                  color: kWhitColor,
                ),
                onPressed: () {},
              )
            ]),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
                children: controller.contacts
                    .map(
                      (element) => ContactTile(
                        contactDto: element,
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
                      ),
                    )
                    .toList()),
          ),
        ),
        // ContactOverviewPage(
        //     contacts: controller.contacts,
        //   ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => AddContactPage(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ));
  }
}
