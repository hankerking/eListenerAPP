import 'package:flutter/material.dart';
import 'customicon.dart';
import 'package:streaming/UserPage/UserMain.dart';
import 'Recommend.dart';
import 'package:streaming/ListenTest/Query.dart';
import 'ListenBaiTai.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'e听',
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),

  );
}
//启动Home
class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

//封装好的主页
class _StartState extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[HomeScreeTopPart(), HomeScreenBottomPart(),],
        ),
      ),
    );
  }
}

class ButtomIcon{
  static const IconData book_open = IconData(59393, fontFamily: "ButtomIcons");
  static const IconData hearing = IconData(59392, fontFamily: "ButtomIcons");
}

class _HomeState extends State<Home> {
  List<Widget> page_view_list2 = [_StartState(),ListenTest(),Recommend(),ListenBaiTai(),UserLogin()];//将跳转的列表

  int _nowindex = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page_view_list2[_nowindex],/*SingleChildScrollView(
        child: Column(
          children: <Widget>[HomeScreeTopPart(), HomeScreenBottomPart()],
        ),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _nowindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),//, color: Color(0xFFE52020)),
              title: Text("主页")),// style: TextStyle(color: Color(0xFFE52020)))),
          BottomNavigationBarItem(
              icon: Icon(
                ButtomIcon.hearing
              ),
              title: Text("评估", style: TextStyle())),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border,
              ),
              title: Text(
                "推荐",
              )),
          BottomNavigationBarItem(
              icon: Icon(
                  ButtomIcon.book_open
                ), 
              title: Text(
                "听百态"
              )),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.person_outline
              ),
              title: Text(
                  "我的"
              ))
        ],

        onTap: (int index){//参数设置为默认的index，这个index就是点击的按钮的index，只需要将index参数赋值给已设定的属性 _now_index;
          setState(() {
            _nowindex =index;
          });
        },

      ),
    );
  }
}

class HomeScreeTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 420.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Mclipper(),
            child: Container(
              height: 370.0,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0)
              ]),
              child: Stack(
                children: <Widget>[
                  Image.asset("assets/images/face.png",
                      fit: BoxFit.cover, width: double.infinity),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          const Color(0xD3333333),
                          const Color(0x77999999)
                        ],
                            stops: [
                          0.0,
                          0.9
                        ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(0.0, 1.0))),
                    child: Padding(
                      padding: EdgeInsets.only(top: 120.0, left: 95.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "听力障碍评估与服务平台",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          ),
                          Text(
                            "e     听",
                            style: TextStyle(
                                color: Color(0xFF00B2EE),
                                fontSize: 60.0,
                                fontFamily: "UserCustomIcons"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 370.0,
            right: -20.0,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFE52020),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: RaisedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new ListenTest()));},
                      color: Color(0xFF00BFFF),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 80.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "前往测试",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RotatedBox(
                            quarterTurns: 2,
                            child: Icon(CustomIcons.back_icon,
                                size: 25.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}

class HomeScreenBottomPart extends StatelessWidget {
  List<String> images = [
    "assets/images/check.png",
    "assets/images/recommend.png",
    "assets/images/shopping.png",
    "assets/images/ting.png"
  ];

  List<String> titles = ["听力评估", "在线问诊", "产品推荐","听百态"];

  List<Widget> funtions() {
    List<Widget> funtionList = new List();

    for (int i = 0; i < 4; i++) {
      var funtionitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
        child: Container(
          height: 220.0,
          width: 135.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                child: Text(titles[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: "SF-Pro-Display-Bold")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                //child: Text(i == 0 ? "Season 2" : ""),
              )
            ],
          ),
        ),
      );
      funtionList.add(funtionitem);
    }
    return funtionList;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 360.0,
      margin: EdgeInsets.only(left: 65.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "功能一览",
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: "SF-Pro-Display-Bold"),
                ),
                FlatButton(
                  child: Text("more.."),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: funtions(),
            ),
          )
        ],
      ),
    );
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100.0);

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
