import 'package:pl/imports.dart';
import 'package:http/http.dart' as http;

class LoggingController {

  static void setLoggingModel(LoggingModel model) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    shp.setBool('isLoggedIn', model.isLoggedIn);
    shp.setString('token', model.token);
    shp.setString('name', model.name);
    shp.setString('email', model.email);
  }

  static void deleteLoggingModel() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    shp.setBool('isLoggedIn', false);
    shp.setString('token', '');
    shp.setString('name', '');
    shp.setString('email', '');
  }

  static Future<LoggingModel> getLoggingModel() async {

    SharedPreferences shp = await SharedPreferences.getInstance();
    return LoggingModel(
      isLoggedIn: shp.getBool('isLoggedIn') ?? false,
      token: shp.getString('token') ?? '',
      email: shp.getString('email') ?? '',
      name: shp.getString('name') ?? '',
    );
  }

  static dynamic signUp(
    String name,
    String email,
    String password,
  ) async {
    String address = 'http://$ip:8000/api/register';
    Uri uri = Uri.parse(address);
    Map<String, Object> body = {
      "name": name,
      "email": email,
      "password": password,
    };
    http.Response response = await http.post(uri, body: body);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      String token = bodyJson['token'];

      LoggingModel loggingModel = LoggingModel(
        isLoggedIn: true,
        token: token,
        email: email,
        name: name,
      );

      LoggingController.setLoggingModel(loggingModel);

      return loggingModel;
    } else {
      return StatusCodeController.getString(response.statusCode);
    }
  }

  static dynamic signIn(
    String email,
    String password,
  ) async {
    String address = 'http://$ip:8000/api/login';
    Uri uri = Uri.parse(address);
    Map<String, Object> body = {
      "email": email,
      "password": password,
    };
    http.Response response = await http.post(uri, body: body);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      String token = bodyJson['token'];
      String name = bodyJson['name'];

      LoggingModel loggingModel = LoggingModel(
        isLoggedIn: true,
        token: token,
        email: email,
        name: name,
      );

      LoggingController.setLoggingModel(loggingModel);

      return loggingModel;
    } else {
      return StatusCodeController.getString(response.statusCode);
    }
  }

  static void signOut() async {
    LoggingController.deleteLoggingModel();
  }
}
