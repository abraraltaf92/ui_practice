import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

List<List<Color>> _colors = [
  [Color(0xFF732be3), Color(0xFFe3b0ca)],
  [Color(0xFF39b98f), Color(0xFF11a463)],
  [Color(0xFF4ac4ed), Color(0xFF6e87d6)],
  [Color(0xFFf7869c), Color(0xFFfc8c92)],
  [Color(0xFFc471f4), Color(0xFFf771cf)],
  [Color(0xFF84fab0), Color(0xFF8fd5f0)]
];
List<String> _labels = ['Home', 'Tutorials', 'Report', 'Take Quiz'];
List<String> _texts = [
  'Announcements',
  'Tests',
  'Attendence',
  'Tasks',
  'Results',
  'Calender'
];
List<Widget> _list = [
  Icon(
    Icons.chat_bubble_outline,
    color: Colors.white,
    size: 40,
  ),
  Icon(
    Icons.check_box_outlined,
    color: Colors.white,
    size: 40,
  ),
  Text(
    '77.08%',
    style: TextStyle(
        color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
  ),
  Icon(
    Icons.work_outline,
    color: Colors.white,
    size: 40,
  ),
  Icon(
    Icons.my_library_books_outlined,
    color: Colors.white,
    size: 40,
  ),
  Icon(
    Icons.calendar_today,
    color: Colors.white,
    size: 40,
  )
];
List<Container> _notifications = [
  Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFffad34)),
    height: 30,
    width: 30,
    child: Center(
        child: Text(
      '10',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )),
  ),
  Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFffad34)),
    height: 30,
    width: 30,
    child: Center(
        child: Text(
      '3',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )),
  ),
  Container(),
  Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFffad34)),
    height: 30,
    width: 30,
    child: Center(
        child: Text(
      '7',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )),
  ),
  Container(),
  Container()
];
int indx = 0;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededed),
      appBar: AppBar(
        backgroundColor: Color(0xFFededed),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text('Home',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.send,
              color: Color(0xFFff5733),
            ),
            onPressed: () {
              _displaySnack(msg: 'Send button pressed');
            },
          ),
          IconButton(
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                _displaySnack(msg: 'Menu button pressed');
              }),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text(
            //       'Home',
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 25,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.send,
            //           color: Color(0xFFff5733),
            //         ),
            //         SizedBox(
            //           width: 8,
            //         ),
            //         Icon(Icons.menu_outlined),
            //       ],
            //     )
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Card(
                color: Color(0xFFededed),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Color(0xFFffffff),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                    ),
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Today\'s Time Table...',
                          hintStyle: TextStyle(
                              color: Color(0xFFbababa),
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 12.0 / 10.0,
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _displaySnack(msg: '${_texts[index]} button pressed');
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient:
                                      LinearGradient(colors: _colors[index]),
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _list[index],
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _texts[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _notifications[index],
                                ]),
                          ),
                        ],
                      )),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tutorials',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF515151)),
            ),
            Container(
              width: double.infinity,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: MediaQuery.of(context).size.width * 0.8,
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      _displaySnack(msg: '${_texts[i]} button pressed');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF085430), Color(0xFF5ebc52)]),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: _list[i],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFff5733),
        unselectedItemColor: Color(0xFFff5733).withOpacity(0.5),
        selectedIconTheme: IconThemeData(color: Color(0xFFff5733)),
        unselectedIconTheme: IconThemeData(
          color: Color(0xFFff5733).withOpacity(0.5),
        ),
        backgroundColor: Colors.white,
        currentIndex: indx,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(color: Color(0xFFff5733), fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(
            color: Color(0xFFff5733).withOpacity(0.5),
            fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: _labels[0],
          ),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.video_label_outlined,
              ),
              label: _labels[1]),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.report,
              ),
              label: _labels[2]),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
              ),
              label: _labels[3])
        ],
        onTap: (index) {
          setState(() {
            indx = index;
            _displaySnack(msg: '${_labels[indx]}');
          });
        },
      ),
    );
  }

  void _displaySnack({@required String msg}) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }
}
