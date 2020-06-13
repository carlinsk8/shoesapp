import 'package:flutter/material.dart';

class ZapatoDescription extends StatelessWidget {
  
  final String titulo;
  final String descripcion;

  const ZapatoDescription({
    @required this.titulo, 
    @required this.descripcion
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Text(this.titulo,
          style:TextStyle(fontWeight: FontWeight.w700,fontSize: 30)),
          SizedBox(height: 20,),
          Text(this.descripcion,
          style:TextStyle(color:Colors.black54,height: 1.6)),
        ],
      ),
    );
  }
}