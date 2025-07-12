import 'dart:developer';

import 'package:get/get.dart';

class ApiMessageTranslator {
  static final Map<String, Map<String, String>> messages = {
    'email or password is incorrect !! ': {
      'ar': 'كلمة المرور غير صحيحة !',
      'en': 'password is incorrect !',
    },
    'User not found': {
      'ar': 'لم يتم العثور على المستخدم',
      'en': 'User not found',
    },
    'We sent a code to your email. If you do not receive a code, the email may not match an existing account.': {
      'ar':
          'لقد أرسلنا رمزًا إلى بريدك الإلكتروني. إذا لم تستلم الرمز، فقد لا يتوافق البريد الإلكتروني مع حسابك الحالي.',
      'en':
          'We sent a code to your email. If you do not receive a code, the email may not match an existing account',
    },
    'this password is already used': {
      'ar': 'تم استخدام كلمة المرور هذه بالفعل',
      'en': 'this password is already used',
    },
  };

  static String translate(String message) {
    log('${Get.locale?.languageCode}');
    return messages[message]?[Get.locale?.languageCode ?? 'en'] ?? message;
  }
}
