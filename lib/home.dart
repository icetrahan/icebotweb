import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:icebotweb/login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import "package:icebotweb/globals.dart" as globals;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    globals.getScreenSize(context);
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
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/Login');
                },
                child: Row(
                  children: const [
                    Icon(Icons.space_dashboard),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
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
                    Image.asset(
                      "LogoCharacter.png",
                      width: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "\"The Bot That's Too Cold\"",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "An extremely customizable Discord bot for your Discord server moderation and much more!\nIceBot features a simple and easy to use dashboard.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Server management just got a whole lot...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Colder.",
                  style: TextStyle(
                    color: globals.logoBlue,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 75,
                ),
                Text(
                  "IceBot is currently in Beta. IceBot's dev team is working hard daily\nto fix bugs and add new features.\n\nIf you have any issues with IceBot, please open a ticket in our Discord Server",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 1600,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        html.window
                            .open('https://discord.gg/v2bKM3KfSz', "_blank");
                      },
                      icon: Icon(
                        Icons.discord_outlined,
                        color: globals.discordPurple,
                        size: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 1680,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
