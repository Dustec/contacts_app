import 'package:contacts_app/features/contacts/presentation/contact_detail/pages/contact_detail_page.dart';
import 'package:contacts_app/features/contacts/presentation/create_contact_page/pages/creaate_contact_provider.dart';

import '../../../domain/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/my_contacts_cubit.dart';

class MyContactsPage extends StatelessWidget {
  const MyContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyContactsCubit cubit = context.read();
    return Scaffold(
      appBar: AppBar(title: const Text('My Contacts')),
      body: BlocBuilder<MyContactsCubit, MyContactsState>(
        builder: (BuildContext context, MyContactsState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: state.contacts.length,
            itemBuilder: (BuildContext context, int index) {
              final Contact item = state.contacts[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(item.completeName),
                subtitle: Text(item.city),
                onTap: () {
                  Navigator.push<void>(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ContactDetailPage(contact: item);
                  }));
                },
              );
            },
            separatorBuilder: (context, _) => const Divider(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Contact? createdContact = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateContactProvider(),
            ),
          );
          if (createdContact != null) {
            cubit.addNewContact(createdContact);
          }
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
