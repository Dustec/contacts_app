import 'package:contacts_app/common/contract/mapper.dart';
import 'package:contacts_app/features/contacts/data/dto/contact_dto.dart';
import 'package:contacts_app/features/contacts/domain/models/contact.dart';

class ContactFromDtoMapper implements Mapper<ContactDto, Contact> {
  const ContactFromDtoMapper();

  @override
  Contact map(ContactDto t) {
    return Contact(
      id: t.contactId ?? '',
      firstName: t.firstName ?? '',
      lastName: t.lastName ?? '',
      phoneNumber: t.phoneNumber ?? '',
      streetAddress: t.streetAddress ?? '',
      city: t.city ?? '',
      state: t.state ?? '',
      zipCode: t.zipCode ?? '',
    );
  }
}
