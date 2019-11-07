import 'package:flutter/material.dart';
/*
class Query extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("筛查"),),
        body: Center(
          child: RaisedButton(
            child: Text('开始测听'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new SecondSreen()));
            }
           )
        ),
      ),
    );
  }
}

class SecondSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('开始测听'),),
      body: Center(
        child: RaisedButton(
          child: Text('Hello'),
          onPressed: (){
            Navigator.pop(context);
          },

       )
      ),
    );
  }
}
*/
class ListenTest extends StatefulWidget {
  @override
  StartState createState() => new StartState();
}

class StartState extends State<ListenTest>{
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget isRead(bool isSelected) => Container(//选择按钮
      width: 16.0,
      height: 16.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black)),
      child:
      isSelected ? Container(
            width: double.infinity,
            height: double.infinity,
            decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          ): Container(),
  );

  Widget isReadProtocal() => Container(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 12.0,
            ),
            GestureDetector(
              onTap: _radio,
              child: isRead(_isSelected),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text("我已阅读并同意相关《注意事项》",
                style: TextStyle(
                    fontSize: 12, fontFamily: "Poppins-Medium"))
          ],
        ),
      ],
    ),
  );

  Widget protocal() => Container(
    child: new Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          '在测试开始前\n请您务必阅读以下相关《注意事项》：',
          textAlign: TextAlign.center,
          softWrap: true,
        ),
        new Container(
          width: 250,
          child:new Text(
            '声明：其结果具有一定参考性，只可用于简单的听力监测及预估，不可作为标准化医疗诊断手段。\n',
            softWrap: true,
          ),
        ),
        new Container(
          width: 250,
          child:new Text(
            '1.测试开始时，请您务必选择环境安静的场合与测试地点（如：安静的房间中）以保证测试效果最优化。若当前环境分贝值未达到标准值，则无法开始测试。\n',
            softWrap: true,
          ),
        ),
        new Container(
          width: 250,
          child:new Text(
            '2.本测试只适用于测试者本人进行操作，无操作能力的儿童、老人或其他特殊情况者（如：鼓膜穿孔、中耳炎）不适用。\n',
            softWrap: true,
          ),
        ),
        new Container(
          width: 250,
          child:new Text(
            '请您在测试前，完成以下信息填写（得知您的性别、年龄及耳鸣状况将更有利于了解听力状况）\n',
            softWrap: true,
          ),
        ),
      ],
    )
    
  );

  Widget title() =>new Container(//标题栏
    margin: EdgeInsets.only(left: 30,top: 20,right: 30,bottom: 20),
    padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
    decoration: BoxDecoration(
      border: new Border.all(color: Colors.white, width: 0.5), // 边色与边宽度
      color: Colors.white70, // 底色
      //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
      borderRadius: new BorderRadius.vertical(top: Radius.elliptical(10, 10),bottom: Radius.elliptical(10, 10)),
    ),
    child: new Row(
      children:[
        new Expanded(
          child: 
            new Icon(
              Icons.search
            ),
          flex: 2,
        ),
        new Expanded(
          flex: 3,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom:8.0),
                child: new Text(
                  '欢迎开始评估',
                  style:new TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              new Text(
                'Welcome to Test',
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    )
  );
  Widget startTest() => new RaisedButton(
    child: new Text("开始测试"),
    color: Colors.blue,
    textColor: Colors.white,
    onPressed: () {
      if(_isSelected)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => new SecondSreen()));
      }
      else
      {
        showDialog<Null>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
                return new AlertDialog(
                    title: new Text('错误'),
                    content: new SingleChildScrollView(
                        child: new ListBody(
                            children: <Widget>[
                                new Text('请先阅读并同意《注意事项》'),
                            ],
                        ),
                    ),
                    actions: <Widget>[
                        new FlatButton(
                            child: new Text('确定'),
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                        ),
                    ],
                );
            },
        ).then((val) {
            print(val);
        });

      }
      //_login();
    },
    disabledColor: Colors.grey,
    disabledTextColor: Colors.white,
    disabledElevation: 4,
    //          onPressed: null,// 设置为null即为不可点击（disabled）状态
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), 
  );


  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
          appBar: AppBar(title: Text("听力评估")),
          backgroundColor: Colors.lightBlue,
          
          /*
          floatingActionButton: FloatingActionButton(//悬浮按钮+
            onPressed: () {},
            tooltip: '开始测听',
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,//悬浮位置
          */
          body: new ListView(
            children: <Widget>[
              title(),
              protocal(),
              isReadProtocal(),
              startTest(),
            ],
          ),
      );
    
    return new Container(
      child: scaffold,
    );

  }
}



class Info extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("测听中"),),
          body: GestureDetector(
              child:ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.asset(
                    'assets/images/info.png',
                    fit: BoxFit.fill,
                  )
              ),
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new SecondSreen()));}
          )
      ),
    );
  }
}

class SecondSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("测听中"),),
          body: GestureDetector(
            child:ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Image.asset(
                  'assets/images/Query2.png',
                  fit: BoxFit.fill,
                )
            ),
            onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new ThirdSreen()));}
          )
      ),
    );
  }
}

class ThirdSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("测听中"),),
          body: GestureDetector(
            child:ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Image.asset(
                  'assets/images/Query3.png',
                  fit: BoxFit.fill,
                )
            ),
            onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new FouthSreen()));}
          )
      ),
    );
  }
}

class FouthSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("测听中"),),
          body: GestureDetector(
              child:ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.asset(
                    'assets/images/Query4.png',
                    fit: BoxFit.fill,
                  )
              ),
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new FifthSreen()));}
          )
      ),
    );
  }
}

class FifthSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("测听中"),),
          body: GestureDetector(
              child:ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.asset(
                    'assets/images/Query5.png',
                    fit: BoxFit.fill,
                  )
              ),
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new SixthSreen()));}
          )
      ),
    );
  }
}


class SixthSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("测听中"),),
          body: GestureDetector(
              child:ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.asset(
                    'assets/images/Query6.png',
                    fit: BoxFit.fill,
                  )
              ),
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new WenzhenSreen()));}
          )
      ),
    );
  }
}


class WenzhenSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("专家问诊"),),
          body: GestureDetector(
              child:ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.asset(
                    'assets/images/Wenzhen1.png',
                    fit: BoxFit.fill,
                  )
              ),
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new Wenzhen2Sreen()));}
          )
      ),
    );
  }
}

class Wenzhen2Sreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("专家问诊"),),
          body: GestureDetector(
              child:ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.asset(
                    'assets/images/Wenzhen2.png',
                    fit: BoxFit.fill,
                  )
              ),
              //onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => new WenzhenSreen()));}
          )
      ),
    );
  }
}
