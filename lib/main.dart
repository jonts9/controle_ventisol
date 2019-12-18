import 'package:controle_ventisol/size_config.dart';
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
    SystemChrome.setPreferredOrientations([
      //DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);

    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(8),
          color: Colors.white70,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "VELOCIDADES",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6
                ),
              ),
              _buildContainerVelocidades(),
              _buildContainerTimers(),
              _buildContainerBotoesMaiores(),
              _buildContainerLogo(),
            ],
          ),
        )
      )
    );
  }

  _buildContainerVelocidades() {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _botaoPadrao("1", _onPressedVelocidade1),
                _botaoPadrao("2", _onPressedVelocidade2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _botaoPadrao("REV", _onPressedRev),
                _botaoPadrao("3", _onPressedVelocidade3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildContainerTimers() {
    return Expanded(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _botaoPadrao("1 Hr", _onPressedTimer1),
                _botaoPadrao("2 Hr", _onPressedTimer2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _botaoPadrao("4 Hr", _onPressedTimer4),
                _botaoPadrao("8 Hr", _onPressedTimer8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildContainerBotoesMaiores(){
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _botaoMaior("LUZ", _onPressedLuz)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _botaoMaior("DESLIGA", _onPressedDesliga)
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildContainerLogo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image(
            image: AssetImage(
              'assets/images/logo-ventisol.png'
            ),
            height: SizeConfig.blockSizeVertical * 4,
          )
        ],
      ),
    );
  }

  _botaoPadrao(text, onPressed){
    return ButtonTheme(
      minWidth: SizeConfig.blockSizeHorizontal * 30,
      height: SizeConfig.blockSizeVertical * 7,
      child: new RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.blockSizeVertical * 3
          ),
        ),
        color: Colors.white38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50)
          ),
          side: BorderSide(
            width: 1,
            color: Colors.black12
          ),
        ),
      ),
    );
  }

  _botaoMaior(text, onPressed){
    return ButtonTheme(
      minWidth: SizeConfig.blockSizeHorizontal * 45,
      height: SizeConfig.blockSizeVertical * 7,
      child: new RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.blockSizeVertical * 3
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50)
          ),
          side: BorderSide(
            width: 1,
            color: Colors.black12
          )
        ),
      ),
    );
  }

  _onPressedVelocidade1() => _sendIr(v1);
  _onPressedVelocidade2() =>_sendIr(v2);
  _onPressedVelocidade3() => _sendIr(v3);
  _onPressedRev() => _sendIr(rev);
  _onPressedTimer1() => _sendIr(t1);
  _onPressedTimer2() => _sendIr(t2);
  _onPressedTimer4() => _sendIr(t4);
  _onPressedTimer8() => _sendIr(t8);
  _onPressedLuz() => _sendIr(luz);
  _onPressedDesliga() => _sendIr(desliga);

}
