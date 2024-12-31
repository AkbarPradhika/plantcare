import 'package:cloud_firestore/cloud_firestore.dart';

class CareSchedule {
  String id;
  String plantId;
  String action;
  DateTime date;

  CareSchedule(
      {required this.id,
      required this.plantId,
      required this.action,
      required this.date});

  factory CareSchedule.fromMap(Map<String, dynamic> data) {
    return CareSchedule(
      id: data['id'],
      plantId: data['plantId'],
      action: data['action'],
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plantId': plantId,
      'action': action,
      'date': date,
    };
  }
}
