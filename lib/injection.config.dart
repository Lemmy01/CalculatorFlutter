// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/add_teacher/data/datasources/teacher_api_service.dart'
    as _i618;
import 'features/add_teacher/data/repositories/add_teacher_repo_impl.dart'
    as _i382;
import 'features/add_teacher/domain/repositories/add_teacher_repository.dart'
    as _i677;
import 'features/add_teacher/domain/usecases/add_teacher_usecase.dart' as _i574;
import 'features/add_teacher/domain/usecases/get_teacher_usecase.dart' as _i429;
import 'features/add_teacher/presentation/provider/form_provider.dart' as _i236;
import 'features/add_teacher/presentation/provider/home_page_provider.dart'
    as _i283;
import 'features/view_departaments/data/datasources/departament_api_service.dart'
    as _i971;
import 'features/view_departaments/data/repositories/departament_repo_impl.dart'
    as _i173;
import 'features/view_departaments/domain/repositories/departament_repo.dart'
    as _i1006;
import 'features/view_departaments/domain/usecases/add_semester_usecase.dart'
    as _i94;
import 'features/view_departaments/domain/usecases/get_course_usecase.dart'
    as _i0;
import 'features/view_departaments/domain/usecases/get_departaments_usecase.dart'
    as _i606;
import 'features/view_departaments/domain/usecases/get_semesters_usecase.dart'
    as _i84;
import 'features/view_departaments/presentation/provider/departament_home_provider.dart'
    as _i510;
import 'features/view_departaments/presentation/provider/edit_departament_provider.dart'
    as _i158;

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
    gh.lazySingleton<_i618.TeacherApiService>(() => _i618.TeacherApiService());
    gh.lazySingleton<_i971.DepartamentApiService>(
        () => _i971.DepartamentApiService());
    gh.lazySingleton<_i1006.DepartamentRepository>(() =>
        _i173.DepartamentRepoImpl(
            departamentApiService: gh<_i971.DepartamentApiService>()));
    gh.lazySingleton<_i0.GetCoursesUsecase>(
        () => _i0.GetCoursesUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i606.GetDepartamentsUsecase>(
        () => _i606.GetDepartamentsUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i84.GetSemestersUsecase>(
        () => _i84.GetSemestersUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i94.AddSemesterUsecase>(
        () => _i94.AddSemesterUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i677.AddTeacherRepository>(
        () => _i382.AddTeacherRepoImpl(gh<_i618.TeacherApiService>()));
    gh.factory<_i158.EditDepartamentProvider>(() =>
        _i158.EditDepartamentProvider(
            addSemesterUsecase: gh<_i94.AddSemesterUsecase>()));
    gh.factory<_i510.DepartamentHomeProvider>(
        () => _i510.DepartamentHomeProvider(
              getDepartamentsUsecase: gh<_i606.GetDepartamentsUsecase>(),
              getSemesterUsecase: gh<_i84.GetSemestersUsecase>(),
              getCoursesUsecase: gh<_i0.GetCoursesUsecase>(),
            ));
    gh.lazySingleton<_i574.AddTeacherUsecase>(
        () => _i574.AddTeacherUsecase(gh<_i677.AddTeacherRepository>()));
    gh.lazySingleton<_i429.GetTeacherUsecase>(
        () => _i429.GetTeacherUsecase(gh<_i677.AddTeacherRepository>()));
    gh.factory<_i236.FormProvider>(() =>
        _i236.FormProvider(addTeacherUsecase: gh<_i574.AddTeacherUsecase>()));
    gh.factory<_i283.HomePageProvider>(() => _i283.HomePageProvider(
          getDepartamentsUsecase: gh<_i606.GetDepartamentsUsecase>(),
          getTeacherUsecase: gh<_i429.GetTeacherUsecase>(),
        ));
    return this;
  }
}
