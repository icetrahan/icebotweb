import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:icebotweb/login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import "package:icebotweb/globals.dart" as globals;

class ServerSelect extends StatefulWidget {
  ServerSelect({Key? key}) : super(key: key);

  static const String route = '/ServerSelect';

  @override
  State<ServerSelect> createState() => _ServerSelectState();
}

class _ServerSelectState extends State<ServerSelect> {
  bool image = false;
  bool displayEither = true;
  bool displayExisting = true;
  bool displayAdd = true;

  void initstate() {
    check();
    globals.getScreenSize(context);
    setState(() {});
  }

  void check() async {
    if ((globals.userAllowedServers.length > 0) |
        (globals.userBotAllowedServers.length > 0)) {
      displayEither = false;
    }
    if (globals.userAllowedServers.length > 0) {
      displayExisting = false;
    }
    if ((globals.userAllowedServers.length > 0) |
        (globals.userBotAllowedServers.length > 0)) {
      displayAdd = false;
    }

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
              Image.asset(
                filterQuality: FilterQuality.high,
                "LogoCharacter.png",
                width: 60,
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                child: Row(
                  children: const [
                    Icon(Icons.space_dashboard),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Logout",
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
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome " + globals.getUserResponse["username"] + "!",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(
                        "https://cdn.discordapp.com/avatars/" +
                            globals.getUserResponse["id"] +
                            "/" +
                            globals.getUserResponse["avatar"] +
                            ".png",
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                displayEither
                    ? Divider(
                        thickness: 2,
                        color: globals.logoBlue,
                        indent: 40,
                        endIndent: 40,
                      )
                    : Container(),
                displayEither
                    ? SizedBox(
                        height: 10,
                      )
                    : Container(),
                displayEither
                    ? Text(
                        "Please select a server from below",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Container(
                        width: 750,
                        child: Text(
                          "It seems you aren't an administrator in any server...\n\n You'll need to be an admin in a server to add Icebot to the server or use the Icebot Dashboard.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                displayEither
                    ? SizedBox(
                        height: 20,
                      )
                    : SizedBox(height: 100),
                displayExisting
                    ? Text(
                        "Existing IceBot Servers",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                displayExisting
                    ? ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 200.0, right: 200, top: 20, bottom: 20),
                        itemCount: globals.userAllowedServers.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (globals.userAllowedServers[index]["icon"] ==
                              null) {
                            image = false;
                          } else {
                            image = true;
                          }
                          return Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            height: 125,
                            child: Card(
                              shadowColor: globals.themeDarkgrey,
                              color: globals.logoBlue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 50),
                                      image
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(75.0),
                                              child: Image.network(
                                                "https://cdn.discordapp.com/icons/" +
                                                    globals.userAllowedServers[
                                                        index]["id"] +
                                                    "/" +
                                                    globals.userAllowedServers[
                                                        index]["icon"] +
                                                    ".png",
                                                width: 75,
                                                fit: BoxFit.cover,
                                              ))
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(75.0),
                                              child: Image.asset(
                                                'DefaultIcon.jpg',
                                                width: 75,
                                                fit: BoxFit.cover,
                                              )),
                                      SizedBox(width: 25),
                                      Text(
                                        "Server Name: " +
                                            globals.userAllowedServers[index]
                                                ["name"],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          globals.selectedGuild =
                                              globals.userAllowedServers[index];
                                          await globals.getStatsContent();
                                          await globals.loadConfigScreen(
                                              globals.selectedGuild["id"]);
                                          await globals.getGuildRoles(
                                              globals.selectedGuild["id"]);

                                          GoRouter.of(context).go('/Dashboard');
                                        },
                                        child: Container(
                                          height: 75,
                                          width: 225,
                                          decoration: BoxDecoration(
                                              color: globals.themeDarkBlue,
                                              border: Border.all(
                                                  color: globals.themeDarkgrey,
                                                  style: BorderStyle.solid,
                                                  width: 5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.edit_rounded,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Configure",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 50),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Container(),
                displayAdd
                    ? Divider(
                        thickness: 2,
                        color: globals.logoBlue,
                        indent: 20,
                        endIndent: 20,
                      )
                    : Container(),
                displayAdd
                    ? SizedBox(
                        height: 20,
                      )
                    : Container(),
                displayAdd
                    ? Text(
                        "Add IceBot to a Server",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                displayAdd
                    ? SizedBox(
                        height: 10,
                      )
                    : Container(),
                displayAdd
                    ? ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 200.0, right: 200, top: 20, bottom: 20),
                        itemCount: globals.userBotAllowedServers.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (globals.userBotAllowedServers[index]["icon"] ==
                              null) {
                            image = false;
                          } else {
                            image = true;
                          }
                          return Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            height: 125,
                            child: Card(
                              shadowColor: globals.themeDarkgrey,
                              color: globals.logoBlue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 25),
                                      image
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(75.0),
                                              child: Image.network(
                                                "https://cdn.discordapp.com/icons/" +
                                                    globals.userBotAllowedServers[
                                                        index]["id"] +
                                                    "/" +
                                                    globals.userBotAllowedServers[
                                                        index]["icon"] +
                                                    ".png",
                                                width: 75,
                                                fit: BoxFit.cover,
                                              ))
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(75.0),
                                              child: Image.asset(
                                                'DefaultIcon.jpg',
                                                width: 75,
                                                fit: BoxFit.cover,
                                              )),
                                      SizedBox(width: 50),
                                      Text(
                                        "Server Name: " +
                                            globals.userBotAllowedServers[index]
                                                ["name"],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          html.window.open(
                                              "https://discord.com/api/oauth2/authorize?client_id=961645349901058059&permissions=8&scope=bot",
                                              "_top");
                                        },
                                        child: Container(
                                          height: 75,
                                          width: 225,
                                          decoration: BoxDecoration(
                                              color: globals.themeDarkBlue,
                                              border: Border.all(
                                                  color: globals.themeDarkgrey,
                                                  style: BorderStyle.solid,
                                                  width: 5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "+",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Add to Server",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 50),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
