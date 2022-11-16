import 'package:flutter/material.dart';
import 'package:semana12_1_shared_m/vistaAjustes.dart';

class vista1 extends StatelessWidget {
  const vista1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: (
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text('PREFERENCIAS EN FLUTTER',
                style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context){
            return vistaAjustes();
          }));
        },
      ),
    );
  }
}
