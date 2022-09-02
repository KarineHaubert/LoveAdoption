import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:loveadoption/models/cadastroPet.dart';

class CadastroPetService {
  final CollectionReference _cadastrocollectionReference =
      FirebaseFirestore.instance.collection('CadastrosPet');

  @override
  
  // ignore: override_on_non_overriding_member
  Future createPet(CadastroPet newpet) async {
    try {
      return await _cadastrocollectionReference.add(newpet.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  @override

  Future<List<CadastroPet>> getPetbyTipo(int petTipo) async {
    final querySnapshot = await _cadastrocollectionReference
        .where('tipo', isEqualTo: petTipo)
        .get();
    try {
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((snapshot) => CadastroPet.fromDocumentSnapshot(snapshot))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        throw Exception('Erro');
      }
      throw Exception(e.toString());
    }
  }

  @override

  Future<List<CadastroPet>> getPetsByUserId(String userUid) async {
    final querySnapshot = await _cadastrocollectionReference
        .where('userUid', isEqualTo: userUid)
        .get();

    try {
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((document) => CadastroPet.fromDocumentSnapshot(document))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        throw Exception('Erro');
      }
      throw Exception(e.toString());
    }
  }
  
  @override
  Future<CadastroPet> getPetsByUid(String petUid) async {
    try {
      await _cadastrocollectionReference.where('uid', isEqualTo: petUid).get();
    } catch (e) {
      if (e is PlatformException) {
        throw Exception('Erro');
      }
      throw Exception(e.toString());
    }
  }


  @override
  Future<String> deletePet(String petUid) async {
    await _cadastrocollectionReference.doc(petUid).delete();
    return petUid;
  }

  @override
  Future<CadastroPet> updatePet(CadastroPet editpet) async {
    try {
      await _cadastrocollectionReference
          .doc(editpet.uid)
          .update(editpet.toJson());
      return editpet;
    } catch (e) {}
  }
}
