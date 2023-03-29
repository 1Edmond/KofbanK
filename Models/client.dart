import 'compte.dart';

class Client {
  String nom;
  String prenom;
  String telephone;
  String adresse;
  DateTime dateNaissance;
  Compte compte;

  Client(
      {required this.nom,
      required this.prenom,
      required this.telephone,
      required this.adresse,
      required this.dateNaissance,
      required this.compte});

  @override
  String toString() {
    return "Nom : " +
        nom +
        ", prénom : " +
        prenom +
        ", adresse : " +
        adresse +
        ", " +
        compte.toString();
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        nom: json['nom'],
        prenom: json['prenom'],
        telephone: json['telephone'],
        adresse: json['adresse'],
        dateNaissance: json['dateNaissance'],
        compte: json['compte']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['adresse'] = this.adresse;
    data['prenom'] = this.prenom;
    data['telephone'] = this.telephone;
    data['dateNaissance'] = this.dateNaissance.toString();
    data['compte'] = this.compte.toJson();
    return data;
  }
}
