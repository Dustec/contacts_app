import 'package:freezed_annotation/freezed_annotation.dart';

import 'contact_dto.dart';

part 'contacts_list_dto.g.dart';

@JsonSerializable()
class ContactsListDto {
  ContactsListDto({
    this.contacts,
  });

  factory ContactsListDto.fromJson(Map<String, dynamic> json) =>
      _$ContactsListDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ContactsListDtoToJson(this);

  final List<ContactDto>? contacts;
}
