import 'package:pl/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyAppContent();
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0xff014962),
                onPrimary: Colors.white,
                secondary: Color(0xff014962),
                onSecondary: Colors.white,
                surface: Color(0xff014962),
                onSurface: Colors.white,
                error: Colors.white,
                onError: Colors.white,
                background: Colors.white,
                onBackground: Color(0xff08b4c8),
              ),
            ),
            home: FutureBuilder(
              future: LoggingController.getLoggingModel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if ((snapshot.data as LoggingModel).isLoggedIn) {
                    return AllProductsPage(
                      loggingModel: (snapshot.data as LoggingModel),
//                       productList: [
//                         ProductModel.defaultInit(),
//                         ProductModel.defaultInit(),
//                         ProductModel(
//                           id: 1,
//                           owner: ForeignUserModel.defaultInit(),
//                           image:
//                               'https://static5.depositphotos.com/1021974/458/i/950/depositphotos_4587034-stock-photo-illustration-laptop-computer-magnify-glass.jpg',
//                           name: 'E570 ThinkPad Laptop sssssssssssssssssssssss',
//                           type: 'Lenovo',
//                           eDate: '1/1/2022',
//                           amount: '30',
//                           price: '700\$',
//                           connectInfo: '''
// Phone Number : 0923456789
// Facebook : Lenovo.sy
//           ''',
//                           iLike: false,
//                           views: 999,
//                           likes: 999,
//                           commentsList: [
//                             CommentModel.defaultInit(),
//                             CommentModel.defaultInit(),
//                             CommentModel.defaultInit(),
//                             CommentModel.defaultInit(),
//                             CommentModel.defaultInit(),
//                             CommentModel.defaultInit(),
//                             CommentModel.defaultInit(),
//                           ],
//                         ),
//                       ],
                    );
                  } else {
                    return const SignInPage();
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ));
      },
    );
  }
}




  String ip = '192.168.162.76';


