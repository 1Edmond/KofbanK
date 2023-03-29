# KofbanK
## Énoncé

Vous êtes engagé comme stagiaire dans la banque de renommée KOFBANK
et le responsable du Service Informatique vous confie la refonte de
l’application de gestion de la banque.
La solution doit permettre à l’opérateur de banque de faire un certain
nombre d’opération.
Veuillez créer application console affichant cette première interface :

![Capture d'écran 2023-03-29 143331](https://user-images.githubusercontent.com/99556348/228555036-be60abf6-166b-44a8-aee5-62f4583e9a4a.png)

En fonction du nombre saisi par l’opérateur, vous lui affichez le processus
correspondant.
Voici quelques informations utiles en fonction du nombre saisi par
l’opérateur :

* 1 – Ajouter un client
Cette option permet de créer un compte client en récupérant ses
informations personnelles (Nom, prénoms, Date de naissance, Téléphone,
Adresse mail) et aussi le type de compte à créer.
Il existe 2 types de comptes (Compte courant et compte épargne). Un
compte doit contenir les informations comme le numéro de compte, le solde
et la date de création.

* 2 – Liste des clients
Cette option permet d’afficher la liste de tous les clients de la banque en
triant cette liste en fonction du nom du client (Ordre croissant) et en
spécifiant le type de compte du client ainsi que son solde actuel.
* 3 – Faire un dépôt
Cette option permet de faire un dépôt d’argent sur le compte d’un client.
Afficher un message à la fin de l’opération

* 4 – Faire un retrait
Cette option permet de faire un retrait d’argent sur le compte d’un client.
Afficher un message à la fin de l’opération.
* 5 – Transférer de l’argent
Cette option permet de transférer de l’argent d’un compte A vers un compte
B en s’assurant que le compte sur lequel on débite possède assez d’argent.
Afficher un message à la fin de l’opération.
Chaque fois après l’opération, demandez à l’opérateur s’il veut effectuer une
autre ou quitter le programme.
