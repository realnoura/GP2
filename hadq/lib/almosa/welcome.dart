import 'package:hadq/almosa/register.dart';
import 'package:flutter/material.dart';
import 'package:hadq/almosa/login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 107, 221, 236),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('asset/hadq.png')),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.login_rounded),
                            title: Text('Login'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.app_registration_rounded),
                            title: Text('Register'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Register()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
