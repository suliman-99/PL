import 'package:pl/imports.dart';

class OneProductPage extends StatefulWidget {
  const OneProductPage(
      {Key? key, required this.loggingModel, required this.productModel})
      : super(key: key);

  final LoggingModel loggingModel;
  final ProductModel productModel;

  @override
  State<OneProductPage> createState() => _OneProductPageState();
}

class _OneProductPageState extends State<OneProductPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.productModel.name,
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          (widget.productModel.owner.email == widget.loggingModel.email)
              ? IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeletePopup(
                          loggingModel: widget.loggingModel,
                          productModel: widget.productModel,
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                )
              : const Text(''),
          (widget.productModel.owner.email == widget.loggingModel.email)
              ? IconButton(
                  onPressed: () {
                    Get.to(EditProductPage(
                      loggingModel: widget.loggingModel,
                      productModel: widget.productModel,
                    ));
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                )
              : const Text(''),
        ],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 80.w,
                  child: Image(
                    image: NetworkImage(
                      widget.productModel.image,
                      scale: 1.0,
                    ),
                    loadingBuilder: (cotext, child, image) {
                      if (image == null) {
                        return child;
                      } else {
                        return const CircularProgressIndicator(
                          strokeWidth: 10,
                        );
                      }
                    },
                    errorBuilder: (ctx, obj, stckTrce) {
                      return const CircularProgressIndicator(
                        strokeWidth: 10,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 10,
                          child: const Icon(
                            Icons.thumb_up,
                            size: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(widget.productModel.likes.toString(),
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.productModel.commentsList.length.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Comment',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0x00000000),
                        ),
                        elevation: MaterialStateProperty.all(
                          0,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          null,
                        ),
                      ),
                      onPressed: () async {
                        if (widget.productModel.iLike) {
                          var res = await ProductController.disLike(
                              id: widget.productModel.id,
                              token: widget.loggingModel.token);
                          if (res == 200) {
                            setState(() {
                              widget.productModel.iLike = false;
                            });
                          }
                        } else {
                          var res = await ProductController.like(
                            id: widget.productModel.id,
                            token: widget.loggingModel.token,
                          );
                          if (res == 200) {
                            setState(() {
                              widget.productModel.iLike = true;
                            });
                          }
                        }
                      },
                      child: Row(
                        children: [
                          (widget.productModel.iLike)
                              ? Icon(
                                  Icons.thumb_up_alt,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : const Icon(
                                  Icons.thumb_up_alt_outlined,
                                ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Like',
                            style: TextStyle(
                              color: (widget.productModel.iLike)
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0x00000000),
                        ),
                        elevation: MaterialStateProperty.all(
                          0,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          null,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CommentPopup(
                                loggingModel: widget.loggingModel,
                                productModel: widget.productModel,
                              );
                            });
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.chat_bubble_outline),
                          SizedBox(
                            width: 3.w,
                          ),
                          const Text('Comment'),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1.h,
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailComponent(
                      descrip: 'Type : ',
                      content: widget.productModel.type,
                    ),
                    DetailComponent(
                      descrip: 'Amount : ',
                      content: widget.productModel.amount,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailComponent(
                      descrip: 'End Date : ',
                      content: widget.productModel.eDate,
                    ),
                    DetailComponent(
                      descrip: 'Price : ',
                      content: widget.productModel.price,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                const Text(
                  'Connecting Info : ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.productModel.connectInfo),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(150),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.remove_red_eye_outlined),
                      Text(widget.productModel.views.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class DetailComponent extends StatelessWidget {
  const DetailComponent({
    Key? key,
    required this.descrip,
    required this.content,
  }) : super(key: key);

  final String descrip;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            descrip,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(content),
        ],
      ),
    );
  }
}
