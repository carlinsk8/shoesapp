import 'package:flutter/material.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/widget/custom_widgets.dart';


class ZapatoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusDarkt();
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(texto: "For you",),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Hero(
                    tag:'zapato-1',
                    child: ZapatoSizePreview()
                  ),
                  ZapatoDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            )
          ),
          AgregarCarritoBoton(monto:180.0)
        ],
      ),
   );
  }
}