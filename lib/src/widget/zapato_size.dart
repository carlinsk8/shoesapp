import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({
    this.fullScreen=false
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen?0:30,
          vertical: fullScreen?0:0
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen?420:430,
          decoration: BoxDecoration(
            color: Color(0xffffcf53),
            borderRadius: !fullScreen
            ?BorderRadius.circular(50)
            :BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                _ZapatoConSombra(),
                if(!fullScreen)
                  _ZapatoTallas()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {

  final double numero;
  _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: (){
        zapatoModel.talla=this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${this.numero.toString().replaceAll('.0', '')}',
        style: TextStyle(
          color:(this.numero==zapatoModel.talla)?Colors.white:Color(0xfff1a23a),
          fontSize: 16,
          fontWeight: FontWeight.bold
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color:(this.numero==zapatoModel.talla)? Color(0xfff1a23a):Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.numero==zapatoModel.talla)
              BoxShadow(color:Color(0xfff1a23a),blurRadius: 10,offset:Offset( 0,5))
          ]
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: EdgeInsets.all(70),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            right: 0,
            child: _ZapatoSombra()
          ),
          Image(image:AssetImage(zapatoModel.assetImage))
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
        child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color:Color(0xffeaa14e), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}