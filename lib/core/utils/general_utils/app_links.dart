abstract class AppLinks {
  // should be edit
  static final String _ip = '192.168.137.108';

  static final String _mainLink = 'http://$_ip:8000';

  // Auth links
  static final String login = '$_mainLink/api/login';

  static final String sendForgetPasswordOtp =
      '$_mainLink/api/sendForgetPasswordOtp';
}
