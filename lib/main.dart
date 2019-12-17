import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Ventisol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Controle Ventisol'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Card(
            child: ListView(
              children: <Widget>[
                _velocidades(),
                _timers(),
                _botoesMaiores(),
              ],
            ),
          )
        )
      )
    );
  }

  _row(children){
    return new Row(
      children: children,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  _column(children){
    return new Column(
      children: children,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  _botaoPadrao(text, onPressed){
    return new RaisedButton(

      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.black26,
    );
  }

  _botaoMaior(text, onPressed){
    return new RaisedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      color: Colors.white,
    );
  }

  _velocidades(){
    return Container(
      constraints: BoxConstraints.expand(height: 120),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Center(child: Text("VELOCIDADES")),
          _row(<Widget>[
            _botaoPadrao("1", _onPressedVelocidade1),
            _botaoPadrao("2", _onPressedVelocidade2),
          ]),
          _row(<Widget>[
            _botaoPadrao("REV", _onPressedRev),
            _botaoPadrao("3", _onPressedVelocidade3),
          ])
        ],
      ),
    );
  }
  _timers(){
    return Container(
      constraints: BoxConstraints.expand(height: 120),
      //color: Colors.black,
      child: ListView(
        children: <Widget>[
          _row(<Widget>[
            _botaoPadrao("1Hr", _onPressedTimer1),
            _botaoPadrao("2Hr", _onPressedTimer2),
          ]),
          _row(<Widget>[
              _botaoPadrao("4Hr", _onPressedTimer4),
              _botaoPadrao("8Hr", _onPressedTimer8),
            ],
          ),
        ],
      ),
    );
  }
  _botoesMaiores(){
    return Container(
      constraints: BoxConstraints.expand(height: 240),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          _column(<Widget>[
            _botaoMaior("LUZ", _onPressedLuz),
            _botaoMaior("DESLIGA", _onPressedDesliga),
          ])
        ],
      ),
    );
  }

  _onPressedVelocidade1(){

  }

  _onPressedVelocidade2(){

  }

  _onPressedVelocidade3(){

  }

  _onPressedRev(){

  }

  _onPressedTimer1(){

  }

  _onPressedTimer2(){

  }

  _onPressedTimer4(){

  }

  _onPressedTimer8(){

  }

  _onPressedLuz(){

  }

  _onPressedDesliga(){

  }

}
