// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

Future<void> downloadCV() async {
  // On Flutter Web, assets are served at assets/assets/...
  const assetPath = 'assets/assets/pdf/Osama_Kamel_Abdelrahman_FlowCV_Resume_2026-05-04.pdf';
  final anchor = html.AnchorElement(href: assetPath)
    ..target = '_blank'
    ..download = 'Osama_Kamel_CV.pdf';
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
