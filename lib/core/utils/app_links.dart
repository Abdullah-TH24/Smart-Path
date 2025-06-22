abstract class AppLinks {
  // should be edit
  static final String _ip = '192.168.68.169';

  static final String _mainLink = 'http://$_ip:8000';

  // Auth links
  static final String login = '$_mainLink/api/login';

  static final String confirmForgetPasswordOtp =
      '$_mainLink/api/confirmForgetPasswordOtp';

  static final String sendForgetPasswordOtp =
      '$_mainLink/api/sendForgetPasswordOtp';

  static final String resetPassword = '$_mainLink/api/resetPassword';

  // Home links
  static final String homepage = '$_mainLink/api/getInfo';
}
