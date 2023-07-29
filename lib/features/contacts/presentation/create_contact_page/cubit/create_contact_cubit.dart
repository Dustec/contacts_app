import 'package:contacts_app/features/contacts/domain/models/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_contact_cubit.freezed.dart';

class CreateContactCubit extends Cubit<CreateContactState> {
  CreateContactCubit() : super(CreateContactState());

  void setId(String value) => emit(state.copyWith(id: value));

  void setFirstName(String value) => emit(state.copyWith(firstName: value));

  void setLastName(String value) => emit(state.copyWith(lastName: value));

  void setPhoneNumber(String value) => emit(state.copyWith(phoneNumber: value));

  void setStreetAddress(String value) =>
      emit(state.copyWith(streetAddress: value));

  void setCity(String value) => emit(state.copyWith(city: value));

  void setState(String value) => emit(state.copyWith(state: value));

  void setZipCode(String value) => emit(state.copyWith(zipCode: value));

  Future<void> createContact() async {
    final Contact contactCreated = Contact(
      id: state.id,
      firstName: state.firstName,
      lastName: state.lastName,
      phoneNumber: state.phoneNumber,
      streetAddress: state.streetAddress,
      city: state.city,
      state: state.state,
      zipCode: state.zipCode,
    );

    emit(state.copyWith(
      isLoading: true,
    ));

    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(
      isLoading: false,
      createdContact: contactCreated,
    ));
  }
}

@freezed
class CreateContactState with _$CreateContactState {
  factory CreateContactState({
    @Default(false) bool isLoading,
    @Default('') String id,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phoneNumber,
    @Default('') String streetAddress,
    @Default('') String city,
    @Default('') String state,
    @Default('') String zipCode,
    Contact? createdContact,
  }) = _CreateContactState;
}
