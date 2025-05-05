import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/exceptions.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/features/add_events/data/datasources/event_api_service.dart';
import 'package:usv_hub_management/features/add_events/data/models/event_model.dart';
import 'package:usv_hub_management/features/add_events/domain/entities/event_entity.dart';
import 'package:usv_hub_management/features/add_events/domain/repositories/event_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EventRepository)
class EventRepoImpl extends EventRepository {
  EventApiService eventApiService;

  EventRepoImpl(this.eventApiService);

  @override
  Future<Either<Failure, void>> addEvent({
    required EventEntity event,
  }) async {
    try {
      EventModel eventModel = EventModel(
        id: event.id,
        departamentId: event.departamentId,
        title: event.title,
        startTime: event.startTime,
        endTime: event.endTime,
        classWhereHeld: event.classWhereHeld,
        supporterName: event.supporterName,
      );
      await eventApiService.addEvent(eventModel);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getEvents(
      {required String departamentId}) async {
    try {
      final List<EventEntity> teachers =
          await eventApiService.getEvent(departamentId);
      return Right(teachers);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }
}
