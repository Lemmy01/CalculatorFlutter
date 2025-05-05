import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/core/errors/exceptions.dart';
import 'package:usv_hub_management/features/add_events/data/models/event_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EventApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<EventModel>> getEvent(String departamentId) async {
    final List<EventModel> events = [];
    try {
      final response = await _firestore
          .collection(AppCollections.events)
          .where(
            AppFields.departamentId,
            isEqualTo: departamentId,
          )
          .get();
      for (final doc in response.docs) {
        events.add(EventModel.fromMap(doc.data()));
      }
      return events;
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }

  Future<void> addEvent(EventModel model) async {
    try {
      final doc = _firestore.collection(AppCollections.events).doc();

      await doc.set(model.copyWith(id: doc.id).toMap());
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }
}
