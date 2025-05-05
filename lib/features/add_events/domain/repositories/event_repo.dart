import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/features/add_events/domain/entities/event_entity.dart';

abstract class EventRepository {
  Future<Either<Failure, void>> addEvent({
    required EventEntity event,
  });

  Future<Either<Failure, List<EventEntity>>> getEvents({
    required String departamentId,
  });
}
