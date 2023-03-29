enum TypeCompte { COURANT, EPARGNE }

class Compte {
  String numCompte;

  double solde;

  DateTime dateCreat;

  TypeCompte typeCompte;

  Compte(this.numCompte, this.solde, this.dateCreat, this.typeCompte);

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
    return "Numéro de compte "+ numCompte +" solde : " + solde.toString() + "\n" ;
  }

  faireTransfert(Compte destinataire, double montant) {
    if (faireRetrait(montant)) {
      destinataire.faireDepot(montant);
      return true;
    }
    return false;
  }
}
