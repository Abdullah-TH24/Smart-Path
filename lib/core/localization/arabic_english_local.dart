import 'package:get/get.dart';
import 'package:smartpath/core/utils/general_utils/app_texts.dart';

class ArabicEnglishLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      'app_name': AppTexts.appNameEn,
      // For introduction_pages
      'introduction_title': 'Welcome to Smart Path!',
      'introduction_content_0': 'You are in the right place',
      'introduction_content_1': 'Be with us on the amazing path',
      'introduction_content_2': 'This app will make anything very easy to use',
      // For login
      'sign_in': 'Sign In',
      'sign_in_desc': 'Hi there! Nice to see you again',
      'email': 'E-mail',
      'email-valid_empty': 'Email cannot be empty',
      'email-valid_weak': 'Email is invalid',
      'password': 'Password',
      'password_valid_empty': 'Password cannot be empty',
      'password_valid_weak': 'Password is too weak',
      'forgot_password': 'Forgot Password',
      // For reset password
      'reset_tite': 'Reset Password',
      'reset_desc': 'Please enter your password',
      'password_reset': 'Password',
      'password_confirm_reset': 'Confirm password',
    }, // TODO here will put English translation
    "ar": {
      'app_name': AppTexts.appNameAr,
      // For introduction_pages
      'introduction_title': 'مرحباً بكم في المسار الذكي!',
      'introduction_content_0': 'أنت في المكان المناسب',
      'introduction_content_1': 'كن معنا في الطريق المذهل',
      'introduction_content_2': 'سيجعل هذا التطبيق أي شيء سهل الاستخدام للغاية',
      // For login
      'sign_in': 'تسجيل الدخول',
      'sign_in_desc': 'مرحباً! سررت برؤيتك مجدداً',
      'email': 'البريد إلكتروني',
      'email-valid_empty': 'لا يمكن أن يكون البريد الإلكتروني فارغًا',
      'email-valid_weak': 'البريد الإلكتروني غير صالح',
      'password': 'كلمة السر',
      'password_valid_empty': 'لا يمكن أن تكون كلمة المرور فارغة',
      'password_valid_weak': 'كلمة المرور ضعيفة جدًا',
      'forgot_password': 'هل نسيت كلمة السر',
      // For reset password
      'reset_tite': 'إعادة تعيين كلمة المرور',
      'reset_desc': 'الرجاء إدخال كلمة المرور الخاصة بك',
      'password_reset': 'كلمة المرور',
      'password_confirm_reset': 'تأكيد كلمة المرور',
    }, // TODO here will put Arabic translation
  };
}
