import 'package:pl/imports.dart';
import 'dart:io';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key, required this.loggingModel})
      : super(key: key);

  final LoggingModel loggingModel;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  bool imagePicked = false;
  final ImagePicker picker = ImagePicker();
  // ignore: prefer_typing_uninitialized_variables
  var imageFile;
  DateTime dateTime = DateTime.now();
  final gkey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController typeC = TextEditingController();
  final TextEditingController amountC = TextEditingController();
  final TextEditingController connectionInfoC = TextEditingController();
  final TextEditingController originalPriceC = TextEditingController();
  final TextEditingController dayC1 = TextEditingController();
  final TextEditingController dayC2 = TextEditingController();
  final TextEditingController dayC3 = TextEditingController();
  int disC1 = 0;
  int disC2 = 0;
  int disC3 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product ',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {
                          String? s = image?.path;
                          if (s != null) {
                            imageFile = File(s);
                            imagePicked = true;
                          }
                        });
                      },
                      child: Column(
                        children: [
                          (imagePicked)
                              ? Container(
                                  height: 10.h,
                                  width: 40.w,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.file(
                                    imageFile,
                                  ),
                                )
                              : Container(
                                  height: 10.h,
                                  width: 40.w,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 5,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Pick image',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                          (imagePicked)
                              ? const Text('')
                              : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Required!',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Text('End Date : '),
                        ElevatedButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030),
                            );
                            if (picked != null && picked != dateTime) {
                              setState(() {
                                dateTime = picked;
                              });
                            }
                          },
                          child: Text('${dateTime.toLocal()}'.split(' ')[0]),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
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
                  label: 'Original Price',
                  maxLines: 1,
                ),
                SizedBox(
                  height: 2.w,
                ),
                Row(
                  children: [
                    const Text('Befor : '),
                    SizedBox(
                      width: 20.w,
                      child: MyTextField(
                        validator: (value) {},
                        controller: dayC1,
                        inputType: TextInputType.number,
                        label: 'Day Num',
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    const Text('Discount : '),
                    SizedBox(
                      width: 20.w,
                      child: DropdownButton<int>(
                        itemHeight: 8.h,
                        menuMaxHeight: 40.h,
                        borderRadius: BorderRadius.circular(10),
                        value: disC1,
                        onChanged: (newV) {
                          setState(() {
                            disC1 = newV ?? disC1;
                          });
                        },
                        items: List<int>.generate(101, (idx) => idx)
                            .map<DropdownMenuItem<int>>(
                          (e) {
                            return DropdownMenuItem<int>(
                              value: e,
                              child: Text(e.toString() + '%'),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                Row(
                  children: [
                    const Text('Befor : '),
                    SizedBox(
                      width: 20.w,
                      child: MyTextField(
                        validator: (value) {},
                        controller: dayC2,
                        inputType: TextInputType.number,
                        label: 'Day Num',
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    const Text('Discount : '),
                    SizedBox(
                      width: 20.w,
                      child: DropdownButton<int>(
                        itemHeight: 8.h,
                        menuMaxHeight: 40.h,
                        borderRadius: BorderRadius.circular(10),
                        value: disC2,
                        onChanged: (newV) {
                          setState(() {
                            disC2 = newV ?? disC2;
                          });
                        },
                        items: List<int>.generate(101, (idx) => idx)
                            .map<DropdownMenuItem<int>>(
                          (e) {
                            return DropdownMenuItem<int>(
                              value: e,
                              child: Text(e.toString() + '%'),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                Row(
                  children: [
                    const Text('Befor : '),
                    SizedBox(
                      width: 20.w,
                      child: MyTextField(
                        validator: (value) {},
                        controller: dayC3,
                        inputType: TextInputType.number,
                        label: 'Day Num',
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    const Text('Discount : '),
                    SizedBox(
                      width: 20.w,
                      child: DropdownButton<int>(
                        itemHeight: 8.h,
                        menuMaxHeight: 40.h,
                        borderRadius: BorderRadius.circular(10),
                        value: disC3,
                        onChanged: (newV) {
                          setState(() {
                            disC3 = newV ?? disC3;
                          });
                        },
                        items: List<int>.generate(101, (idx) => idx)
                            .map<DropdownMenuItem<int>>(
                          (e) {
                            return DropdownMenuItem<int>(
                              value: e,
                              child: Text(e.toString() + '%'),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (gkey.currentState!.validate()) {
                      var res = await ProductController.addProduct(
                        token: widget.loggingModel.token,
                        image: imageFile,
                        eDate: dateTime,
                        name: nameC.text,
                        type: typeC.text,
                        amount: amountC.text,
                        connectionInfo: connectionInfoC.text,
                        originalPrice: originalPriceC.text,
                        day1: dayC1.text,
                        day2: dayC2.text,
                        day3: dayC3.text,
                        dis1: disC1.toString(),
                        dis2: disC2.toString(),
                        dis3: disC3.toString(),
                      );
                      if (res == 200) {
                        Get.offAll(AllProductsPage(loggingModel: widget.loggingModel));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(res),
                          ),
                        );
                      }
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
