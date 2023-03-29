import '../Models/client.dart';
import 'dart:io';
import 'dart:convert';

import '../Models/compte.dart';

class ClientData {
  static String fileUrl = "Kofbank.json";

  static List<Client> Clients = [];

  static void UpdateJsonFile() {
    final File file = File(fileUrl);
    var data = Clients.map((e) => e.toJson()).toList();
    file.writeAsStringSync(json.encode(data));
  }

  static Future<void> LoadDataFromFile() async {
    final File file = File(fileUrl); //load the json file
    await readClientData(file); //read data from json file
  }

  static Future<void> readClientData(File file) async {
    String contents = await file.readAsString();
    var jsonResponse = jsonDecode(contents);
    //print(jsonResponse);
    for (var p in jsonResponse) {
      Client cli = Client(
          nom: p["nom"],
          prenom: p["prenom"],
          dateNaissance: DateTime.parse(p["dateNaissance"]),
          telephone: p["telephone"],
          adresse: p["adresse"],
          compte: Compte.fromJson(p["compte"]));
      Clients.add(cli);
    }
  }

  static afficherListeClient() {
    sortClientListe();
    print("Voici la liste des clients disponibles");
    Clients.forEach((element) {
      print(element.toString());
    });
  }

  static sortClientListe() {
    Clients.sort((x, y) => x.nom.compareTo(y.nom));
  }
}
