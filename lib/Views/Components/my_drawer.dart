import 'package:pl/imports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.loggingModel,
    required this.productList,
  }) : super(key: key);

  final LoggingModel loggingModel;
  final List<ProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('Assets/Images/DrawerBackGround.jpg'),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Text(
                  loggingModel.name,
                  style: const TextStyle(fontSize: 50, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: Colors.black),
              const SizedBox(height: 10),
              MyDrawerTile(
                icon: Icons.edit,
                text: "My Products",
                function: () async {
                  var res = await ProductController.getMyProducts(loggingModel: loggingModel);
                  Get.to(
                    SearchResultPage(
                      loggingModel: loggingModel,
                      productList: res,
                    ),
                  );
                },
              ),
              MyDrawerTile(
                icon: Icons.search_rounded,
                text: "Search",
                function: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SearchPopup(
                        loggingModel: loggingModel,
                        productList: productList,
                      );
                    },
                  );
                },
              ),
              MyDrawerTile(
                icon: Icons.sort,
                text: "Sort",
                function: () {
                  Get.back();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SortPopup(productList: productList,loggingModel: loggingModel,);
                    },
                  );
                },
              ),
              MyDrawerTile(
                icon: Icons.settings,
                text: "Language",
                function: () {
                  Get.back();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const LanguagePopup();
                    },
                  );
                },
              ),
              MyDrawerTile(
                icon: Icons.info,
                text: 'About',
                function: () {
                  showAboutDialog(
                    context: context,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyDrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function function;

  const MyDrawerTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0x00000000),
        ),
        elevation: MaterialStateProperty.all(
          0,
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
      ),
      onPressed: () {
        function();
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 80,
          left: MediaQuery.of(context).size.width / 20,
          right: MediaQuery.of(context).size.width / 20,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: MediaQuery.of(context).size.width / 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
