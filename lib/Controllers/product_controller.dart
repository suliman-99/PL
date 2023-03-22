import 'package:pl/imports.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ProductController {
  static Future<List<ProductModel>> getProducts(
      {required LoggingModel loggingModel}) async {
    String address = 'http://$ip:8000/api/getProducts';
    Uri uri = Uri.parse(address);
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + loggingModel.token
    };

    http.Response response = await http.get(uri, headers: headers);

    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    List<ProductModel> productList =
        ProductModel.listFromJSON(bodyJson['products'], loggingModel);

    if (bodyJson['status'] == 200) {
      return productList;
    } else {
      return [];
    }
  }

  static Future<List<ProductModel>> getMyProducts(
      {required LoggingModel loggingModel}) async {
    String address = 'http://$ip:8000/api/getProductsUser';
    Uri uri = Uri.parse(address);
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + loggingModel.token
    };

    http.Response response = await http.get(uri, headers: headers);

    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    List<ProductModel> productList =
        ProductModel.listFromJSON(bodyJson['products'], loggingModel);

    if (bodyJson['status'] == 200) {
      return productList;
    } else {
      return [];
    }
  }

  static dynamic addProduct({
    required String token,
    required File image,
    required DateTime eDate,
    required String name,
    required String type,
    required String amount,
    required String connectionInfo,
    required String originalPrice,
    required String day1,
    required String day2,
    required String day3,
    required String dis1,
    required String dis2,
    required String dis3,
  }) async {
    String address = 'http://$ip:8000/api/addProduct';
    Uri uri = Uri.parse(address);
    Map<String, String> body = {
      'date_end': eDate.toString(),
      "name_product": name,
      "type": type,
      "quantity": amount,
      "phone": connectionInfo,
      "price": originalPrice,
      "day1": day1,
      "day2": day2,
      "day3": day3,
      "dis1": dis1,
      "dis2": dis2,
      "dis3": dis3,
    };

    var request = http.MultipartRequest('post', uri);

    request.headers.addAll({'Authorization': 'Bearer $token'});
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    request.fields.addAll(body);

    var response = await request.send().timeout(const Duration(minutes: 2));
    var responseData = await http.Response.fromStream(response);
    var responseBody = json.decode(responseData.body);

    if (responseBody['status'] == 200) {
      return responseBody['status'];
    } else {
      return responseBody;
    }
  }

  static dynamic editProduct({
    required String token,
    required int id,
    required String name,
    required String type,
    required String amount,
    required String connectionInfo,
    required String originalPrice,
  }) async {
    String address = 'http://$ip:8000/api/updateSpeceficProduct/$id';
    Uri uri = Uri.parse(address);
    Map<String, String> body = {
      "name_product": name,
      "type": type,
      "quantity": amount,
      "phone": connectionInfo,
      "price": originalPrice,
    };

    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    http.Response response = await http.put(uri, body: body, headers: headers);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      return bodyJson['status'];
    } else {
      return bodyJson;
    }
  }

  static dynamic deleteProduct({required String token, required int id}) async {
    String address = 'http://$ip:8000/api/deleteSpeceficProduct/$id';
    Uri uri = Uri.parse(address);
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    http.Response response = await http.delete(uri, headers: headers);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      return bodyJson['status'];
    } else {
      return bodyJson;
    }
  }

  static dynamic view({required String token, required int id}) async {
    String address = 'http://$ip:8000/api/view/$id';
    Uri uri = Uri.parse(address);
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    http.Response response = await http.post(uri, headers: headers);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      return bodyJson['status'];
    } else {
      return bodyJson;
    }
  }

  static dynamic like({required String token, required int id}) async {
    String address = 'http://$ip:8000/api/like/$id';
    Uri uri = Uri.parse(address);
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    http.Response response = await http.post(uri, headers: headers);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      return bodyJson['status'];
    } else {
      return bodyJson;
    }
  }

  static dynamic disLike({required String token, required int id}) async {
    String address = 'http://$ip:8000/api/dislike/$id';
    Uri uri = Uri.parse(address);
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    http.Response response = await http.post(uri, headers: headers);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      return bodyJson['status'];
    } else {
      return bodyJson;
    }
  }

  static dynamic comment({
    required String token,
    required int id,
    required String comment,
  }) async {
    String address = 'http://$ip:8000/api/comment/$id';
    Uri uri = Uri.parse(address);
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    Map<String, String> body = {'comment': comment};
    http.Response response = await http.post(uri, body: body, headers: headers);
    Map<String, dynamic> bodyJson = jsonDecode(response.body);

    if (bodyJson['status'] == 200) {
      return bodyJson['status'];
    } else {
      return bodyJson;
    }
  }

  // static dynamic getProductsSorted() {}
  // static dynamic getProductsSearched() {}

  // static dynamic getAllComments() {}

  // static void getProductByID() {}

  // static void searchByName() {}
  // static void searchByType() {}
  // static void searchByEndDate() {}

  // static void sortByName() {}
  // static void sortByType() {}
  // static void sortByPrice() {}
  // static void sortByEndDate() {}
  // static void sortByAmount() {}
}
