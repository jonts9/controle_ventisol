import 'package:controle_ventisol/ir_command.dart';
import 'package:controle_ventisol/ir_service.dart';
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
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

  _onPressedVelocidade1() => IrService.sendIr(IrCommand.v1);
  _onPressedVelocidade2() => IrService.sendIr(IrCommand.v2);
  _onPressedVelocidade3() => IrService.sendIr(IrCommand.v3);
  _onPressedRev() => IrService.sendIr(IrCommand.rev);
  _onPressedTimer1() => IrService.sendIr(IrCommand.t1);
  _onPressedTimer2() => IrService.sendIr(IrCommand.t2);
  _onPressedTimer4() => IrService.sendIr(IrCommand.t4);
  _onPressedTimer8() => IrService.sendIr(IrCommand.t8);
  _onPressedLuz() => IrService.sendIr(IrCommand.luz);
  _onPressedDesliga() => IrService.sendIr(IrCommand.desliga);

}
