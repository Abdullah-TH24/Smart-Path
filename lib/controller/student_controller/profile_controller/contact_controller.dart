import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
  await launchUrl(launchUri, mode: LaunchMode.externalApplication);
}

Future<void> sendEmail(String emailAddress) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
    query: encodeQueryParameters(<String, String>{'subject': 'School Inquiry'}),
  );
  await launchUrl(launchUri, mode: LaunchMode.externalApplication);
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map(
        (e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
      )
      .join('&');
}

Future<void> openWebsite(String url) async {
  final Uri launchUri = Uri.parse(url);
  await launchUrl(launchUri, mode: LaunchMode.externalApplication);
}

Future<void> openFacebook(String url) async {
  final Uri launchUri = Uri.parse(url);
  await launchUrl(launchUri, mode: LaunchMode.externalApplication);
}
