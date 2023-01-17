import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> product = [
    Product("Product1",
        [ProductData("Title1"), ProductData("Title2"), ProductData("Title3")]),
    Product("Product2",
        [ProductData("Title1"), ProductData("Title2"), ProductData("Title3")]),
    Product("Product3", [
      ProductData("Title1"),
      ProductData("Title2"),
      ProductData("Title3"),
      ProductData("Title4"),
      ProductData("Title5"),
      ProductData("Title6"),
      ProductData("Title7"),
      ProductData("Title8"),
      ProductData("Title9")
    ]),
    Product("Product4", [ProductData("Title1"), ProductData("Title2")]),
    Product("Product5", [ProductData("Title1"), ProductData("Title2")]),
    Product("Product6", [ProductData("Title1"), ProductData("Title2")]),
    Product("Product7", [ProductData("Title1")]),
    Product("Product8", [ProductData("Title1")]),
    Product("Product9", [ProductData("Title1")]),
    Product("Product10", [ProductData("Title1")]),
    Product("Product11", [ProductData("Title1")]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrollable list view"),
      ),
      body: ScrollableListTabScroller(
        tabBuilder: (BuildContext context, int scrollIndex, bool active) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            product.elementAt(scrollIndex).title,
            style: !active
                ? null
                : const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        itemCount: product.length,
        itemBuilder: (BuildContext context, int scrollIndex) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                product.elementAt(scrollIndex).title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 320,
              child: ListView.builder(
                itemCount: product[scrollIndex].productData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  print('+++${product[scrollIndex].productData.length}');
                  return Container(
                    color: Colors.black,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "ProductData ${product[scrollIndex].productData[index].productName}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  String title;
  List<ProductData> productData;

  Product(this.title, this.productData);
}

class ProductData {
  String productName;

  ProductData(this.productName);
}
