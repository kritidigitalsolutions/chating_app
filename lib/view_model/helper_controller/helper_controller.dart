import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  final RxString email = ''.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      // Required in v7+
      await _googleSignIn.initialize(
        // Optional: serverClientId if you're using server-side validation
        // serverClientId: 'your-web-client-id.apps.googleusercontent.com',
      );
    } catch (e) {
      print("Google Sign-In initialization failed: $e");
      Get.snackbar('Error', 'Failed to initialize Google Sign-In');
    }
  }

  Future<void> signInAndShowEmail() async {
    isLoading.value = true;

    try {
      // Optional: force account chooser by signing out first
      // await _googleSignIn.signOut();

      // Main sign-in call (shows UI if needed)
      final GoogleSignInAccount? account = await _googleSignIn.authenticate();

      if (account != null) {
        email.value = account.email;
        print("Signed in: ${account.email} – ${account.displayName}");
        // Optional: Get auth tokens if needed (for Firebase, backend, etc.)
        // final auth = await account.authentication;
        // print("ID Token: ${auth.idToken}");
      } else {
        print("Sign-in cancelled by user");
      }
    } on GoogleSignInException catch (e) {
      print("Google Sign-In Exception: ${e.toString()} – code: ${e.code}");
      Get.snackbar('Sign-In Failed', e.toString());
    } catch (e) {
      print("Unexpected Google Sign-In Error: $e");
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  // Optional: sign out method
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      email.value = '';
    } catch (e) {
      print("Sign-out error: $e");
    }
  }
}
