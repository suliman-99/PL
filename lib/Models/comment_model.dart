import 'package:pl/imports.dart';

class CommentModel {
  final int id;
  final ForeignUserModel owner;

  final String content;

  CommentModel({
    required this.id,
    required this.owner,
    required this.content,
  });

  static CommentModel fromJSON(Map<String, dynamic> json) {
    return CommentModel(
      id: 0,
      owner: ForeignUserModel(name: json['name'], email: json['email']),
      content: json['comment'],
    );
  }

  static List<CommentModel> listFromJSON
  (List<dynamic> jsonList) {
    List<CommentModel> commentsList = [];
    for (int i = 0; i < jsonList.length; i++) {
      commentsList.add(CommentModel.fromJSON(jsonList[i]));
    }
    return commentsList;
  }

  // static CommentModel defaultInit() {
  //   return CommentModel(
  //     id: 1,
  //     owner: ForeignUserModel.defaultInit(),
  //     content: 'I like This Product',
  //   );
  // }
}
