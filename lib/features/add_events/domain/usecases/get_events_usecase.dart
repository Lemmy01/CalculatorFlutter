import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/add_events/domain/entities/event_entity.dart';
import 'package:usv_hub_management/features/add_events/domain/repositories/event_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetEventsUsecase
    extends Usecase<Either<Failure, List<EventEntity>>, String> {
  final EventRepository _departamentRepo;

  GetEventsUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, List<EventEntity>>> call({required String params}) {
    return _departamentRepo.getEvents(departamentId: params);
  }
}
