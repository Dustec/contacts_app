import 'package:contacts_app/features/contacts/presentation/create_contact_page/cubit/create_contact_cubit.dart';
import 'package:contacts_app/features/contacts/presentation/create_contact_page/pages/create_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContactProvider extends StatelessWidget {
  const CreateContactProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateContactCubit>(
      create: (context) => CreateContactCubit(),
      child: const CreateContactPage(),
    );
  }
}
