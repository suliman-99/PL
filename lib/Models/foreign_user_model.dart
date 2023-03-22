class ForeignUserModel {
  String email;
  String name;

  ForeignUserModel({
    required this.email,
    required this.name,
  });

  static ForeignUserModel fromJSON(Map<String, dynamic> json) {
    return ForeignUserModel(
      email: json['email'],
      name: json['name'],
    );
  }

  static ForeignUserModel defaultInit() {
    return ForeignUserModel(
      email: 'ss@g.c',
      name: 'suliman',
    );
  }
}
