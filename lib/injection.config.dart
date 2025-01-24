// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/view_departaments/data/datasources/departament_api_service.dart'
    as _i971;
import 'features/view_departaments/data/repositories/departament_repo_impl.dart'
    as _i173;
import 'features/view_departaments/domain/repositories/departament_repo.dart'
    as _i1006;
import 'features/view_departaments/domain/usecases/get_course_usecase.dart'
    as _i0;
import 'features/view_departaments/domain/usecases/get_departaments_usecase.dart'
    as _i606;
import 'features/view_departaments/domain/usecases/get_semesters_usecase.dart'
    as _i84;
import 'features/view_departaments/presentation/provider/departament_home_provider.dart'
    as _i510;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i971.DepartamentApiService>(
        () => _i971.DepartamentApiService());
    gh.lazySingleton<_i1006.DepartamentRepository>(() =>
        _i173.DepartamentRepoImpl(
            departamentApiService: gh<_i971.DepartamentApiService>()));
    gh.lazySingleton<_i606.GetDepartamentsUsecase>(
        () => _i606.GetDepartamentsUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i0.GetCoursesUsecase>(
        () => _i0.GetCoursesUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i84.GetSemestersUsecase>(
        () => _i84.GetSemestersUsecase(gh<_i1006.DepartamentRepository>()));
    gh.factory<_i510.DepartamentHomeProvider>(
        () => _i510.DepartamentHomeProvider(
              getDepartamentsUsecase: gh<_i606.GetDepartamentsUsecase>(),
              getSemesterUsecase: gh<_i84.GetSemestersUsecase>(),
              getCoursesUsecase: gh<_i0.GetCoursesUsecase>(),
            ));
    return this;
  }
}
