import 'package:pl/imports.dart';

class OneProductComponent extends StatelessWidget {
  const OneProductComponent(
      {Key? key, required this.loggingModel, required this.productModel})
      : super(key: key);

  final LoggingModel loggingModel;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var res = await ProductController.view(
            id: productModel.id, token: loggingModel.token);
        if (res == 200) {
          productModel.views++;
        }
        Get.to(
          OneProductPage(
            loggingModel: loggingModel,
            productModel: productModel,
          ),
        );
      },
      child: Stack(
        children: [
          SizedBox(
            child: SizedBox(
              height: 30.h,
              width: 45.w,
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image(
                      image: NetworkImage(
                        productModel.image,
                      ),
                      errorBuilder: (ctx, obj, stckTrce) {
                        return const CircularProgressIndicator(
                          strokeWidth: 10,
                        );
                      },
                      fit: BoxFit.fitHeight,
                      loadingBuilder: (cotext, child, image) {
                        if (image == null) {
                          return child;
                        } else {
                          return const CircularProgressIndicator(
                            color: Colors.grey,
                            strokeWidth: 5,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 5.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeData.dark().backgroundColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      productModel.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
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
                      Text(productModel.views.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
