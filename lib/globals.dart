import 'dart:typed_data';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dartssh2/dartssh2.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:icebotweb/dashboard.dart';
import 'package:icebotweb/guildselect.dart';
import 'package:icebotweb/home.dart';
import 'package:icebotweb/login.dart';
import 'package:icebotweb/oauth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

Color logoBlue = Color.fromARGB(255, 96, 230, 249);
Color themeDarkBlue = Color.fromARGB(255, 17, 85, 94);
Color discordPurple = Color.fromARGB(255, 114, 137, 218);
Color themeWhite = Color.fromARGB(255, 237, 241, 241);
Color themeGrey = Color.fromARGB(255, 26, 34, 51);
Color themeUIGrey = Color.fromARGB(255, 20, 26, 41);
Color themeDarkgrey = Color.fromARGB(255, 16, 13, 32);
Color themeDarkergrey = Color.fromARGB(255, 5, 4, 10);

//Discord
String discCode = '';
String discAccessToken = '';
String discAccessTokenType = '';
Map getUserResponse = {};
List getUserGuildsResponse = [];
List guildRoles = [];
bool userResponse = false;
Map statsContent = {};
Map warnsContent = {};
List userAllowedServers = [];
List userBotAllowedServers = [];
String discordBotAuth = "Bot TOKEN";

Map selectedGuild = {};

//Tab Screens Bools
bool moderationTab = true;

//Moderation Tab
TextEditingController muteAfter = TextEditingController();
TextEditingController unmuteAfter = TextEditingController();
TextEditingController banAfter = TextEditingController();
TextEditingController bannedWords = TextEditingController();
TextEditingController allowedLinks = TextEditingController();
bool warningSystemBool = false;
bool autoMuteBool = false;
bool deleteMuteMsgBool = false;
bool autoBanBool = false;
bool banWordsBool = false;
bool banLinksBool = false;

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/Process_Oauth',
      builder: (context, state) => const Oauth(),
    ),
    GoRoute(
      path: '/ServerSelect',
      builder: (context, state) => ServerSelect(),
    ),
    GoRoute(
      path: '/Dashboard',
      builder: (context, state) => Dashboard(),
    ),
  ],
);

Future<void> getStatsContent() async {
  final storage = FirebaseStorage.instance;

  final storageRef = FirebaseStorage.instance.ref();

  final statsRef = storageRef.child("stats.json");

  const oneMegabyte = 1024 * 1024;
  final Uint8List? data = await statsRef.getData(oneMegabyte);

  var statsData = Utf8Decoder().convert(data!);

  statsContent = json.decode(statsData);
}

Future<void> getWarnsContent() async {
  final storage = FirebaseStorage.instance;

  final storageRef = FirebaseStorage.instance.ref();

  final statsRef = storageRef.child("warns.json");

  const oneMegabyte = 1024 * 1024;
  final Uint8List? data = await statsRef.getData(oneMegabyte);

  var statsData = Utf8Decoder().convert(data!);

  warnsContent = json.decode(statsData);
}

Future<void> loadConfigScreen(String guildId) async {
  warningSystemBool = statsContent[guildId]['WarnsSystem'];
  autoMuteBool = statsContent[guildId]['AutoMute'];
  deleteMuteMsgBool = statsContent[guildId]["DeleteMuteMessages"];
  autoBanBool = statsContent[guildId]["AutoBan"];
  banWordsBool = statsContent[guildId]['BanWords'];
  banLinksBool = statsContent[guildId]['BanLinks'];
  muteAfter.text =
      statsContent[guildId]["WarnsVariables"]["MuteWCount"].toString();
  unmuteAfter.text =
      statsContent[guildId]["WarnsVariables"]["MuteTime"].toString();
  banAfter.text =
      statsContent[guildId]["WarnsVariables"]["BanWCount"].toString();
  bannedWords.text = statsContent[guildId]["BannedWords"].toString();
  allowedLinks.text = statsContent[guildId]["AllowedLinks"].toString();
}

// Future<void> saveButton(String guildId) async {
//   //Moderation Screen
//   final storage = FirebaseStorage.instance;

//   final storageRef = FirebaseStorage.instance.ref();

//   final statsRef = storageRef.child("stats.json");

//   statsContent[guildId]['WarnsSystem'] = warningSystemBool;
//   statsContent[guildId]['AutoMute'] = autoMuteBool;
//   statsContent[guildId]["DeleteMuteMessages"] = deleteMuteMsgBool;
//   statsContent[guildId]["AutoBan"] = autoBanBool;
//   statsContent[guildId]['BanWords'] = banWordsBool;
//   statsContent[guildId]['BanLinks'] = banLinksBool;
// }

Future<void> testOauth(String code) async {
  var url = 'http://localhost:3000/api/oauth2/token/${code}';

  var client = new http.Client();

  var uriResponse = await client.post(
    Uri.parse(url),
);
  Map response = json.decode(uriResponse.body);

  print(response);

  discAccessToken = response['access_token'];
  discAccessTokenType = response['token_type'];

  print("Disc Access Token: " + discAccessToken);
}

Future<void> getUser() async {
  var url = 'http://localhost:3000/api/users/@me/${discAccessTokenType}/${discAccessToken}';

  var client = http.Client();

  var uriResponse = await client.get(Uri.parse(url));
  Map response = json.decode(uriResponse.body);

  getUserResponse = response;

  userResponse = true;

  print(getUserResponse['username']);
}

Future<void> getUserGuilds() async {
  var url = http://localhost:3000/api/users/@me/${discAccessTokenType}/${discAccessToken};

  var client = http.Client();

  var uriResponse = await client.get(Uri.parse(url));
  var response = json.decode(uriResponse.body);

  getUserGuildsResponse = response;

  var client2 = http.Client();
  var url2 = 'http://localhost:3000/api/users/@bot/guilds';
  var uriResponse2 = await client2.get(Uri.parse(url2));

  var response2 = json.decode(uriResponse2.body);

  var getBotGuildsResponse = response2;

  bool found = false;

  for (var guild in getUserGuildsResponse) {
    if (guild['permissions'] == "4398046511103") {
      for (var botguild in getBotGuildsResponse) {
        if (guild['id'] == botguild["id"]) {
          found = true;
          if (guild['icon'] == null) {}
          break;
        } else {
          found = false;
        }
      }

      if (found) {
        userAllowedServers.add(guild);
      } else {
        userBotAllowedServers.add(guild);
      }
    }
  }
}

Future<void> getGuildRoles(String guildid) async {
  var client2 = http.Client();
  var url2 = 'http://localhost:3000/api/guilds/${guildid}/roles;

  var uriResponse2 = await client2.get(Uri.parse(url2));

  var response= json.decode(uriResponse2.body);
  
  for (role in response){
    guildRoles.add({'name':role['name'],'id':role['id']})
  }
}

double width = 1920;
double height = 1080;

Future<void> getScreenSize(context) async {
  width = MediaQuery.of(context).size.width;
  height = MediaQuery.of(context).size.height;
}

//Dashboard

Map dashboardItems = {};


// Future<void> getUser() async {
//   var url = 'https://localhost:3000/api/users/@bot';

//   var client = new http.Client();

//   var uriResponse = await client.get(Uri.parse(url));
//   Map response = json.decode(uriResponse.body);

//   print("########GetUser Response:" + uriResponse.body);

//   getUserResponse = response;
// }
