import 'package:flutter/material.dart';

class ReleaseYearChipCustomWidget extends StatelessWidget {
  final String? releaseDate;

  const ReleaseYearChipCustomWidget({super.key, this.releaseDate});

  @override
  Widget build(BuildContext context) {
    String year = "Uninformed";
    if (releaseDate != null){
      year = DateTime.parse(releaseDate!).year.toString();
    }
    return Chip(
      backgroundColor: Colors.white12,
      avatar: const Icon(Icons.calendar_month),
      label: Text("Year: $year"),
    );
  }
}