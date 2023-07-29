import 'dart:convert';
import 'package:contacts_app/features/contacts/data/mappers/contact_from_dto_mapper.dart';
import 'package:contacts_app/features/contacts/domain/contacts_repository.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:contacts_app/common/contract/mapper.dart';
import 'package:contacts_app/features/contacts/data/dto/contact_dto.dart';
import 'package:contacts_app/features/contacts/domain/models/contact.dart';

import 'dto/contacts_list_dto.dart';

class ContactsDataRepository implements ContactsRepository {
  const ContactsDataRepository({
    Mapper<ContactDto, Contact> contactMapper = const ContactFromDtoMapper(),
  }) : _contactMapper = contactMapper;

  final Mapper<ContactDto, Contact> _contactMapper;

  @override
  Future<List<Contact>> getContacts() async {
    final String data = await rootBundle.loadString('assets/contacts.json');
    return ContactsListDto.fromJson(jsonDecode(data) as Map<String, dynamic>)
            .contacts
            ?.map(_contactMapper.map)
            .toList() ??
        <Contact>[];
  }
}
