import 'package:bytebank/screens/transferencias/Formulario.dart';
import 'package:flutter/material.dart';

import '../../components/ItemTransferencia.dart';

import '../../models/Transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}
//para atualizar precisamos informar um state para isso criamos uma nova classe
class ListaTransferenciasState extends State<ListaTransferencias>{
  //colocar apenas algo que tera seu valor alterado, ou seja não constantes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: ((context, indice) {
          final transferencia = widget._transferencias[indice];
          debugPrint('$transferencia');
          return ItemTransferencia(transferencia);
        }),
      ),
      appBar: AppBar(title: Text('Transferências'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida){
    if(transferenciaRecebida != null){
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}