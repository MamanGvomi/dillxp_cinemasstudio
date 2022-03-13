import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HTTPUtility {

  static String login= "";
  static String mdp = "";
  static const CONNEXION_ROUTE = "/user/login";
  //static final IP_SERVEUR = "185.163.127.24";
  static const IP_SERVEUR = "http://192.168.0.16:8080";


  static Future<bool> connexion() async{
    final response = await http.get(
      Uri.parse(IP_SERVEUR+CONNEXION_ROUTE),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: "Basic "+login+" "+mdp,
      },
    );

    if (response.statusCode == HttpStatus.ok){
      return true;
    }
    return false;
  }

  static void test () async{
    final response = await http.get(
      Uri.parse(IP_SERVEUR)
    );

    print(response.statusCode);
    print(response.body);
  }


}
