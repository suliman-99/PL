import 'package:pl/imports.dart';

class SearchPopup extends StatefulWidget {
  const SearchPopup({
    Key? key,
    required this.loggingModel,
    required this.productList,
  }) : super(key: key);

  final LoggingModel loggingModel;
  final List<ProductModel> productList;
  @override
  State<SearchPopup> createState() => _SearchPopupState();
}

class _SearchPopupState extends State<SearchPopup> {
  final TextEditingController controller = TextEditingController();
  String searchBy = 'Name';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text('Search By'),
          SizedBox(
            width: 10.w,
          ),
          DropdownButton<String>(
            itemHeight: 8.h,
            menuMaxHeight: 40.h,
            borderRadius: BorderRadius.circular(10),
            value: searchBy,
            onChanged: (newV) {
              setState(() {
                searchBy = newV ?? searchBy;
              });
            },
            items: const [
              DropdownMenuItem<String>(
                value: 'Name',
                child: Text('Name'),
              ),
              DropdownMenuItem<String>(
                value: 'EndDate',
                child: Text('EndDate'),
              ),
              DropdownMenuItem<String>(
                value: 'Type',
                child: Text('Type'),
              )
            ],
          ),
        ],
      ),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: searchBy,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            List<ProductModel> newProductList = [];
            if (searchBy == 'Name') {
              for (int i = 0; i < widget.productList.length; i++) {
                if (widget.productList[i].name == controller.text) {
                  newProductList.add(widget.productList[i]);
                }
              }
            } else if (searchBy == 'EndDate') {
              for (int i = 0; i < widget.productList.length; i++) {
                if (widget.productList[i].eDate == controller.text) {
                  newProductList.add(widget.productList[i]);
                }
              }
            } else if (searchBy == 'Type') {
              for (int i = 0; i < widget.productList.length; i++) {
                if (widget.productList[i].type == controller.text) {
                  newProductList.add(widget.productList[i]);
                }
              }
            }

            Get.to(
              SearchResultPage(
                loggingModel: widget.loggingModel,
                productList: newProductList,
              ),
            );
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
