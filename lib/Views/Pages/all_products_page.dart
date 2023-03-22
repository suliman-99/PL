import 'package:pl/imports.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({Key? key, required this.loggingModel})
      : super(key: key);

  final LoggingModel loggingModel;

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  Future<List<ProductModel>>? productList;

  @override
  void initState() {
    super.initState();
    productList =
        ProductController.getProducts(loggingModel: widget.loggingModel);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Get.offAll(
                        AllProductsPage(loggingModel: widget.loggingModel));
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SignOutPopUp(
                              loggingModel: widget.loggingModel,
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(AddProductPage(loggingModel: widget.loggingModel));
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
            drawer: MyDrawer(
              loggingModel: widget.loggingModel,
              productList: (snapshot.data as List<ProductModel>),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('Assets/Images/BackGround.jpg'),
                    ),
                  ),
                ),
                GridView.builder(
                  itemBuilder: (ctx, idx) {
                    return OneProductComponent(
                      loggingModel: widget.loggingModel,
                      productModel: (snapshot.data as List<ProductModel>)[idx],
                    );
                  },
                  itemCount: (snapshot.data as List<ProductModel>).length,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Get.offAll(
                        AllProductsPage(loggingModel: widget.loggingModel));
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SignOutPopUp(
                              loggingModel: widget.loggingModel,
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(AddProductPage(loggingModel: widget.loggingModel));
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
            drawer: MyDrawer(
              loggingModel: widget.loggingModel,
              productList: const [],
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('Assets/Images/BackGround.jpg'),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 50.w,
                    width: 50.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 10,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
