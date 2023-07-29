import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/contacts_repository.dart';
import '../../../domain/models/contact.dart';

part 'my_contacts_cubit.freezed.dart';

class MyContactsCubit extends Cubit<MyContactsState> {
  MyContactsCubit({
    required ContactsRepository contactsRepository,
  })  : _contactsRepository = contactsRepository,
        super(MyContactsState()) {
    _getContacts();
  }

  final ContactsRepository _contactsRepository;

  void _getContacts() {
    emit(state.copyWith(isLoading: true));
    _contactsRepository.getContacts().then((List<Contact> contacts) {
      emit(state.copyWith(
        isLoading: false,
        contacts: contacts,
      ));
    });
  }

  void createContact() {
    final Contact contactCreated = _getFakeContact();
    final List<Contact> updatedContacts = [
      ...state.contacts,
      contactCreated,
    ];
    emit(state.copyWith(
      contacts: updatedContacts,
    ));
  }

  void addNewContact(Contact contactAdded) {
    final List<Contact> updatedContacts = [
      ...state.contacts,
      contactAdded,
    ];
    emit(state.copyWith(
      contacts: updatedContacts,
    ));
  }

  Contact _getFakeContact() {
    // This method use faker to represent the creation of a Contact without any UI.
    // In a real world use case there should be a form to create a Contact.
    return Contact(
      id: 'xxx-${faker.guid.random.string(1000, min: 11)}',
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      phoneNumber: faker.phoneNumber.random.numberOfLength(10),
      streetAddress: faker.address.streetAddress(),
      city: faker.address.city(),
      state: '${faker.address.state()}(${faker.address.stateAbbreviation()})',
      zipCode: faker.address.zipCode(),
    );
  }
}

@freezed
class MyContactsState with _$MyContactsState {
  factory MyContactsState({
    @Default(false) bool isLoading,
    @Default(<Contact>[]) List<Contact> contacts,
  }) = _MyContactsState;
}
