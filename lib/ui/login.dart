import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
  
}

class LoginState extends State<Login> {

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = '';

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelocme(){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "Nothing";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        // centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            //image
            Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),
            //form
            Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: ListView(
                children: [
                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      icon: Icon(Icons.person)
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.lock)
                    ),
                    obscureText: true,//password
                  ),
                  const Padding(padding: EdgeInsets.all(10.5)),
                  Center(
                    child: Row(
                      children: [
                        //Login Button
                        Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: ElevatedButton(
                              onPressed: _showWelocme,
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent
                              ),
                              child: const Text("Login",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 16.9),)
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 120.0),
                          child: ElevatedButton(
                              onPressed: _erase,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                              ),
                              child: const Text("Clear",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 16.9),)
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(14.5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Welcome, $_welcomeString",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w400

                ),)
              ],
            )

          ],
        ),
      ),
    );
  }
}