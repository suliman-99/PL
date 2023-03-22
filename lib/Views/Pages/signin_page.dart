import 'package:pl/imports.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final key = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
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
                          String email = emailController.text;
                          String password = passwordController.text;

                          dynamic res =
                              await LoggingController.signIn(email, password);

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
                        'Sign in',
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
                      const Text('Don\'t have an Account ?'),
                      TextButton(
                        onPressed: () {
                          Get.offAll(const SignUpPage());
                        },
                        child: const Text('Regester Now'),
                      ),
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
