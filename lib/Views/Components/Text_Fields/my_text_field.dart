import 'package:pl/imports.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.validator,
    required this.controller,
    required this.inputType,
    required this.label,
    required this.maxLines,
  }) : super(key: key);

  final FormFieldValidator validator;
  final TextEditingController controller;
  final TextInputType inputType;
  final int? maxLines;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required!';
        } else {
          return null;
        }
      },
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
