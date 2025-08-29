import 'package:get/get.dart';
import 'package:smartpath/view/complaint_global_view/send_complaint_page.dart';
import 'package:smartpath/view/librarian_view/librarian_setting_page.dart';
import 'package:smartpath/view/complaint_global_view/user_complaints_page.dart';
import 'package:smartpath/view/nurse_view/nurse_add_medical_file_page.dart';
import 'package:smartpath/view/nurse_view/nurse_all_medical_files_page.dart';
import 'package:smartpath/view/nurse_view/nurse_main_home_page.dart';
import 'package:smartpath/view/nurse_view/nurse_studens_search_page.dart';
import 'package:smartpath/view/nurse_view/nurse_update_medical_file_page.dart';

class NurseRoutes {
  static const String home = '/nurse/home';
  static const String mainHome = '/nurse/main_home';
  //
  static const String medicalFiles = '/nurse/medical_files';
  static const String addMedicalFiles = '/nurse/add_medical_files';
  static const String studentsSearch = '/nurse/students_search';
  static const String updateMedicalFile = '/nurse/update_medical_file';
  //
  static const String complaints = '/nurse/complaints';
  static const String userComplaints = '/nurse/user_complaints';
  static const String settings = '/nurse/settings';

  static final List<GetPage> routes = [
    GetPage(
      name: mainHome,
      transition: Transition.cupertinoDialog,
      page: () => const NurseMainHomePage(),
    ),
    GetPage(
      name: medicalFiles,
      transition: Transition.cupertinoDialog,
      page: () => const NurseAllMedicalFilesPage(),
    ),
    GetPage(
      name: addMedicalFiles,
      transition: Transition.cupertinoDialog,
      page: () => const NurseAddMedicalFilePage(),
    ),
    GetPage(
      name: updateMedicalFile,
      transition: Transition.cupertinoDialog,
      page: () => const NurseUpdateMedicalFilePage(),
    ),
    GetPage(
      name: studentsSearch,
      transition: Transition.cupertinoDialog,
      page: () => const NurseStudensSearchPage(),
    ),
    GetPage(
      name: complaints,
      transition: Transition.cupertinoDialog,
      page: () => const SendComplaintPage(),
    ),
    GetPage(
      name: userComplaints,
      transition: Transition.cupertinoDialog,
      page: () => const UserComplaintsPage(),
    ),
    GetPage(
      name: settings,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianSettingPage(),
    ),
  ];
}
