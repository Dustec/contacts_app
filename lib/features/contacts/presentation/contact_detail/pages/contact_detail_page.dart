import 'package:flutter/material.dart';
import 'package:contacts_app/features/contacts/presentation/contact_detail/widgets/section_detail.dart';

import '../../../domain/models/contact.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(contact.completeName)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionDetail(
              value: contact.firstName,
            ),
            SectionDetail(
              value: contact.lastName,
            ),
            SectionDetail(
              value: contact.phoneNumber,
            ),
            SectionDetail(
              value: contact.streetAddress,
            ),
            SectionDetail(
              value: contact.city,
            ),
            SectionDetail(
              value: contact.state,
            ),
            SectionDetail(
              value: contact.zipCode,
            ),
          ],
        ));
  }
}
