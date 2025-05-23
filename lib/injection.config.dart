// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/add_events/data/datasources/event_api_service.dart' as _i985;
import 'features/add_events/data/repositories/event_repo_impl.dart' as _i991;
import 'features/add_events/domain/repositories/event_repo.dart' as _i621;
import 'features/add_events/domain/usecases/add_event_usecase.dart' as _i827;
import 'features/add_events/domain/usecases/get_events_usecase.dart' as _i629;
import 'features/add_events/presentation/providers/event_form_provider.dart'
    as _i40;
import 'features/add_events/presentation/providers/event_provider.dart'
    as _i121;
import 'features/add_students/data/datasources/student_api_service.dart'
    as _i406;
import 'features/add_students/data/repositories/add_student_repo_impl.dart'
    as _i778;
import 'features/add_students/domain/repositories/add_students_repository.dart'
    as _i577;
import 'features/add_students/domain/usecases/add_student_usecase.dart'
    as _i264;
import 'features/add_students/domain/usecases/get_students_usecase.dart'
    as _i907;
import 'features/add_students/presentation/provider/students_page_provider.dart'
    as _i364;
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
import 'features/login/data/datasources/login_service.dart' as _i759;
import 'features/login/data/repositories/auth_repo_impl.dart' as _i1007;
import 'features/login/domain/repositories/auth_repo.dart' as _i17;
import 'features/login/domain/usecases/is_loged_usecase.dart' as _i488;
import 'features/login/domain/usecases/login_usecase.dart' as _i333;
import 'features/login/domain/usecases/logout_usecase.dart' as _i1070;
import 'features/login/presentation/provider/login_provider.dart' as _i571;
import 'features/view_departaments/data/datasources/departament_api_service.dart'
    as _i971;
import 'features/view_departaments/data/repositories/departament_repo_impl.dart'
    as _i173;
import 'features/view_departaments/domain/repositories/departament_repo.dart'
    as _i1006;
import 'features/view_departaments/domain/usecases/add_course_usecase.dart'
    as _i540;
import 'features/view_departaments/domain/usecases/add_semester_usecase.dart'
    as _i94;
import 'features/view_departaments/domain/usecases/get_course_usecase.dart'
    as _i0;
import 'features/view_departaments/domain/usecases/get_departaments_usecase.dart'
    as _i606;
import 'features/view_departaments/domain/usecases/get_semesters_usecase.dart'
    as _i84;
import 'features/view_departaments/domain/usecases/get_teacher_info_usecase.dart'
    as _i794;
import 'features/view_departaments/presentation/provider/add_course_provider.dart'
    as _i250;
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
    gh.lazySingleton<_i985.EventApiService>(() => _i985.EventApiService());
    gh.lazySingleton<_i406.StudentApiService>(() => _i406.StudentApiService());
    gh.lazySingleton<_i618.TeacherApiService>(() => _i618.TeacherApiService());
    gh.lazySingleton<_i759.LoginService>(() => _i759.LoginService());
    gh.lazySingleton<_i971.DepartamentApiService>(
        () => _i971.DepartamentApiService());
    gh.lazySingleton<_i17.AuthRepo>(
        () => _i1007.AuthRepoImpl(loginService: gh<_i759.LoginService>()));
    gh.lazySingleton<_i621.EventRepository>(
        () => _i991.EventRepoImpl(gh<_i985.EventApiService>()));
    gh.lazySingleton<_i577.AddStudentsRepository>(
        () => _i778.AddStudentsRepoImpl(gh<_i406.StudentApiService>()));
    gh.lazySingleton<_i629.GetEventsUsecase>(
        () => _i629.GetEventsUsecase(gh<_i621.EventRepository>()));
    gh.lazySingleton<_i488.IsLogedInUsecase>(
        () => _i488.IsLogedInUsecase(gh<_i17.AuthRepo>()));
    gh.lazySingleton<_i333.LoginUsecase>(
        () => _i333.LoginUsecase(gh<_i17.AuthRepo>()));
    gh.lazySingleton<_i1070.LogoutUsecase>(
        () => _i1070.LogoutUsecase(gh<_i17.AuthRepo>()));
    gh.lazySingleton<_i677.AddTeacherRepository>(
        () => _i382.AddTeacherRepoImpl(gh<_i618.TeacherApiService>()));
    gh.lazySingleton<_i1006.DepartamentRepository>(() =>
        _i173.DepartamentRepoImpl(
            departamentApiService: gh<_i971.DepartamentApiService>()));
    gh.lazySingleton<_i907.GetStudentsUsecase>(
        () => _i907.GetStudentsUsecase(gh<_i577.AddStudentsRepository>()));
    gh.lazySingleton<_i540.AddCourseUsecase>(
        () => _i540.AddCourseUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i94.AddSemesterUsecase>(
        () => _i94.AddSemesterUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i0.GetCoursesUsecase>(
        () => _i0.GetCoursesUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i606.GetDepartamentsUsecase>(
        () => _i606.GetDepartamentsUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i84.GetSemestersUsecase>(
        () => _i84.GetSemestersUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i794.GetTeacherInfoUsecase>(
        () => _i794.GetTeacherInfoUsecase(gh<_i1006.DepartamentRepository>()));
    gh.lazySingleton<_i264.AddStudentUsecase>(
        () => _i264.AddStudentUsecase(gh<_i577.AddStudentsRepository>()));
    gh.lazySingleton<_i429.GetTeacherUsecase>(
        () => _i429.GetTeacherUsecase(gh<_i677.AddTeacherRepository>()));
    gh.lazySingleton<_i574.AddTeacherUsecase>(
        () => _i574.AddTeacherUsecase(gh<_i677.AddTeacherRepository>()));
    gh.factory<_i510.DepartamentHomeProvider>(
        () => _i510.DepartamentHomeProvider(
              getDepartamentsUsecase: gh<_i606.GetDepartamentsUsecase>(),
              getSemesterUsecase: gh<_i84.GetSemestersUsecase>(),
              getCoursesUsecase: gh<_i0.GetCoursesUsecase>(),
              getTeacherInfoUsecase: gh<_i794.GetTeacherInfoUsecase>(),
            ));
    gh.factory<_i236.FormProvider>(() => _i236.FormProvider(
          addTeacherUsecase: gh<_i574.AddTeacherUsecase>(),
          addStudentUsecase: gh<_i264.AddStudentUsecase>(),
        ));
    gh.factory<_i158.EditDepartamentProvider>(() =>
        _i158.EditDepartamentProvider(
            addSemesterUsecase: gh<_i94.AddSemesterUsecase>()));
    gh.lazySingleton<_i827.AddEventUsecase>(
        () => _i827.AddEventUsecase(gh<_i621.EventRepository>()));
    gh.factory<_i283.HomePageProvider>(() => _i283.HomePageProvider(
          getDepartamentsUsecase: gh<_i606.GetDepartamentsUsecase>(),
          getTeacherUsecase: gh<_i429.GetTeacherUsecase>(),
        ));
    gh.factory<_i40.EventFormProvider>(() =>
        _i40.EventFormProvider(addEventUsecase: gh<_i827.AddEventUsecase>()));
    gh.factory<_i121.EventProvider>(() => _i121.EventProvider(
          getDepartamentsUsecase: gh<_i606.GetDepartamentsUsecase>(),
          getEventsUsecase: gh<_i629.GetEventsUsecase>(),
        ));
    gh.factory<_i364.StudentPageProvider>(() => _i364.StudentPageProvider(
          getDepartamentsUsecase: gh<_i606.GetDepartamentsUsecase>(),
          getTeacherUsecase: gh<_i907.GetStudentsUsecase>(),
          getSemestersUsecase: gh<_i84.GetSemestersUsecase>(),
        ));
    gh.factory<_i571.LoginProvider>(() => _i571.LoginProvider(
          gh<_i333.LoginUsecase>(),
          gh<_i1070.LogoutUsecase>(),
          gh<_i488.IsLogedInUsecase>(),
        ));
    gh.factory<_i250.AddCourseProvider>(() => _i250.AddCourseProvider(
          gh<_i429.GetTeacherUsecase>(),
          gh<_i540.AddCourseUsecase>(),
        ));
    return this;
  }
}
