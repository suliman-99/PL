import 'package:pl/imports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var key = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  NameField(nameController: nameController),
                  const SizedBox(
                    height: 40,
                  ),
                  EmailField(emailController: emailController),
                  const SizedBox(
                    height: 40,
                  ),
                  PasswordField(
                    passwordController: passwordController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ConfirmPasswordField(
                    passwordController: passwordController,
                    confirmPasswordController: confirmpasswordController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          String name = nameController.text;
                          String email = emailController.text;
                          String password = passwordController.text;

                          dynamic res =
                              await LoggingController.signUp(name,email, password);

                          if (res is LoggingModel ) {


                            Get.offAll(
                              AllProductsPage(
                                loggingModel: res,
                                // productList: [
                                //   ProductModel.defaultInit(),
                                //   ProductModel.defaultInit(),
                                //   ProductModel.defaultInit(),
                                //   ProductModel.defaultInit(),
                                // ],
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(res),
                              ),
                            );
                            setState(() {});
                          }
                        } else {
                          setState(() {});
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Have Account ?'),
                      TextButton(
                          onPressed: () {
                            Get.offAll(const SignInPage());
                          },
                          child: const Text('Sign in')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
