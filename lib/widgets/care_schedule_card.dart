import 'package:flutter/material.dart';
import 'package:plantcare/models/care_schedule.dart';
import 'package:intl/intl.dart';


class CareScheduleCard extends StatelessWidget {
  final CareSchedule schedule;

  const CareScheduleCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(schedule.action),
        subtitle: Text(DateFormat('yyyy-MM-dd').format(schedule.date)),
        onTap: () {
          // Navigate to schedule edit page (implement later)
        },
      ),
    );
  }
}
