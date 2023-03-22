import 'package:pl/imports.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key,required this.loggingModel, required this.productList}) : super(key: key);

  final LoggingModel loggingModel;
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemBuilder: (ctx, idx) {
          return OneProductComponent(
            loggingModel: loggingModel,
            productModel: productList[idx],
          );
        },
        itemCount: productList.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
        ),
      ),
    );
  }
}
