import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_new_task/bloc/countries_bloc.dart';
import 'package:flutter_app_new_task/util/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_new_task/db/database_helper.dart';
import 'model/countries.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  var _visible = true;

  FadeIn() {
    loadWidget();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*   Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountriesPage(),
          ));
    });*/
    /*animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    */
    // loadWidget();
  }

  loadWidget() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, _navigationPage);
  }

  void _navigationPage() {
    Navigator /*.of(context)*/ .pushReplacement(
        context, MaterialPageRoute(builder: (context) => CountriesPage()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    loadWidget();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "C o u n t r i e s",
            style: lrgetxtstyle,
          ),
        ),
      ),
    );
  }
}

class CountriesPage extends StatefulWidget {
  @override
  State createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  var database;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Countries App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
              child: StreamBuilder(
            builder: (context, AsyncSnapshot<List<CountriesData>> snapshot) {

              if(snapshot.hasData){
                if(snapshot.data.length>0){
                  setDb(snapshot.data);
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return countriesCard(snapshot.data[index]);
                  },
                  itemCount: snapshot.data.length,
                );
              }else{
                return Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ),);
              }
            },
            stream: bloc.repoSubject,
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getReposData();
    database=DatabaseHelper.instance;
    DatabaseHelper.instance.createDatabase();
  }

  Widget countriesCard(CountriesData data) {
    return Container( padding: EdgeInsets.all(elevation_3), margin: EdgeInsets.all(padding_5),
      child: Material(
        elevation: elevation_3,
        child: Container(
          margin: EdgeInsets.all(padding_5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(onPressed:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>
                         BorderPages(data: data)
                       ));
                      } ,child: Text(
                        data.name,
                        style: titlestyle,
                      ),),
                      SizedBox(width: 5,),
                      Text(
                        data.capital,
                        style: childtyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Population: ${data.population ?? ""}",
                    style: childtyle,
                  )
                ],
              ),
             FlatButton(onPressed: (){
               shownewDialog(data.regionalBlocs);
             }, child:  Padding(padding: EdgeInsets.all(padding_10),child:Text(
                 "Regions : ${data.region ?? ""}  Sub Regions : ${data.subregion ?? ""}")))
            ],
          ),
          padding: EdgeInsets.all(padding_10),
        )
    ),) ;
  }

  shownewDialog([regionalBlocs]){
    showDialog(context: context, child:
    new AlertDialog(
      title: new Text("Regional Blocs"),
      content: ListView.builder(itemBuilder: (context,index){
       if(regionalBlocs.length>0){
         return Text("${regionalBlocs[index].name}");
       }else{
         Text("No Items");
       }
      },
      itemCount: regionalBlocs.length,),
    )
    );
  }
  showBorderDialog(CountriesData data){
    showDialog(context: context, child:
    new AlertDialog(
      title: new Text(data.name),
      content: Column(
        children: <Widget>[
          Image.network(data.flag,),
         /* ListView.builder(itemBuilder: (context,index){
            if(data.borders.length>0){
              return Text("${data.borders[index]}");
            }else{
              Text("No Items");
            }
          },
            itemCount: data.borders.length,)*/
        ],
      ),
    )
    );
  }

  void setDb(List<CountriesData> data) {

    Future.delayed(Duration(seconds: 3),(){
     for(int i=0;i<data.length;i++){
       database.createCustomer(data[i]);
     }

     print("object ${database.getCustomers()}");
    });
  }

}

class BorderPages extends StatefulWidget {
CountriesData data;


BorderPages({this.data,Key key}):super(key:key);

@override
  State createState() => StateBorderPages();
}

class StateBorderPages extends State<BorderPages> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor:Colors.blueAccent,title: Text(widget.data.name,style: TextStyle(color: Colors.white),),),
      body: Stack(
        children: <Widget>[
         Flexible(child:  SvgPicture.network(widget.data.flag,height:228,),flex: 2,),
        Flexible(flex: 3,child: ListView.builder(itemBuilder: (context,index){
          if(widget.data.borders!=null && widget.data.borders.length>0){
            return Text("${widget.data.borders[index]}");
          }else{
            Text("No Items");
          }
        },
          itemCount: widget.data.borders.length,),)
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
