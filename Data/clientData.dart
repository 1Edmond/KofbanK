import '../Models/client.dart';

class ClientData {
  static List<Client> Clients = [];

  static afficherListeClient() {
    sortClientListe();
    Clients.forEach((element) {
     print(element.toString());
    });
  }

  static sortClientListe() {
    Clients.sort((x, y) => x.nom.compareTo(y.nom));
  }
}
