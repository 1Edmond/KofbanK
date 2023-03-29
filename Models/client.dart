import 'compte.dart';


class Client {

  String nom;
  String prenom;
  String telephone;
  String adresse;
  DateTime dateNaissance;
  Compte compte;

  Client(this.nom, this.prenom, this.telephone, this.adresse,
      this.dateNaissance, this.compte);

  @override
  String toString() {
    return "Nom : "+ nom + ", prénom : " + prenom + " adresse : " + adresse +" " + compte.toString();
  }
}
