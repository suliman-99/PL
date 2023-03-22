import 'package:pl/imports.dart';
// import 'dart:io';

class EditProductPage extends StatefulWidget {
  const EditProductPage(
      {Key? key, required this.loggingModel, required this.productModel})
      : super(key: key);

  final LoggingModel loggingModel;
  final ProductModel productModel;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final gkey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController typeC = TextEditingController();
  final TextEditingController amountC = TextEditingController();
  final TextEditingController connectionInfoC = TextEditingController();
  final TextEditingController originalPriceC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Product ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: SingleChildScrollView(
          child: Form(
            key: gkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: MyTextField(
                        validator: (value) {},
                        controller: nameC,
                        inputType: TextInputType.name,
                        label: 'Name',
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    SizedBox(
                      width: 40.w,
                      child: MyTextField(
                        validator: (value) {},
                        controller: typeC,
                        inputType: TextInputType.name,
                        label: 'Type',
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                MyTextField(
                  validator: (value) {},
                  controller: amountC,
                  inputType: TextInputType.number,
                  label: 'Amount',
                  maxLines: null,
                ),
                SizedBox(
                  height: 2.w,
                ),
                MyTextField(
                  validator: (value) {},
                  controller: connectionInfoC,
                  inputType: TextInputType.multiline,
                  label: 'Coneection Info',
                  maxLines: null,
                ),
                SizedBox(
                  height: 2.w,
                ),
                MyTextField(
                  validator: (value) {},
                  controller: originalPriceC,
                  inputType: TextInputType.number,
                  label: 'Price',
                  maxLines: 1,
                ),
                SizedBox(
                  height: 2.w,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var res = await ProductController.editProduct(
                      token: widget.loggingModel.token,
                      id: widget.productModel.id,
                      name: nameC.text,
                      type: typeC.text,
                      amount: amountC.text,
                      connectionInfo: connectionInfoC.text,
                      originalPrice: originalPriceC.text,
                    );
                    if (res == 200) {
                      Get.offAll(
                          AllProductsPage(loggingModel: widget.loggingModel));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(res),
                        ),
                      );
                    }
                  },
                  child: const Text('Submite'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
