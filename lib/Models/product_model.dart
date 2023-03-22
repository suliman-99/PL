import 'package:pl/imports.dart';

class ProductModel {
  final int id;
  final ForeignUserModel owner;

  final String image;
  final String name;
  final String type;
  final String eDate;
  final String amount;
  final String price;
  final String connectInfo;

  int views;
  final int likes;
  final List<CommentModel> commentsList;

  bool iLike;

  ProductModel({
    required this.id,
    required this.owner,
    required this.image,
    required this.name,
    required this.type,
    required this.eDate,
    required this.amount,
    required this.price,
    required this.connectInfo,
    required this.iLike,
    required this.views,
    required this.likes,
    required this.commentsList,
  });

  static ProductModel fromJSON(
      Map<String, dynamic> json, LoggingModel loggingModel) {
    return ProductModel(
      id: json['id'],
      owner: ForeignUserModel(name: json['name'], email: json['email']),
      image: 'http://$ip:8000/upload/image_products/' + json['image'],
      name: json['name_product'],
      type: json['type'],
      eDate: json['date_end'],
      amount: json['quantity'].toString(),
      price: json['price'].toString(),
      connectInfo: json['phone'],
      iLike: (json['islike'] == 1),
      views: json['views'],
      likes: json['likes'],
      commentsList:
          CommentModel.listFromJSON(json['comments'] as List<dynamic>),
    );
  }

  static List<ProductModel> listFromJSON(
    List<dynamic> jsonList,
    LoggingModel loggingModel,
  ) {
    List<ProductModel> productList = [];
    for (int i = 0; i < jsonList.length; i++) {
      productList.add(ProductModel.fromJSON(jsonList[i], loggingModel));
    }
    return productList;
  }

//   static ProductModel defaultInit() {
//     return ProductModel(
//       id: 1,
//       owner: ForeignUserModel.defaultInit(),
//       image:
//           'https://static5.depositphotos.com/1021974/458/i/950/depositphotos_4587034-stock-photo-illustration-laptop-computer-magnify-glass.jpg',
//       name: 'E570 ThinkPad Laptop sssssssssssssssssssssss',
//       type: 'Lenovo',
//       eDate: '1/1/2022',
//       amount: '30',
//       price: '700\$',
//       connectInfo: '''
// Phone Number : 0923456789
// Facebook : Lenovo.sy
//           ''',
//       iLike: false,
//       views: 750,
//       likes: 500,
//       commentsList: [
//         CommentModel.defaultInit(),
//         CommentModel.defaultInit(),
//         CommentModel.defaultInit(),
//       ],
//     );
//   }

}
