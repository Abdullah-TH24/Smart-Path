import 'dart:developer';

import 'package:get/get.dart';

class ApiMessageTranslator {
  static final Map<String, Map<String, String>> messages = {
    'Email & Password does not match with our record.': {
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
    'the comment has been reported !!': {
      'ar': 'لقد تم الإبلاغ عن التعليق بالفعل!',
      'en': 'The comment has already been reported!',
    },
    'the comment has been reported successfully !!': {
      'ar': 'تم الإبلاغ عن التعليق بنجاح',
      'en': 'Comment reported successfully',
    },
  };

  static String translate(String message) {
    log('${Get.locale?.languageCode}');
    return messages[message]?[Get.locale?.languageCode ?? 'en'] ?? message;
  }
}
