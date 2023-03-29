import 'dart:io';
import 'dart:math';

import 'Data/clientData.dart';
import 'Models/client.dart';
import 'Models/compte.dart';

void main() {
  String response = "OUI";
  while (response == "OUI") {
    faireOperation();
    print("Voulez-vous continuer OUI / NON ?");
    response = stdin.readLineSync().toString();
    while (response != "OUI" && response != "NON") {
      print("Erreur, réessayez OUI / NON");
      response = stdin.readLineSync().toString();
    }
  }
}

faireOperation() {
  afficherMenu();

  int userResponse = int.parse(stdin.readLineSync().toString());

  while (userResponse > 5 || userResponse < 1) {
    afficherMenu();
    userResponse = int.parse(stdin.readLineSync().toString());
  }
  try {
    switch (userResponse) {
      case 1:
        ajouterClient();
        break;
      case 2:
        afficherClients();
        break;
      case 3:
        faireDepot();
        break;
      case 4:
        faireRetrait();
        break;
      case 5:
        transfererArgent();
        break;
    }
  } catch (e) {
    print(e.toString());
  }
}

afficherMenu() {
  print("--------------- Bienvenue sur KOFBANK ----------");
  print("1 - Ajouter un client");
  print("2 - Lister les clients ");
  print("3 - Faire un dépôt ");
  print("4 - Faire un retrait");
  print("5 - Transférer de l'argent\n");
  print("Bonjour, Quelle opération voulez-vous effectuer?");
}

ajouterClient() {
  ClientData.Clients.add(demanderClientInformation());
  print("Ajout réussi");
}

demanderClientInformation() {
  print("Saisissez les informations suivantes");
  print("----- Nom ------");
  var nomClient = stdin.readLineSync().toString();
  print("----- Prénom ------");
  var prenomClient = stdin.readLineSync().toString();
  print("----- Date de naissance aaaa-mm-jj ------");
  var dateNaissanceClient = DateTime.parse(stdin.readLineSync().toString());
  print("----- Adresse ------");
  var addresseClient = stdin.readLineSync().toString();
  print("----- Téléphone ------");
  var telephoneClient = stdin.readLineSync().toString();
  var numCompte = generateNumCompte(nomClient, prenomClient);
  var typeCompte = demanderTypeCompte();
  var compte = new Compte(numCompte, 0, DateTime.now(), typeCompte);
  return new Client(nomClient, prenomClient, telephoneClient, addresseClient,
      dateNaissanceClient, compte);
}

generateNumCompte(String nom, String prenom) {
  return "KOFBANK-" +
      nom[0] +
      prenom[0] +
      "-" +
      Random().nextInt(1000).toString();
}

demanderTypeCompte() {
  print("----- Quel type de compte voulez-vous? ------");
  print("1 : Courant");
  print("2 : Epargne");
  int userResponse = int.parse(stdin.readLineSync().toString());
  while (userResponse > 2 || userResponse < 1) {
    print("-----Saisissez une valeur correcte ------");
    userResponse = int.parse(stdin.readLineSync().toString());
  }
  return TypeCompte.values.elementAt(userResponse - 1);
}

afficherClients() {
  ClientData.afficherListeClient();
}

faireDepot() {
  print("Saisissez les informations demandées pour faire le dépôt");
  print("Numéro de compte");
  String numeroCompte = stdin.readLineSync().toString();
  while (ClientData.Clients.where(
          (client) => client.compte.numCompte == numeroCompte).length ==
      0) {
    print("Erreur, numéro de compte inconnu");
    numeroCompte = stdin.readLineSync().toString();
  }
  var client =
      ClientData.Clients.firstWhere((x) => x.compte.numCompte == numeroCompte);
  print("2 - Montant à déposer");
  var soldeDepot = double.parse(stdin.readLineSync().toString());
  while (soldeDepot <= 0) {
    print("Erreur, le montant à déposer doit être supérieur à 0.");
    soldeDepot = double.parse(stdin.readLineSync().toString());
  }
  client.compte.faireDepot(soldeDepot);
}

faireRetrait() {
  print("Saisissez les informations demandées pour faire le retrait");
  print("Numéro de compte");
  String numeroCompte = stdin.readLineSync().toString();
  while (ClientData.Clients.where(
          (client) => client.compte.numCompte == numeroCompte).length ==
      0) {
    print("Erreur, numéro de compte inconnu");
    numeroCompte = stdin.readLineSync().toString();
  }
  var client =
      ClientData.Clients.firstWhere((x) => x.compte.numCompte == numeroCompte);
  print("2 - Montant à retirer");
  var soldeDepot = double.parse(stdin.readLineSync().toString());
  while (soldeDepot <= 0) {
    print("Erreur, le montant à retirer doit être supérieur à 0.");
    soldeDepot = double.parse(stdin.readLineSync().toString());
  }
  var rep = client.compte.faireRetrait(soldeDepot);
  if (rep)
    print("Retrait effectué avec succès.");
  else
    print("Solde du compte insuffisant pour faire le retrait.");
}

transfererArgent() {
  print("Saisissez les informations demandées pour faire le transfert");
  print("Votre numéro de compte");
  String numeroCompte = stdin.readLineSync().toString();
  while (ClientData.Clients.where(
          (client) => client.compte.numCompte == numeroCompte).length ==
      0) {
    print("Erreur, numéro de compte inconnu");
    numeroCompte = stdin.readLineSync().toString();
  }
  var debiteur =
      ClientData.Clients.firstWhere((x) => x.compte.numCompte == numeroCompte);
  print("Numéro de compte du client qui va recevoir l'argent");
  numeroCompte = stdin.readLineSync().toString();
  while (ClientData.Clients.where(
          (client) => client.compte.numCompte == numeroCompte).length ==
      0) {
    print("Erreur, numéro de compte inconnu");
    numeroCompte = stdin.readLineSync().toString();
  }
  var crediteur =
      ClientData.Clients.firstWhere((x) => x.compte.numCompte == numeroCompte);
  print("2 - Montant à transféré");
  var soldeDepot = double.parse(stdin.readLineSync().toString());
  while (soldeDepot <= 0) {
    print("Erreur, le montant à déposer doit être supérieur à 0.");
    soldeDepot = double.parse(stdin.readLineSync().toString());
  }
  if (debiteur.compte.faireTransfert(crediteur.compte, soldeDepot))
    print("L'opération s'est bien passée.");
  else
    print("L'opération s'est bien passée.");
}
