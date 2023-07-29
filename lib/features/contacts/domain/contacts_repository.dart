import 'models/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> getContacts();
}
