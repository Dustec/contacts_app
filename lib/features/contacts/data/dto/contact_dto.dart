import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_dto.g.dart';

@JsonSerializable()
class ContactDto {
  const ContactDto({
    required this.contactId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory ContactDto.fromJson(Map<String, dynamic> json) =>
      _$ContactDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ContactDtoToJson(this);

  final String? contactId;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? streetAddress;
  final String? city;
  final String? state;
  final String? zipCode;
}
