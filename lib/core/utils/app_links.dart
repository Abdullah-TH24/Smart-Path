abstract class AppLinks {
  // Should be edit
  static final String _ip = '26.226.197.122';

  static final String _mainLink = 'http://$_ip:8000/api';

  // Login Links
  static final String login = '$_mainLink/login';

  static final String confirmForgetPasswordOtp =
      '$_mainLink/confirmForgetPasswordOtp';

  static final String sendForgetPasswordOtp =
      '$_mainLink/sendForgetPasswordOtp';

  static final String resetPassword = '$_mainLink/resetPassword';

  static final String logout = '$_mainLink/logout';

  // Auth Links
  static final String createOrUpdatePinCode =
      '$_mainLink/createOrUpdatePinCode';

  static final String checkPinCode = '$_mainLink/checkPinCode';

  static final String deletePinCode = '$_mainLink/deletePinCode';

  // Main Home Links
  static final String homepage = '$_mainLink/getUserInfo';

  static final String events = '$_mainLink/getAllPublishedEvents';

  static final String comments = '$_mainLink/getEventComments';

  static final String addComments = '$_mainLink/addComment';

  static final String deleteComments = '$_mainLink/deleteComment';

  static final String editComments = '$_mainLink/editComment';

  static final String addReaction = '$_mainLink/react';

  static final String getReactions = '$_mainLink/getReactions';

  static final String reportComment = '$_mainLink/reportComment';

  // Home Components Links
  static final String weeklySchedule = '$_mainLink/getStudentWeeklySchedule';

  static final String grades = '$_mainLink/studentGetResult';

  static final String classes = '$_mainLink/getStudentTeachersAndMates';

  // static final String examSchedule = '$_mainLink/... TODO';

  //librarian api's
  static final String getBooks = '$_mainLink/showBooks';
  static final String addBook = '$_mainLink/createBook';
  static final String updateBook = '$_mainLink/updateBook/';
  static final String deleteBook = '$_mainLink/deleteBook/';
  static final String getBorrowOrders = '$_mainLink/getBorrowOrder/';
  static final String borrowBook = '$_mainLink/borrow/';
  static final String modifyBorrow = '$_mainLink/modifyBorrow/';

  //global api's
  static final String sendComplaint = '$_mainLink/addComplaint';
  static final String getUserComplaints = '$_mainLink/getMyComplaints';
  static final String deleteComplaint = '$_mainLink/deleteComplaint/';
  static final String editComplaint = '$_mainLink/updateComplaint';
}
