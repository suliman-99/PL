import 'package:pl/imports.dart';

class SortPopup extends StatefulWidget {
  const SortPopup(
      {Key? key, required this.productList, required this.loggingModel})
      : super(key: key);

  final LoggingModel loggingModel;
  final List<ProductModel> productList;
  @override
  State<SortPopup> createState() => _SortPopupState();
}

class _SortPopupState extends State<SortPopup> {
  String sorthBy = 'Name';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text('Sort By'),
          SizedBox(
            width: 10.w,
          ),
          DropdownButton<String>(
            itemHeight: 8.h,
            menuMaxHeight: 40.h,
            borderRadius: BorderRadius.circular(10),
            value: sorthBy,
            onChanged: (newV) {
              setState(() {
                sorthBy = newV ?? sorthBy;
              });
            },
            items: const [
              DropdownMenuItem<String>(
                value: 'Name',
                child: Text('Name'),
              ),
              DropdownMenuItem<String>(
                value: 'Price',
                child: Text('Price'),
              ),
              DropdownMenuItem<String>(
                value: 'End Date',
                child: Text('End Date'),
              ),
              DropdownMenuItem<String>(
                value: 'Amount',
                child: Text('Amount'),
              ),
              DropdownMenuItem<String>(
                value: 'Type',
                child: Text('Type'),
              )
            ],
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (sorthBy == 'Name') {
              widget.productList.sort((o1, o2) {
                return (o1.name.compareTo(o2.name));
              });
            } else if (sorthBy == 'Price') {
              widget.productList.sort((o1, o2) {
                return (o1.price.compareTo(o2.price));
              });
            } else if (sorthBy == 'End Date') {
              widget.productList.sort((o1, o2) {
                return (o1.eDate.compareTo(o2.eDate));
              });
            } else if (sorthBy == 'Amount') {
              widget.productList.sort((o1, o2) {
                return (o1.amount.compareTo(o2.amount));
              });
            } else if (sorthBy == 'Type') {
              widget.productList.sort((o1, o2) {
                return (o1.type.compareTo(o2.type));
              });
            }
            Get.to(SearchResultPage(
              loggingModel: widget.loggingModel,
              productList: widget.productList,
            ));
          },
          child: const Text('asc'),
        ),
        ElevatedButton(
          onPressed: () {
            if (sorthBy == 'Name') {
              widget.productList.sort((o1, o2) {
                return (o2.name.compareTo(o1.name));
              });
            } else if (sorthBy == 'Price') {
              widget.productList.sort((o1, o2) {
                return (o2.price.compareTo(o1.price));
              });
            } else if (sorthBy == 'End Date') {
              widget.productList.sort((o1, o2) {
                return (o2.eDate.compareTo(o1.eDate));
              });
            } else if (sorthBy == 'Amount') {
              widget.productList.sort((o1, o2) {
                return (o2.amount.compareTo(o1.amount));
              });
            } else if (sorthBy == 'Type') {
              widget.productList.sort((o1, o2) {
                return (o2.type.compareTo(o1.type));
              });
            }
            Get.to(SearchResultPage(
              loggingModel: widget.loggingModel,
              productList: widget.productList,
            ));
          },
          child: const Text('desk'),
        ),
      ],
    );
  }
}
