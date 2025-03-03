import 'package:flutter/material.dart';

class AppTextSize {
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 20.0;
  static const double kTextSizeUnit = 10.0;
}

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color.fromARGB(255, 167, 167, 167);
  static const Color red = Colors.red;

  static const Color primary = Color(0xFF13182E);
  static const Color onPrimary = Color(0xFF2C386A);
  static const Color primaryFixed = Color(0xFF6E7079);
  static const Color secondary = Color(0xFF131C3B);
  static const Color onSecondary = Color(0xFF716EF6);
  static const Color error = Color(0xFFFB6F6F);
  static const Color onError = Color(0xFFD32F2F);
  static const Color surface = Color(0xFFD9D9D9);
  static const Color onSurface = Color(0xFFF7C417);
  static const Color onTertiaryContainer = Color(0xFF5AAC76);
  static const Color tertiaryContainer = Color(0xFFFF7753);
  static const Color primaryContainer = Color(0xFF26315E);
  static const Color secondaryContainer = Color.fromARGB(78, 255, 255, 255);
  static const Color onPrimaryContainer = Color(0xFF817DF6);
  static const Color outline = Color(0xFFFFD5B9);
  static const Color outlineVariant = Color(0xFFADE0FF);

  static const Color attendancePresent = Color(0xFF5AAC76);
  static const Color attendanceAbsent = Color(0xFFFB6F6F);
  static const Color attendanceEmpty = Color(0xFFD9D9D9);
}

class AppTextConst {
  static const login = 'Login';
  static const email = 'Email';
  static const password = 'Password';
  static const forgotPassword = 'Forgot Password?';

  //main menu
  static const grade = 'Grade';
  static const attendance = 'Attendance';
  static const schedule = 'Schedule';
  static const assigments = 'Assigments';

  //pages names
  static const home = 'Home Page';

  //drawer items
  static const personalData = 'Personal Data';
  static const addresses = 'Addresses';
  static const emailAdress = 'Email Address';
  static const phoneNumber = 'Phone Number';
  static const languages = 'Languages';
  static const licenses = 'Licenses';
  static const publications = 'Publications';
  static const emergencyContacts = 'Emergency Contacts';
  static const appSettings = 'App Settings';
  static const logout = 'Logout';
  static const settings = 'Settings';

  static const search = 'Search';

  static const chat = 'Chat';
  static const chatInfoPage = 'Chat Info Page';
  static const message = 'Message';
  static const selectCourse = 'Select Course';
  static const viewCoursesStudents = 'View Course\'s Students';
  static const viewStudents = 'View Students';
  static const courses = 'Courses';
  static const gradeDetailPage = 'Grade Detail Page';
  static const addGradePage = 'Add Grade Page';
  static const addAttandancePage = 'Add Attandance Page';

  static String phoneNumberDescription =
      "Your current phone number is displayed below. You can easily update it by tapping the \"Edit\" button. Please ensure your number is correct to stay connected. ";
  static String addressesDescriprion =
      "Your saved addresses are listed below for easy access and updates. You can add a new address or edit existing ones by long pressing the respective address. Keeping your addresses up-to-date ensures smooth deliveries and communication.";
  static String personalDataDescriprion =
      "Your saved personal information is listed down below.Each name has associated a type reprezenting the name's indicative.";

  static String add = 'Add';
  static String fatherName = 'Father name';
  static String userName = 'Your name';
  static String motherName = 'Mother name';

  static String addAddresses = "Add a new Address";

  static var newAddress = "New Address";

  static String noAddressesFound = "No addresses found";

  static String courseGrade = "Course Grade";
  static String labGrade = "Laboratory Grade";

  static String courseAttandance = "Course attendance:";
  static String labAttendance = "Laboratory attendance:";

  static String invalidNumber = "Numbers that you have submitted are invalid";
  static String emptyNumber = "You must enter numbers";
}

class AppStringFailuresMessages {
  static const String networkError = 'Network error occurred.';
  static const String serverError = 'Server error occurred.';
  static const String invalidCredentials = 'Invalid credentials.';
  static const String emailAlreadyExists = 'Email already exists.';
  static const String emailNotFound = 'Email not found.';
  static const String passwordTooShort =
      'Password should be at least 6 characters long.';
  static const String passwordMismatch = 'Passwords do not match.';
  static const String unknownError = 'An unknown error occurred.';
  static const String userNotFound = 'User not found.';
  static const String wrongPassword = 'Wrong password.';
}

//route const
class AppRouteConst {
  static const String login = '/';
  static const String home = '/home';
  static const String splash = '/splash';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';

  static const String grades = '/grades';
  static const String gradeDetailPage = '/gradeDetailPage';

  // static const String attendance = '/attendance';
  static const String attendanceDetailPage = '/attendanceDetailPage';

  static const String schedule = '/schedule';

  static const String assignments = '/assignments';
  static const String assigmentInfoPage = '/AssigmentInfoPage';

  static const String chat = '/chat';
  static const String chatInfoPage = '/chatInfoPage';
  static const String addChat = '/addChat';

  static const String eventsHomePage = '/eventsHomePage';

  static const String adresses = '/adresses';

  static const String personalData = '/personalData';

  static const String viewStudents = '/viewStudents';
  static const String viewSubmissions = '/viewSubmissions';

  static const String addGrade = '/addGrade';
  static const String addAttandance = '/addAttandance';

  static const String coursesPage = '/coursesPage';

  static const String addCourse = '/addCourse';
}

class AppImages {
  static const String image1 = 'assets/images/1.png';
  static const String man = 'assets/images/man.png';
  static const String woman = 'assets/images/woman.png';
  static const String usv = 'assets/images/usv.png';
  static const String hartaCampus = 'assets/images/Harta Campus.png';
}

class AppErrorMessages {
  static const String noCoursesFound = "No courses found";
  static const String noGradeFound = "No grade found";

  static const String ups = "Ups, something went wrong";
  static const String firebaseError = "Ups, something went wrong with Firebase";
}

class AppFields {
  //grade

  static const String id = 'id';
  static const String studentId = 'StudentId';
  static const String courseGrade = 'CourseGrade';
  static const String labGrade = 'LabGrade';
  static const String courseId = 'CourseId';
  static const String semesterId = 'SemesterId';
  static const String name = "Name";
  static const String isActive = 'IsActive';

  static const String classType = "ClassType";
  static const String dayOfWeek = "DayOfWeek";
  static const String startingHour = "StartingHour";
  static const String endingHour = "EndingHour";
  static const String numberOfCourses = "NumberOfCourses";
  static const String teacher = "Teacher";
  static const String teacherId = "TeacherId";
  static const String assistentId = "AssistentId";
  static const String courseFrequency = "CourseFreq";
  static const String semester = "Semester";
  static const String semesterNumber = "SemesterNumber";
  static const String courseCredits = "CourseCredits";
  static const String schedule = "Schedule";

  //messaje
  static const String text = 'Text';
  static const String senderId = 'SenderId';
  static const String reciverId = 'ReciverId';
  static const String timeWhenSent = 'TimeWhenSent';

  //contacts
  static const String status = 'Status';
  static const String senderName = 'SenderName';
  static const String reciverName = 'ReciverName';
  static const String person1 = 'Person1';
  static const String person2 = 'Person2';

  //events
  static const String departamentId = 'DepartamentId';
  static const String title = 'Title';
  static const String startTime = 'StartTime';
  static const String endTime = 'EndTime';
  static const String classWhereHeld = 'ClassWhereHeld';
  static const String supporterName = 'SupporterName';

  static const String courseAttendance = 'CourseAttendance';
  static const String labortoryAttendance = 'LaboratoryAttendance';

  static const String description = 'Description';

  static const String contactId = 'ContactId';

  static const String email = "Email";

  static const String userId = "UserId";

  static const String address = "Address";

  static const String phoneNumber = "Phone Number";

  static const String fatherName = "FatherName";

  static const String motherName = "MotherName";

  static const String assigmentId = "AssigmentId";
  static const String downloadUrl = "DownloadUrl";
  static const String postDate = "PostDate";
  static const String endingTime = "EndingTime";
}

class AppArguments {
  static const gradeEntity = "GradeEntity";
  static const courseEntity = "CourseEntity";
  static const attendanceEntity = "AttendanceEntity";
  static const contactEntity = "ContactEntity";
  static const assigmentEntity = "AssigmentEntity";

  static const String courseId = "CourseId";
  static const String assigmentId = "CourseId";
  static const String semesterId = "SemesterId";

  static const String studentEntity = "StudentEntity";

  static const String isTeacher = "IsTeacher";

  static const String clickType = "ClickType";

  static const String courseLenght = "CourseLenght";

  static const String userEntity = "UserEntity";
  static const String password = "Password";
  static const String departament = "Departament";
}

class AppCollections {
  static const gradeCollection = 'Grade';
  static const attendanceCollection = 'Attendance';
  static const assignmentCollection = 'Assignment';
  static const courseCollection = 'Course';
  static const semesterCollection = 'Semester';
  static const semesterXStudentCollection = 'SemesterXStudent';
  static const departamentXTeacher = 'DepartamentXTeacher';
  static const departament = 'Departament';

  static const String teacher = 'Teacher';
  static const String student = 'Student';
  static const String message = 'Message';
  static const String contacts = 'Contacts';
  static const String events = 'Events';

  static String addresses = "Addresses";

  static String submission = "Submission";
}

enum ContactsStatus { active, pending, inactive }

enum SelectedType { teacher, student, none }

extension ContactsStatusToString on ContactsStatus {
  String get stringValue {
    switch (this) {
      case ContactsStatus.active:
        return 'Active';
      case ContactsStatus.pending:
        return 'Pending';
      case ContactsStatus.inactive:
        return 'Inactive';

      default:
        return '';
    }
  }
}

extension StringToContactsStatus on String {
  ContactsStatus? toContactsStatus() {
    switch (toLowerCase()) {
      case 'active':
        return ContactsStatus.active;
      case 'pending':
        return ContactsStatus.pending;
      case 'inactive':
        return ContactsStatus.inactive;
      default:
        return null;
    }
  }
}

class DaysOfWeek {
  static const String luni = 'Luni';
  static const String marti = 'Marti';
  static const String miercuri = 'Miercuri';
  static const String joi = 'Joi';
  static const String vineri = 'Vineri';
  static const String sambata = 'Sambata';
  static const String duminica = 'Duminica';
}

enum ProfesorType { teacher, assistent, both, none }

enum ClickType { grade, attendance }

enum AttendanceStatus { present, absent, empty }

extension AttendanceStatusToString on AttendanceStatus {
  String get stringValue {
    switch (this) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.empty:
        return 'Empty';

      default:
        return '';
    }
  }
}

extension StringToAttendanceStatus on String {
  AttendanceStatus get toAttendanceStatus {
    switch (toLowerCase()) {
      case 'present':
        return AttendanceStatus.present;
      case 'absent':
        return AttendanceStatus.absent;
      case 'empty':
        return AttendanceStatus.empty;
      default:
        return AttendanceStatus.present;
    }
  }
}

enum ClassType { course, laboratory }

extension ClassTypeToString on ClassType {
  String get stringValue {
    switch (this) {
      case ClassType.course:
        return 'Course';
      case ClassType.laboratory:
        return 'Laboratory';

      default:
        return '';
    }
  }
}

extension StringToClassType on String {
  ClassType get toClassType {
    switch (toLowerCase()) {
      case 'course':
        return ClassType.course;
      case 'laboratory':
        return ClassType.laboratory;
      default:
        return ClassType.course;
    }
  }
}

enum CourseFrequency { saptamaniPare, saptamaniImpare, toateSaptamanile }

extension CourseFrequencyToString on CourseFrequency {
  String get stringValue {
    switch (this) {
      case CourseFrequency.saptamaniPare:
        return 'Saptamani pare';
      case CourseFrequency.saptamaniImpare:
        return 'Saptamani impare';
      case CourseFrequency.toateSaptamanile:
        return 'Toate saptamanile';
      default:
        return '';
    }
  }
}

extension StringToCourseFrequency on String {
  CourseFrequency? toCourseFrequency() {
    switch (toLowerCase()) {
      case 'saptamani pare':
        return CourseFrequency.saptamaniPare;
      case 'saptamani impare':
        return CourseFrequency.saptamaniImpare;
      case 'toate saptamanile':
        return CourseFrequency.toateSaptamanile;
      default:
        return null;
    }
  }
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

extension DayOfWeekToString on DayOfWeek {
  String get stringValue {
    switch (this) {
      case DayOfWeek.monday:
        return 'Monday';
      case DayOfWeek.tuesday:
        return 'Tuesday';
      case DayOfWeek.wednesday:
        return 'Wednesday';
      case DayOfWeek.thursday:
        return 'Thursday';
      case DayOfWeek.friday:
        return 'Friday';
      case DayOfWeek.saturday:
        return 'Saturday';
      case DayOfWeek.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}

extension StringToDayOfWeek on String {
  DayOfWeek? toDayOfWeek() {
    switch (toLowerCase()) {
      case 'monday':
        return DayOfWeek.monday;
      case 'tuesday':
        return DayOfWeek.tuesday;
      case 'wednesday':
        return DayOfWeek.wednesday;
      case 'thursday':
        return DayOfWeek.thursday;
      case 'friday':
        return DayOfWeek.friday;
      case 'saturday':
        return DayOfWeek.saturday;
      case 'sunday':
        return DayOfWeek.sunday;
      default:
        return null;
    }
  }
}
