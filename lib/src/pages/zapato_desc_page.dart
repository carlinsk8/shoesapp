import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widget/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Hero(
              tag:'zapato-1',
              child: ZapatoSizePreview(fullScreen:true)),
            Positioned(
              top: 80,
              child: FloatingActionButton(
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: (){
                  cambiarStatusDarkt();
                  Navigator.pop(context);
                },
                child: Icon(Icons.chevron_left,color: Colors.white,size: 60,),
              )
            )
          ],),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ZapatoDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),

                  _MontoByNow(),
                  _ColoresYmas(),
                  _BotonesLikeCartSetting()
                ],
              ),
            ),
          )
        ],
      ),
   );
  }
}

class _BotonesLikeCartSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _BotonSombreado(Icon(Icons.favorite, color:Colors.red,size: 25,)),
           _BotonSombreado(Icon(Icons.add_shopping_cart, color:Colors.grey.withOpacity(0.4),size: 25,)),
            _BotonSombreado(Icon(Icons.settings, color:Colors.grey.withOpacity(0.4),size: 25,))
        ],
      )
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color:Colors.black26,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0,10)
          )
        ]
      ),
      child: this.icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(child: Stack(
            children: <Widget>[
              Positioned(
                left: 90,
                child:_BotonColor(Color(0xffc6d642),4,'assets/imgs/verde.png')
              ),
              Positioned(
                left: 60,
                child:_BotonColor(Color(0xffffad29),3,'assets/imgs/amarillo.png')
              ),
              Positioned(
                left: 30,
                child:_BotonColor(Color(0xff2099f1),2,'assets/imgs/azul.png')
              ),
              _BotonColor(Color(0xff364d56),1,'assets/imgs/negro.png'),
            ],
          )),
          BotonNaranja(texto: 'More relate item',
          height: 30,
          width: 170,
          color:Color(0xffffc675))
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;

  _BotonColor(this.color,this.index,this.assetImage);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: this.index*100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: (){
          zapatoModel.assetImage=this.assetImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoByNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top:20,bottom: 20),
        child: Row(
          children: <Widget>[
            Text('\$180.0',
            style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(
                texto: "Buy now",
                width: 120,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}