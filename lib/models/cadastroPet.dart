import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroPet {
  String uid;
  String nomePet;
  int tipo;
  String photoURL;
  String userUid;
  String fotoUser;
  String nomeUser;
  String porte;
  String estagioVida;
  String sexo;
  bool vacinado;
  bool castrado;
  bool microchipado;
  String cidade;
  String estado;

  CadastroPet(
      {this.uid,
      this.tipo,
      this.estado,
      this.cidade,
      this.estagioVida,
      this.porte,
      this.sexo,
      this.userUid,
      this.fotoUser,
      this.nomeUser,
      this.nomePet = "",
      this.photoURL = "",
      this.castrado = false,
      this.vacinado = false,
      this.microchipado = false});

  Map<String, dynamic> toJson() => {
        'photoUrl': photoURL,
        'nomePet': nomePet,
        'tipo': tipo,
        'estadoUid': estado,
        'cidadeUid': cidade,
        'estagioVida': estagioVida,
        'porte': porte,
        'sexo': sexo,
        'castrado': castrado,
        'vacinado': vacinado,
        'microchipado': microchipado,
        'userUid': userUid,
        'nomeUser': nomeUser,
        'fotoUser': fotoUser
      };

  CadastroPet.fromJson(Map<String, dynamic> json)
      : photoURL = json['photoUrl'],
        nomePet = json['nomePet'],
        tipo = json['tipo'],
        estado = json['estadoUid'],
        cidade = json['cidadeUid'],
        estagioVida = json['estagioVida'],
        porte = json['porte'],
        sexo = json['sexo'],
        castrado = json['castrado'],
        vacinado = json['vacinado'],
        microchipado = json['microchipado'],
        userUid = json['userUid'],
        fotoUser = json['fotoUser'],
        nomeUser = json['nomeUser'];

  CadastroPet.fromDocumentSnapshot(DocumentSnapshot snapshot)
      : uid = snapshot.id,
        photoURL = snapshot.data()['photoUrl'],
        nomePet = snapshot.data()['nomePet'],
        tipo = snapshot.data()['tipo'],
        estado = snapshot.data()['estadoUid'],
        cidade = snapshot.data()['cidadeUid'],
        estagioVida = snapshot.data()['estagioVida'],
        porte = snapshot.data()['porte'],
        sexo = snapshot.data()['sexo'],
        castrado = snapshot.data()['castrado'],
        vacinado = snapshot.data()['vacinado'],
        microchipado = snapshot.data()['microchipado'],
        userUid = snapshot.data()['userUid'],
        fotoUser = snapshot.data()['fotoUser'],
        nomeUser = snapshot.data()['nomeUser'];

}

class CloudStorageResult {
  final String imageUrl;

  CloudStorageResult({this.imageUrl});
}
