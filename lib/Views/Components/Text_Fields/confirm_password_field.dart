import 'package:pl/imports.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ConfirmPasswordField({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Pleas Enter The Password .';
        } else if (value.length < 8) {
          return 'Pleas Enter password more then 8 Charachters';
        } else if (widget.passwordController.text !=
            widget.confirmPasswordController.text) {
          return 'The Confirming Dosn\'t match .';
        } else {
          return null;
        }
      },
      controller: widget.confirmPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: invisible,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
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
