import 'package:pl/imports.dart';

class DeletePopup extends StatelessWidget {
  const DeletePopup(
      {Key? key, required this.loggingModel, required this.productModel})
      : super(key: key);

  final LoggingModel loggingModel;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Product'),
      content: const Text('Are you Suer You Want To Delete This Product ?!'),
      actions: [
        ElevatedButton(
          child: const Text(
            'Delete This Product',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () async {
            var res = await ProductController.deleteProduct(
                token: loggingModel.token, id: productModel.id);
            if (res == 200) {
              Get.back();
              Get.back();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(res),
                ),
              );
              Get.back();
            }
          },
        ),
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
