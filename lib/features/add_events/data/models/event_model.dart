import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usv_hub_management/features/add_events/domain/entities/event_entity.dart';

import '../../../../core/consts.dart';

class EventModel extends EventEntity {
  EventModel(
      {required super.id,
      required super.departamentId,
      required super.title,
      required super.startTime,
      required super.endTime,
      required super.classWhereHeld,
      required super.supporterName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AppFields.id: id,
      AppFields.departamentId: departamentId,
      AppFields.title: title,
      AppFields.startTime: Timestamp.fromDate(startTime),
      AppFields.endTime: Timestamp.fromDate(endTime),
      AppFields.classWhereHeld: classWhereHeld,
      AppFields.supporterName: supporterName,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map[AppFields.id] as String,
      departamentId: map[AppFields.departamentId] as String,
      title: map[AppFields.title] as String,
      startTime: (map[AppFields.startTime] as Timestamp).toDate(),
      endTime: (map[AppFields.endTime] as Timestamp).toDate(),
      classWhereHeld: map[AppFields.classWhereHeld] as String,
      supporterName: map[AppFields.supporterName] as String,
    );
  }

  EventModel copyWith({
    String? id,
    String? departamentId,
    String? title,
    DateTime? startTime,
    DateTime? endTime,
    String? classWhereHeld,
    String? supporterName,
  }) {
    return EventModel(
      id: id ?? this.id,
      departamentId: departamentId ?? this.departamentId,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      classWhereHeld: classWhereHeld ?? this.classWhereHeld,
      supporterName: supporterName ?? this.supporterName,
    );
  }
}
