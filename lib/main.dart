import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  static const platform = const MethodChannel('jonts9.com/controle_ventisol');
  var carrierFrequency = 38400;

  var v1 = [9300,4650,655,610,675,565,700,550,700,550,695,1605,665,565,700,550,700,550,695,1610,670,1615,635,1615,630,1625,625,575,700,1600,650,1615,635,1615,630,570,700,1600,650,565,700,550,700,1600,675,565,700,550,700,550,695,1610,670,565,700,1600,650,1615,635,565,700,1600,655,1610,635,1615,635];
  var v2 = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,645,1610,620,1630,625,575,700,1600,650,1600,645,1605,625,575,700,1600,650,1600,645,555,700,1600,650,550,700,550,700,550,700,1600,700,550,700,550,700,1600,700,550,700,1600,650,1600,650,1600,645];
  var rev = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,625,1625,615,585,700,1600,650,1600,645,1605,630,570,700,550,700,1600,700,550,700,1600,650,550,700,550,700,550,700,1600,700,1600,650,550,700,1600,650,550,700,1600,650,1600,650,1600,645];
  var v3 = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,605,1645,600,600,700,1600,650,1600,630,1620,610,590,700,1600,650,550,700,1600,650,1600,650,550,700,550,700,550,700,1600,700,550,700,1600,650,550,700,550,700,1600,700,1600,650,1600,640];
  var t1 = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,640,1610,600,1650,600,600,700,1600,650,1600,630,1620,605,1650,600,1660,600,600,700,550,700,1600,700,550,700,550,700,550,700,550,700,550,700,1600,700,1600,650,550,700,1600,650,1600,650,1600,640];
  var t2 = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,550,700,550,700,550,700,1600,700,1600,650,550,700,550,700,550,700,1600,700,1600,650,1600,650,550,700,550,700,1600,700,1600,650,1600,650];
  var t4 = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,550,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650];
  var t8 = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,1600,650,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,550,700,1600,650,1600,650,1600,650];
  var luz = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,645,1605,645,555,700,1600,650,1600,650,1600,645,1605,645,1605,650,1600,650,1600,650,1600,650,550,700,550,700,550,700,550,700,550,700,550,700,550,700,550,700,1600,700,1600,650,1600,650];
  var desliga = [9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,1600,650,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,550,700,1600,700,1600,650,1600,650];

  Future<void> _sendIr(pattern) async {
    try {
      final String result = await platform.invokeMethod('sendIr',{"carrierFrequency":carrierFrequency, "pattern":pattern});
    } on PlatformException catch (e) {
    }
  }

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
      color: Colors.black,
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
    _sendIr(v1);
  }

  _onPressedVelocidade2(){
    _sendIr(v2);
  }

  _onPressedVelocidade3(){
    _sendIr(v3);
  }

  _onPressedRev(){
    _sendIr(rev);
  }

  _onPressedTimer1(){
    _sendIr(t1);
  }

  _onPressedTimer2(){
    _sendIr(t2);
  }

  _onPressedTimer4(){
    _sendIr(t4);
  }

  _onPressedTimer8(){
    _sendIr(t8);
  }

  _onPressedLuz() => _sendIr(luz);

  _onPressedDesliga(){
    _sendIr(desliga);
  }

}
