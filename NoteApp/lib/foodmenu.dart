import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  List<Item> items = [
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://vcdn-suckhoe.vnecdn.net/2019/10/18/xcoverimage-1522314845-pagespe-5827-3118-1571373020.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://suckhoedoisong.vn/Images/thutrang/2017/04/11/rauxanh.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://tieuduong.net/wp-content/uploads/2020/01/men-gan-cao-co-an-duoc-thit-ga-khong-va-cach-phong-benh-ra-sao_optimized.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://cafefcdn.com/thumb_w/650/203337114487263232/2021/3/15/photo1615782908316-1615782908523474977411.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://vcdn-suckhoe.vnecdn.net/2019/10/18/xcoverimage-1522314845-pagespe-5827-3118-1571373020.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://suckhoedoisong.vn/Images/thutrang/2017/04/11/rauxanh.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://tieuduong.net/wp-content/uploads/2020/01/men-gan-cao-co-an-duoc-thit-ga-khong-va-cach-phong-benh-ra-sao_optimized.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://cafefcdn.com/thumb_w/650/203337114487263232/2021/3/15/photo1615782908316-1615782908523474977411.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://vcdn-suckhoe.vnecdn.net/2019/10/18/xcoverimage-1522314845-pagespe-5827-3118-1571373020.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://suckhoedoisong.vn/Images/thutrang/2017/04/11/rauxanh.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://tieuduong.net/wp-content/uploads/2020/01/men-gan-cao-co-an-duoc-thit-ga-khong-va-cach-phong-benh-ra-sao_optimized.jpg"),
    Item(
        calor: 200,
        gram: 300,
        url:
            "https://cafefcdn.com/thumb_w/650/203337114487263232/2021/3/15/photo1615782908316-1615782908523474977411.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.count(
        crossAxisCount: 4,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.local_fire_department,
                    color: Colors.red,
                  )),
                  TextSpan(
                      text: "100 Calories",
                      style: TextStyle(color: Colors.red, fontSize: 20)),
                ])),
              ],
            ),
          ),
          ...items.map((e) => item(e)).toList()
        ],
        staggeredTiles: [
          StaggeredTile.count(2, 2),
          ...items.map((e) => StaggeredTile.fit(2)).toList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget item(Item item) {
    double width = MediaQuery.of(context).size.width / 2;
    return Center(
      child: Container(
        width: width,
        height: width * 1.2,
        child: Stack(children: [
          Positioned(
              top: 20,
              child: Container(
                width: width,
                // height: width * 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Bắp tươi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Nhóm: Rau củ quả",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                        Column(
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.local_fire_department,
                                color: Colors.red,
                              )),
                              TextSpan(
                                  text: "100 Calories",
                                  style: TextStyle(color: Colors.red)),
                            ])),
                            Divider(),
                            Text("100g",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      item.url,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

class Item {
  final int calor;
  final int gram;
  final String url;
  Item({required this.calor, required this.gram, required this.url});
}
