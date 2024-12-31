import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantcare/models/plant.dart';
import 'package:plantcare/models/care_schedule.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collection references
  final CollectionReference _plantsCollection =
      FirebaseFirestore.instance.collection('plants');
  final CollectionReference _careSchedulesCollection =
      FirebaseFirestore.instance.collection('care_schedules');

  // CRUD operations for plants
  Future<void> addPlant(Plant plant) async {
    try {
      await _plantsCollection.doc(plant.id).set(plant.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Plant>> getPlants() async {
    try {
      QuerySnapshot snapshot = await _plantsCollection.get();
      return snapshot.docs
          .map((doc) => Plant.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // CRUD operations for care schedules
  Future<void> addCareSchedule(CareSchedule schedule) async {
    try {
      await _careSchedulesCollection.doc(schedule.id).set(schedule.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CareSchedule>> getCareSchedules(String plantId) async {
    try {
      QuerySnapshot snapshot = await _careSchedulesCollection
          .where('plantId', isEqualTo: plantId)
          .get();
      return snapshot.docs
          .map(
              (doc) => CareSchedule.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
