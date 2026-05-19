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

/// Opens the default email client with a specified email address.
Future<void> launchEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  try {
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      log('Could not launch email: $email');
    }
  } catch (e, stackTrace) {
    log('Error launching email: $e', stackTrace: stackTrace);
  }
}

/// Initiates a phone call to the specified phone number.
Future<void> launchPhone(String phoneNumber) async {
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  try {
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
    } else {
      log('Could not launch phone: $phoneNumber');
    }
  } catch (e, stackTrace) {
    log('Error launching phone: $e', stackTrace: stackTrace);
  }
}

