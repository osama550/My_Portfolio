import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

/// Opens an external URL in the default browser/system viewer.
Future<void> launchExternalUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      log('Could not launch URL: $urlString');
    }
  } catch (e, stackTrace) {
    log('Error launching URL: $e', stackTrace: stackTrace);
  }
}
