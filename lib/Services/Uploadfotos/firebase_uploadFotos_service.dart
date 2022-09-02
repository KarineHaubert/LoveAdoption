import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:loveadoption/Services/publicacao/publicacao_service.dart';
import 'package:loveadoption/models/cadastroPet.dart';
import 'package:uuid/uuid.dart';

class CloudStorageService {
  Future<CloudStorageResult> uploadImage({@required File imageUpload}) async {
    String path = Uuid().v1();

    final Reference reference =
        FirebaseStorage.instance.ref().child('images/$path');

    UploadTask uploadTask = reference.putFile(imageUpload);
    TaskSnapshot snapshot = await uploadTask;

    var downloadUrl = await snapshot.ref.getDownloadURL();

    var url = downloadUrl.toString();
    return CloudStorageResult(
      imageUrl: url,
    );
  }

  Future<CloudStorageResult> updateImage(
      {@required File imageUpload, String petUid}) async {
    String path = Uuid().v1();
    final db = FirebaseFirestore.instance;

    await CadastroPetService().getPetsByUid(petUid);

    final Reference reference =
        FirebaseStorage.instance.ref().child('images/$path');

    UploadTask uploadTask = reference.putFile(imageUpload);
    TaskSnapshot snapshot = await uploadTask;

    var downloadUrl = await snapshot.ref.getDownloadURL();

    var url = downloadUrl.toString();

    DocumentReference ref = db.collection('CadastrosPet').doc(petUid);
    await ref.update({
      'photoURL': url,
    });
  }
}

//   final db = FirebaseFirestore.instance;
//   final uEmail = await AuthService().

//   String path = Uuid().v1();

//     //Input the link to your own firebase storage bucket
//     final Reference ref =
//         FirebaseStorage.instance.ref().child('images/$path');

//     String filePath = 'userImages/$uEmail.png';

//     UploadTask uploadTask = _storage.ref().child(filePath).putFile(file);

//     StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;

//     var ref = storageTaskSnapshot.ref;
//     var profilePhoto = await ref.getDownloadURL();

//     print(profilePhoto);

//     CollectionReference profileRef =
//         db.collection("userData").doc(uEmail).collection("profile");
//     await profileRef.doc(uEmail).update(
//       {
//         'profilePhoto': profilePhoto,
//       },

//   }

//   class AuthService {
// }
