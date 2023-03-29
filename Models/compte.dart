enum TypeCompte { COURANT, EPARGNE }

class Compte {
  String numCompte;

  double solde;

  DateTime dateCreat;

  TypeCompte typeCompte;

  Compte(
      {required this.numCompte,
      required this.solde,
      required this.dateCreat,
      required this.typeCompte});

  void faireDepot(double montant) {
    this.solde += montant;
  }

  faireRetrait(double montant) {
    if (this.solde >= montant) {
      this.solde -= montant;
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return "Numéro de compte " +
        numCompte +
        " solde : " +
        solde.toString() +
        " type de compte : " +
        typeCompte.name +
        "\n";
  }

  faireTransfert(Compte destinataire, double montant) {
    if (faireRetrait(montant)) {
      destinataire.faireDepot(montant);
      return true;
    }
    return false;
  }

  factory Compte.fromJson(Map<String, dynamic> json) {
    return Compte(
        numCompte: json['numCompte'],
        solde: json["solde"],
        dateCreat: DateTime.parse(json["dateCreat"]),
        typeCompte: TypeCompte.values.elementAt(json["typeCompte"]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numCompte'] = this.numCompte;
    data['solde'] = this.solde;
    data['dateCreat'] = this.dateCreat.toString();
    data['typeCompte'] = this.typeCompte.index;
    return data;
  }
}
