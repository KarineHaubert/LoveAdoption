import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:loveadoption/Services/Auth/Auth.dart';
import 'package:loveadoption/models/usuario.dart';

class UserService {
  final CollectionReference _cadastrocollectionReference =
      FirebaseFirestore.instance.collection('Usuarios');


  @override
  Future<Usuario> getUserByTelefone(String telefone) async {
    try {
      await _cadastrocollectionReference
          .where('Telefone', isEqualTo: telefone)
          .get();
    } catch (e) {
      if (e is PlatformException) {
        throw Exception('Erro');
      }
      throw Exception(e.toString());
    }
  }

   @override
  Future<Usuario> getUserByUid(String uid) async {
    try {
      await _cadastrocollectionReference
          .where('uid', isEqualTo: uid)
          .get();
    } catch (e) {
      if (e is PlatformException) {
        throw Exception('Erro');
      }
      throw Exception(e.toString());
    }
  }

  @override
  Future<Usuario> updateUser(Usuario editUser) async {
    try {
      await _cadastrocollectionReference
          .doc(currentUser.uid)
          .update(editUser.toJson());
      return editUser;
    } catch (e) {
      if (e is PlatformException) {
        throw Exception('Erro');
      }
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> deleteUser(String userUid) async {
    await _cadastrocollectionReference.doc(userUid).delete();
    return userUid;
  }
}
