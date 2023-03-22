import 'package:pl/imports.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordField(
      {Key? key,
      required this.passwordController,})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Pleas Enter The Password .';
        } else if (value.length < 8) {
          return 'Pleas Enter password more then 8 Charachters';
        } else {
          return null;
        }
      },
      controller: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: invisible,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: const Icon(
          Icons.lock,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            (invisible) ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              invisible = !invisible;
            });
          },
        ),
      ),
    );
  }
}
