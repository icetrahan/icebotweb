import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:icebotweb/login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import "package:icebotweb/globals.dart" as globals;

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  static const String route = '/Dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void initstate() {
    globals.getScreenSize(context);
    setState(() {});
  }

  toggleSwitch(bool toggle) {
    print(toggle);
    if (toggle == false) {
      toggle = true;
      setState(() {});
    } else {
      toggle = false;
      setState(() {});
    }
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
        body: Row(
          children: [
            Container(
              color: globals.themeUIGrey,
              height: double.maxFinite,
              width: globals.width * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(Icons.security),
                    title: const Text('Moderation'),
                    onTap: () {},
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(
                      Icons.settings,
                    ),
                    title: const Text('Server'),
                    onTap: () {},
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(
                      Icons.bar_chart,
                    ),
                    title: const Text('Server Stats'),
                    onTap: () {},
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(
                      Icons.receipt_long,
                    ),
                    title: const Text('Ticket System'),
                    onTap: () {},
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(
                      Icons.attach_money,
                    ),
                    title: const Text('Economy'),
                    onTap: () {},
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(
                      Icons.chat,
                    ),
                    title: const Text('Levels System'),
                    onTap: () {},
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(
                      Icons.tag_faces,
                    ),
                    title: const Text('Reaction Roles'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            globals.moderationTab
                ? SingleChildScrollView(
                    child: Container(
                      width: globals.width * 0.85,
                      color: globals.themeGrey,
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "Moderation",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Toggle Warning System",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        globals.warningSystemBool = value;
                                      });
                                    },
                                    value: globals.warningSystemBool,
                                    activeColor: globals.logoBlue,
                                    activeTrackColor: globals.themeDarkBlue,
                                    inactiveThumbColor:
                                        Color.fromARGB(255, 250, 87, 87),
                                    inactiveTrackColor:
                                        Color.fromARGB(255, 128, 29, 29),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Toggle Auto Mute",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        globals.autoMuteBool = value;
                                      });
                                    },
                                    value: globals.autoMuteBool,
                                    activeColor: globals.logoBlue,
                                    activeTrackColor: globals.themeDarkBlue,
                                    inactiveThumbColor:
                                        Color.fromARGB(255, 250, 87, 87),
                                    inactiveTrackColor:
                                        Color.fromARGB(255, 128, 29, 29),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Auto Mute after how many warnings?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: globals.height * 0.03,
                                    width: globals.width * 0.02,
                                    decoration: BoxDecoration(
                                        color: globals.themeWhite,
                                        border: Border.all(
                                            color: globals.themeDarkergrey,
                                            style: BorderStyle.solid,
                                            width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: TextField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLength: 2,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counter: SizedBox.shrink()),
                                      textAlign: TextAlign.center,
                                      enabled: globals.autoMuteBool,
                                      controller: globals.muteAfter,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Mute Role",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  SizedBox(height: 25),
                                  Text(
                                    "Unmute after how many seconds?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    height: globals.height * 0.03,
                                    width: globals.width * 0.05,
                                    decoration: BoxDecoration(
                                        color: globals.themeWhite,
                                        border: Border.all(
                                            color: globals.themeDarkergrey,
                                            style: BorderStyle.solid,
                                            width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: TextField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLength: 5,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counter: SizedBox.shrink()),
                                      textAlign: TextAlign.center,
                                      enabled: globals.autoMuteBool,
                                      controller: globals.unmuteAfter,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Delete Mute Role Messages?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        globals.deleteMuteMsgBool = value;
                                      });
                                    },
                                    value: globals.deleteMuteMsgBool,
                                    activeColor: globals.logoBlue,
                                    activeTrackColor: globals.themeDarkBlue,
                                    inactiveThumbColor:
                                        Color.fromARGB(255, 250, 87, 87),
                                    inactiveTrackColor:
                                        Color.fromARGB(255, 128, 29, 29),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Auto Ban",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        globals.autoBanBool = value;
                                      });
                                    },
                                    value: globals.autoBanBool,
                                    activeColor: globals.logoBlue,
                                    activeTrackColor: globals.themeDarkBlue,
                                    inactiveThumbColor:
                                        Color.fromARGB(255, 250, 87, 87),
                                    inactiveTrackColor:
                                        Color.fromARGB(255, 128, 29, 29),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Ban after how many warnings?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    height: globals.height * 0.03,
                                    width: globals.width * 0.02,
                                    decoration: BoxDecoration(
                                        color: globals.themeWhite,
                                        border: Border.all(
                                            color: globals.themeDarkergrey,
                                            style: BorderStyle.solid,
                                            width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: TextField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLength: 2,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counter: SizedBox.shrink()),
                                      textAlign: TextAlign.center,
                                      enabled: globals.autoBanBool,
                                      controller: globals.banAfter,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Admin Role",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Toggle Ban Words",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        globals.banWordsBool = value;
                                      });
                                    },
                                    value: globals.banWordsBool,
                                    activeColor: globals.logoBlue,
                                    activeTrackColor: globals.themeDarkBlue,
                                    inactiveThumbColor:
                                        Color.fromARGB(255, 250, 87, 87),
                                    inactiveTrackColor:
                                        Color.fromARGB(255, 128, 29, 29),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Banned Words",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Use a comma to seperate words\n Example: Word1,Word2,Word3",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: globals.height * 0.15,
                                    width: globals.width * 0.18,
                                    decoration: BoxDecoration(
                                        color: globals.themeWhite,
                                        border: Border.all(
                                            color: globals.themeDarkergrey,
                                            style: BorderStyle.solid,
                                            width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: TextField(
                                      maxLines: null,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counter: SizedBox.shrink()),
                                      textAlign: TextAlign.center,
                                      enabled: globals.banWordsBool,
                                      controller: globals.bannedWords,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Toggle Ban Links",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        globals.banLinksBool = value;
                                      });
                                    },
                                    value: globals.banLinksBool,
                                    activeColor: globals.logoBlue,
                                    activeTrackColor: globals.themeDarkBlue,
                                    inactiveThumbColor:
                                        Color.fromARGB(255, 250, 87, 87),
                                    inactiveTrackColor:
                                        Color.fromARGB(255, 128, 29, 29),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Allowed Links",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Use a comma to seperate links\n Example: youtube,google,spotify",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: globals.height * 0.15,
                                    width: globals.width * 0.18,
                                    decoration: BoxDecoration(
                                        color: globals.themeWhite,
                                        border: Border.all(
                                            color: globals.themeDarkergrey,
                                            style: BorderStyle.solid,
                                            width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: TextField(
                                      maxLines: null,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counter: SizedBox.shrink()),
                                      textAlign: TextAlign.center,
                                      enabled: globals.banWordsBool,
                                      controller: globals.bannedWords,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Moderation Roles",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  //Container for text
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
