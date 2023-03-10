import 'package:flutter/src/widgets/framework.dart';
import 'package:oauth2/oauth2.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:icebotweb/globals.dart" as globals;

class Oauth extends StatefulWidget {
  const Oauth({Key? key}) : super(key: key);

  static const String route = '/Login';

  @override
  State<Oauth> createState() => _OauthState();
}

class _OauthState extends State<Oauth> {
  @override
  void initState() {
    super.initState();

    callToDiscord();

    setState(() {});
  }

  callToDiscord() async {
    try {
      globals.discCode = Uri.base.queryParameters["code"]!;
      print(globals.discCode);
    } catch (e) {}

    globals.getScreenSize(context);

    await globals.testOauth(globals.discCode);

    await globals.getUser();

    await globals.getUserGuilds();

    await Future.delayed(Duration(seconds: 1));

    GoRouter.of(context).go('/ServerSelect');

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
            child: globals.userResponse
                ? Container(
                    color: globals.themeGrey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
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
                                  "Code: " + globals.discCode,
                                  style: TextStyle(
                                    color: globals.themeWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Username: " +
                                      globals.getUserResponse["username"],
                                  style: TextStyle(
                                    color: globals.themeWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: globals.themeGrey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 300,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('IceBotLoading.gif', width: 200)
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Loading...",
                              style: TextStyle(
                                color: globals.themeWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 300,
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}
