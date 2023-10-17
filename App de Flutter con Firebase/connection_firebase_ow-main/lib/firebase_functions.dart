import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions{

  //Función para crear un documento en Firestore
  Future<void> createDocument({required String id, required String nombre})async{
    try {
      await FirebaseFirestore.instance.collection('coleccion').doc(id).set({'nombre' : nombre},);
    } catch (e) {
      print("$e");
    }
  
  }

  //Función para actualizar un documento en Firestore
  Future<void> updateDocument({required String id, required String nombre})async{
    try {
      await FirebaseFirestore.instance.collection('coleccion').doc(id).update({'nombre' : nombre},);
    } catch (e) {
      print("$e");
    }
  }

  //Función para eliminar un documento de Firestore

  Future<void> deleteDocument({required String id})async{
    try {
      await FirebaseFirestore.instance.collection('coleccion').doc(id).delete();
    } catch (e) {
      print("$e");
    }
  }
}