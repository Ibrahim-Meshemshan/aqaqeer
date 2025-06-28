import '../../../injection/injection.dart';
import '../../storage/cash_helper.dart';
import '../strings.dart';

class AppUrl {

  static String get getCustomer => 'https://automata4.app/api/project-settings';

  static String get deleteAccount => '$baseUrl/delete-my-account';

  static String get baseUrl => locator.get<CashHelper>().getString(AppStrings.BASE_URL_KEY)??'';

  static String get chatUrl =>
      locator.get<CashHelper>().getString('chatUrl') ?? '';

  static String get objectID =>
      locator.get<CashHelper>().getString('objectID') ?? '';

  static String get chatSocketUrl =>
      locator.get<CashHelper>().getString('chatSocketUrl') ?? '';

  /// Login
  static String get login => '$baseUrl/user/auth/login';

  /// Home
  static String get getNews => '$baseUrl/nws/news/getNewsByCategory';

  /// Services

  static String get permission => '$baseUrl/user/auth/permissions?new';

  static String get filterStudyLevel => '$baseUrl/kat/classes/getStudyLevels';

  static String get filterCourses => '$baseUrl/kat/classes/getCourses';

  /// Profile
  static String get getProfileByToken => '$baseUrl/hrs/corporate/get_job_employees';

  static String get getChangePassword => '$baseUrl/user/auth/change_password';

  static String get getSaveFcmToken => "$baseUrl/ann/announcement/saveUserToken";

  static String get deletFcmToken =>
      '$baseUrl/ann/announcement/deleteUserToken';

  /// STE
  static String get getClasses => '$baseUrl/kat/studentAbsence/getUserClasses';

  static String get getAbsenceTypes =>
      '$baseUrl/kat/studentAbsence/getAbsenceTypes';

  static String get getStudentAttend =>
      '$baseUrl/kat/studentAbsence/getClassStudentShouldAttend';

  static String get saveStudentAbsent =>
      '$baseUrl/kat/studentAbsence/saveStudentAbsent';

  /// SOC
  static String get getEncyclopediaType =>
      '$baseUrl/kat/referenceRasUser/get_encyclopedia_type';

  static String get uploadContent =>
      '$baseUrl/kat/referenceRasUser/uploadReference';

  static String get isCanUploadReference =>
      '$baseUrl/kat/referenceRasUser/isCanUploadReferance';

  /// SCT
  static String get getNotes => '$baseUrl/kat/profiles/getStudentNotes';

  static String get saveNotes => '$baseUrl/kat/profiles/saveStudentNote';

  static String get getClassSchedule =>
      '$baseUrl/kat/classes/getClassScheduleRas';

  static String get getGivenToday =>
      '$baseUrl/kat/classes/getClassScheduleLessonsGiven';

  static String get getHomeWork =>
      '$baseUrl/kat/classes/getClassScheduleLessonsAssignments';

  static String get manageClassScheduleLessonsGiven =>
      '$baseUrl/kat/classes/manageClassScheduleLessonsGiven';

  static String get manageClassScheduleHomeWork =>
      '$baseUrl/kat/classes/manageClassScheduleLessonAssignment';

  static String get getStudentAcademicCommunication =>
      '$baseUrl/kat/profiles/getStudentAcadimicAndCommunication';

  /// TSC
  static String get FilterClassDivision => '$baseUrl/kat/classes/getClasses';

  static String get FilterPeriod => '$baseUrl/kat/classes/getPeriods';

  static String get getInstructor =>
      '$baseUrl/kat/classes/getCourseInstructors';

  static String get saveTestName => '$baseUrl/kat/tests/saveTestName';

  static String get getTestName => '$baseUrl/kat/v2/tests/getTestNames';

  static String get getMarkTestName => '$baseUrl/kat/tests/getTestNameStudents';

  static String get saveTestDetails => '$baseUrl/kat/tests/saveTestDetails';

  static String get getTestGrades => '$baseUrl/kat/v2/tests/getTestGrades';

  static String get closeTest => '$baseUrl/kat/tests/closeTestName';

  static String get notifyTestNameResults =>
      '$baseUrl/kat/tests/notifyTestNameResults';

  static String get getTestNameCategories =>
      '$baseUrl/kat/tests/getTestNameCategories';

  /// SCS
  static String get getInstructorsAttendance =>
      '$baseUrl/kat/administration/getInstructorsAttendance';

  static String get getStudentAllCourseChart =>
      '$baseUrl/kat/students/getStudentAllCourseChart';

  /// CHA
  static String get authApi => chatUrl + '$baseUrl/api/broadcasting/auth';

  static String get openNewChat => '$baseUrl/cha/chat/openNewChatRasUser';

  static String get getStudents => '$baseUrl/cha/chat/getKatStudentsForRasUser';

  static String get getParents => '$baseUrl/cha/chat/getKatParentsForRasUser';

  static String get getChatTopics => '$baseUrl/cha/chat/getChatTopics';

  static String get getChatPriorities => '$baseUrl/cha/chat/getChatPriorities';

  static String get getChatStatus => '$baseUrl/cha/chat/getChatStatus';

  static String get getChats => '$baseUrl/cha/chat/getChats';

  static String get sendChatMessage => '$baseUrl/cha/chat/sendChatMessage';

  static String get getChatMessages => '$baseUrl/cha/chat/getChatMessages';

  static String get deleteChatMessage => '$baseUrl/cha/chat/deleteChatMessage';

  static String get closeChats => '$baseUrl/cha/chat/closeChat';

  static String get readChatMessage => '$baseUrl/cha/chat/readChatMessage';

  /// Notifications
  static String get getNotification =>
      '$baseUrl/ann/announcement/getUserAnnouncements';

  static String get getNotificationUserType =>
      '$baseUrl/ann/announcement/getUserAnnouncementTypeMethods';

  static String get getNotificationType =>
      '$baseUrl/ann/announcement/getAnnouncementTypes';

  static String get saveNotificationType =>
      '$baseUrl/ann/announcement/saveUserAnnouncementTypeMethods';

  static String get updateNotifier =>
      '$baseUrl/ann/announcement/updateUserAnnouncementRead';

  static String get unReadNotification =>
      '$baseUrl/ann/announcement/getUserAnnouncementsStatistic';

  static String get sendError => 'https://automata4.app/api/errors';
}
