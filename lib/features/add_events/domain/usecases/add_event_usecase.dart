import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/add_events/domain/entities/event_entity.dart';
import 'package:usv_hub_management/features/add_events/domain/repositories/event_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddEventUsecase extends Usecase<Either<Failure, void>, EventEntity> {
  final EventRepository _eventRepository;

  AddEventUsecase(this._eventRepository);
  @override
  Future<Either<Failure, void>> call({required EventEntity params}) {
    return _eventRepository.addEvent(
      event: params,
    );
  }
}
