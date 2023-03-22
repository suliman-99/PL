import 'package:pl/imports.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        final validatRegExp = RegExp(r'^[a-zA-Z]+$');
        if (value == null || value.isEmpty) {
          return 'Pleas Enter The Name .';
        } else if (!validatRegExp.hasMatch(value)) {
            return 'Pleas Enter Only Lower And Upper Case Charachters Only .';
        } else {
            return null;
        }
      },
      controller: nameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: const Icon(
          Icons.person,
        ),
      ),
    );
  }
}
