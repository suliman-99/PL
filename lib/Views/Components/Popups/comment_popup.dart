import 'package:pl/imports.dart';

class CommentPopup extends StatelessWidget {
  CommentPopup({
    Key? key,
    required this.loggingModel,
    required this.productModel,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();

  final LoggingModel loggingModel;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: Dialog(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 5,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      'Comments On ' + productModel.name + ' Product',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              productModel.commentsList
                                  .elementAt(index)
                                  .owner
                                  .name,
                            ),
                            subtitle: Text(
                              productModel.commentsList
                                  .elementAt(index)
                                  .content,
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            height: 10,
                          )
                        ],
                      );
                    },
                    itemCount: productModel.commentsList.length,
                  ),
                ),
              ),
              TextField(
                cursorColor: Theme.of(context).colorScheme.onPrimary,
                decoration: InputDecoration(
                    labelText: 'Type A Comment',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 5),
                    ),
                    prefixIcon: Icon(
                      Icons.chat,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        var res = await ProductController.comment(
                          token: loggingModel.token,
                          id: productModel.id,
                          comment: controller.text,
                        );
                        if (res == 200) {
                          productModel.commentsList.add(
                            CommentModel(
                              id: 0,
                              owner: ForeignUserModel(
                                name: loggingModel.name,
                                email: loggingModel.email,
                              ),
                              content: controller.text,
                            ),
                          );
                          Get.back();
                        }
                      },
                    )),
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
