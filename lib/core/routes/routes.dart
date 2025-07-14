import 'package:flutter/material.dart';

import '../../feature/root/splash_screen.dart';
class Routes {
  Routes._();

  //static variables
  static const String splash = 'root/splash';

  ///login
  static const String loginInScreen = 'feature/auth/login';

  /// main pages
  static const String mainRootPage = '/root/';

  /// home page
  static const String homeScreen = 'feature/home/homeScreen';

  /// Profile Pages
  static const String profileDetail =
      '/app/profile/presentation/ui/screen/details/profile_contact/profile_detail_screen';
  static const String profileContact =
      '/app/profile/presentation/ui/screen/details/profile_contact/profile_contact_screen';
  static const String profileFunction =
      '/app/profile/presentation/ui/screen/details/profile_contact/profile_function_screen';
  static const String profileFinancial =
      '/app/profile/presentation/ui/screen/details/profile_contact/profile_financial_screen';

  /// notification
  static const String notificationScreen = '/app/notification';
  static const String resetPassSection = '/app/reset';

  ///service
  ///solution one:resource management,packages is >warehouse
  static const String resourceManagement = '/service/solution/';
  static const String wareHousesSetting =
      '/service/solution/resourceManagement/package';

  ///solution two:student life support,packages are> transportation
  static const String studentLifeSupport =
      '/service/solution/studentLifeSupport';
  static const String transportScreen = '/service/solution/transport/';

  ///wrh, screens
  static const String addAttributeScreen = '/service/solution/package';

  static const String studentsInformationSystem =
      '/service/solution/studentsInformationSystem';
  static const String studentInformationSystemTabs =
      '/service/solution/studentsInformationSystem/tab';
  static const String lectures =
      '/service/solution/studentsInformationSystem/lecture';
  static const String todayLectures =
      '/service/solution/studentsInformationSystem/todayLecture';
  static const String studentAbsenceDetails =
      '/service/solution/studentsInformationSystem/studentAbsenceDetails';
  static const String courses =
      '/service/solution/studentsInformationSystem/courses';
  static const String studentAddMarkTable =
      'lib/features/services/solutions/tsc/presentation/widget/student_add_mark_table.dart';
  static const String packageTestPage =
      'lib/features/services/services_widgets/package_test_page.dart';
  static const String addStudentMark =
      "lib/features/services/solutions/tsc/presentation/screen/add_mark_test_screen.dart";
  static const String testSchoolScreen =
      "lib/features/services/solutions/tsc/presentation/screen/testSchoolScreen.dart";



  // static final routes = <String, WidgetBuilder>{
  //   splash: (BuildContext context) =>  SplashScreen(),
  //   loginInScreen: (BuildContext context) => const LoginBody(),
  //   mainRootPage: (BuildContext context) => const RootScreen(),
  //   //profile
  //   profileDetail: (BuildContext context) => const ProfileDetailScreen(),
  //   profileContact: (BuildContext context) => const ProfileContactScreen(),
  //   profileFunction: (BuildContext context) => const ProfileFunctionScreen(),
  //   profileFinancial: (BuildContext context) => ProfileFinancialScreen(),
  //   notificationScreen: (BuildContext context) => const NotificationScreen(),
  //   resetPassSection: (BuildContext context) => const ChangePasswordScreen(),
  //   resourceManagement: (BuildContext context) => const ResourceManagement(),
  //   wareHousesSetting: (BuildContext context) => const WareHouseSetting(),
  //   studentLifeSupport: (BuildContext context) => const StudentLifeSupport(),
  //   addAttributeScreen: (BuildContext context) => const AddAttributeScreen(),
  //   transportScreen: (BuildContext context) => const TransportScreen(),
  //   studentsInformationSystem: (BuildContext context) =>
  //       const StudentsInformationSystemScreen(),
  //   studentInformationSystemTabs: (BuildContext context) =>
  //       const StudentsInformationSystemTabs(),
  //   lectures: (BuildContext context) => const Lectures(),
  //   todayLectures: (BuildContext context) => const TodayLectures(),
  //   studentAbsenceDetails: (BuildContext context) =>
  //       const StudentAbsenceDetails(),
  //   courses: (BuildContext context) => const Courses(),
  //   testSchoolScreen: (BuildContext context) => SchoolTestScreen(),
  //   packageTestPage: (BuildContext context) => const PackageTestPage(),
  //   addStudentMark: (BuildContext context) => const AddMarkTest(),
  // };
}


