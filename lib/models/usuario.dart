import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String uid;
  String telefone;
  String nomeCompleto;
  String email;
  String photoUrl;

  Usuario(
      {this.telefone = "",
      this.email, this.nomeCompleto, this.photoUrl, this.uid,});

  Map<String, dynamic> toJson() => {
        'NomeCompleto': nomeCompleto,
        'email': email,
        'photoURL': photoUrl,
        'Telefone': telefone
      };

  Usuario.fromJson(Map<String, dynamic> json) {
    nomeCompleto = json["NomeCompleto"];
    email = json["email"];
    photoUrl = json["photoURL"];
    telefone = json["Telefone"];
  }

  Usuario.fromDocumentSnapshot(DocumentSnapshot snapshot)
      : uid = snapshot.id,
        nomeCompleto = snapshot.data()['NomeCompleto'],
        telefone = snapshot.data()['Telefone'],
        email = snapshot.data()['email'],
        photoUrl = snapshot.data()['photoURL'];
}
