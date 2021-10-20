import 'package:exam_3_flutter/models/users.dart';
import 'package:exam_3_flutter/screens/game_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController gameController = TextEditingController();
  Color? _chooseColor;
  @override
  Widget build(BuildContext context) {
    _chooseColor = _colorList[0];
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "RockPaperScissors",
        style: TextStyle(
          color: Colors.blue[900],
        ),
      ),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/images/main.png"),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Username...",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: gameController,
              decoration: InputDecoration(
                hintText: "Game Length...",
              ),
            ),
          ),
          SizedBox(height: 24.0),
          _colors(),
          SizedBox(height: 65,),
          FloatingActionButton(
            backgroundColor: Colors.blue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: () {
              String username = _usernameController.text;
              int gameLength = int.parse(gameController.text);
              if (username.isEmpty) {
                return;
              }
    
              if(gameController.text.isEmpty) {
                return;
              }
    
              User user = User(username, _chooseColor, gameLength);
              sendData(user);
            },
            child: Text("GO!"),
          ),
          
        ],
      ),
    );
  }

  void sendData(User user) {
    int gameLength = int.parse(gameController.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GamePage(user)));
  }

  Widget _colors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        _colorList.length,
        (index) => InkWell(
          splashColor: Colors.grey,
          child: CircleAvatar(
            backgroundColor: _colorList[index],
          ),
          onTap: () {
            _chooseColor = _colorList[index];
          },
        ),
      ),
    );
  }

  List<Color> _colorList = [
    Colors.black,
    Colors.deepOrange,
    Colors.indigo.shade900,
    Colors.red.shade900,
    Colors.blue.shade900,
    Colors.brown.shade900,
  ];
}
// "https://www.iconspng.com/images/rockpaperscissors/rockpaperscissors.jpg" login rasm asosiy

