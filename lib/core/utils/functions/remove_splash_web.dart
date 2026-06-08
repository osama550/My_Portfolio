import 'dart:js_interop';
import 'dart:js_interop_unsafe';

/// Removes the CSS loading screen defined in web/index.html.
void removeSplashScreen() {
  try {
    globalContext.callMethod('removeLoadingScreen'.toJS);
  } catch (_) {
    // Silently ignore if the function is not available
  }
}
