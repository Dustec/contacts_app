import 'package:contacts_app/features/contacts/data/contacts_data_repository.dart';
import 'package:contacts_app/features/contacts/presentation/my_contacts/cubit/my_contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_contacts_page.dart';

class MyContactsProvider extends StatelessWidget {
  const MyContactsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyContactsCubit>(
      create: (context) =>
          MyContactsCubit(contactsRepository: const ContactsDataRepository()),
      child: const MyContactsPage(),
    );
  }
}
