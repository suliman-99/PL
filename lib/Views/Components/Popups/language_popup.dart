import 'package:pl/imports.dart';

class LanguagePopup extends StatelessWidget {
  const LanguagePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Language : '),
      actions: [
        ElevatedButton(
          child: const Text('Arabic'),
          onPressed: (){
            Get.back();
          },
        ),
        ElevatedButton(
          child: const Text('English'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
