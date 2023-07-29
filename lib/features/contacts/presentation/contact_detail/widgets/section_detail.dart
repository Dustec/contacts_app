import 'package:flutter/material.dart';

class SectionDetail extends StatelessWidget {
  const SectionDetail({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(value),
      ),
    );
  }
}
