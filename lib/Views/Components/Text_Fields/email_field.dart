import 'package:pl/imports.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Pleas Enter The Email Adress .';
        } else if (!EmailValidator.validate(value)) {
          return 'Pleas Enter Correct Email Adress .';
        } else {
          return null;
        }
      },
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: const Icon(
          Icons.email,
        ),
      ),
    );
  }
}
