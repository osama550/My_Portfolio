import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> downloadCV() async {
  // Load PDF from local assets
  final byteData = await rootBundle.load(
    'assets/pdf/Osama_Kamel_Abdelrahman_FlowCV_Resume_2026-06-21.pdf',
  );

  // Write to temporary local storage
  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}/Osama_Kamel_CV.pdf');
  await file.writeAsBytes(
    byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );

  // Open native platform share/save drawer using the new share_plus 13+ API
  await SharePlus.instance.share(
    ShareParams(
      files: [XFile(file.path, mimeType: 'application/pdf')],
      subject: 'Osama Kamel CV',
    ),
  );
}
