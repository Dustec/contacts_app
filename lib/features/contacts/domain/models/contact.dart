class Contact {
  const Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;

  String get completeName => '$firstName $lastName';
}
