import '../Models/client.dart';

class ClientData {
  static List<Client> Clients = [];

  static afficherListeClient() {
    sortClientListe();
    print("Voici la liste des clients disponibles : \n");
    Clients.forEach((element) {
      print(element.toString());
    });
    print("\n");
  }

  static sortClientListe() {
    Clients.sort((x, y) => x.nom.compareTo(y.nom));
  }
}
