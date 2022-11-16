import 'package:flutter/material.dart';
import 'package:semana12_1_shared_m/pref/preferencias.dart';

class vistaAjustes extends StatefulWidget {
  const vistaAjustes({Key? key}) : super(key: key);

  @override
  State<vistaAjustes> createState() => _vistaAjustesState();
}

class _vistaAjustesState extends State<vistaAjustes> {

  Preferencias pref=Preferencias();

  @override
  Widget build(BuildContext context) {

    TextEditingController usuController=
    TextEditingController(text:pref.red);

    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.wifi),
                ),
                Expanded(child: Text("Activar Wifi: "),),

                Switch(
                    value: pref.wifi,
                    onChanged: (value){
                      setState(() {
                        pref.wifi=value;
                        pref.guardarRed();
                      });
                    }),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.signal_cellular_alt_rounded),
                ),
                Expanded(child: Text("Nombre de Red: "),),

                Container(
                  width: 120,
                  child: TextField(
                    controller: usuController,
                    onChanged: (value){
                      pref.red=value;
                      pref.guardarUsuario();
                    },
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.phone_android),
                ),
                Expanded(child: Text("Activar Orientación: "),),

                Checkbox(
                    value: pref.orientacion,
                    onChanged: (value){
                      setState(() {
                        pref.orientacion=value!;
                        pref.guardarOrientacion();
                      });
                    }),
              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  void initState() {
    pref.init().then((value){
      setState(() {
        pref=value;
      });
    });
  }
}
