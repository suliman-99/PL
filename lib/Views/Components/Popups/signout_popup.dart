import 'package:pl/imports.dart';

class SignOutPopUp extends StatelessWidget {
  const SignOutPopUp({Key? key,required this.loggingModel}) : super(key: key);

  final LoggingModel loggingModel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sign Out'),
      content: const Text('Are you Suer You Want To Sign Out ?!'),
      actions: [
        ElevatedButton(
          child: const Text('Sign Out'),
          onPressed: () async {
            LoggingController.signOut();
            Get.offAll(const SignInPage());
          },
        ),
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
