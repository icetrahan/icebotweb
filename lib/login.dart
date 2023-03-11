import 'package:flutter/src/widgets/framework.dart';
import 'dart:html' as html;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import "package:icebotweb/globals.dart" as globals;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const String route = '/Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void initstate() {
    globals.getScreenSize(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: globals.themeDarkgrey,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    filterQuality: FilterQuality.high,
                    "HeaderLogo.png",
                    width: 150,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text("IceBot"),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text("Join Our Discord"),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text("Commands"),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text("Add to Server"),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.space_dashboard),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Dashboard"),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: globals.themeGrey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        html.window.open(
                            "https://discord.com/api/oauth2/authorize?client_id=961645349901058059&redirect_uri=http%3A%2F%2Ficebot.xyz%2FProcess_Oauth&response_type=code&scope=identify%20guilds",
                            "_top");
                      },
                      child: Container(
                        height: 50,
                        width: 175,
                        decoration: BoxDecoration(
                            color: globals.discordPurple,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.discord_outlined,
                              color: globals.themeWhite,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Login with Discord",
                              style: TextStyle(
                                color: globals.themeWhite,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
