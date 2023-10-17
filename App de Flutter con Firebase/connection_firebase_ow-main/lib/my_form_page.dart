import 'package:connection_firebase_ow/firebase_functions.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
const MyFormPage({ Key? key }) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

 Future<void> enviarDatos()async{
  String id = idController.text;
  String nombre = nombreController.text;
  FirebaseFunctions().createDocument(id: id, nombre: nombre);
 }

  Future<void> actualizarDatos()async{
  String id = "1233";
  String nombre = nombreController.text;
  FirebaseFunctions().updateDocument(id: id, nombre: nombre);
 }

   Future<void> eliminarDoc()async{
  String id = "1233";
  
  FirebaseFunctions().deleteDocument(id: id);
 }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Mi formulario"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller:idController ,
              decoration: InputDecoration(labelText: 'ID del documento'),
            ),
            TextField(
              controller:nombreController,
              decoration: InputDecoration(labelText: 'Nombre del personaje'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.network('https://firebasestorage.googleapis.com/v0/b/fir-connection-ow.appspot.com/o/AAImage.jpg?alt=media&token=5e76307f-82f7-4d81-ac2a-044ef9713537',fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(height:  20.0,),
            ElevatedButton(onPressed: eliminarDoc, child: Text('Enviar'),)
          ],
        ),
      ),
    );
  }

}