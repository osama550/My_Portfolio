import 'cv_downloader_stub.dart'
    if (dart.library.html) 'cv_downloader_web.dart'
    if (dart.library.io) 'cv_downloader_mobile.dart';

/// Triggers platform-specific download of the CV PDF asset.
///
/// On Web: Directly downloads the file via an anchor tag.
/// On Mobile: Copies the asset to temporary storage and triggers the native share sheet.
Future<void> downloadAndSaveCV() async {
  await downloadCV();
}
