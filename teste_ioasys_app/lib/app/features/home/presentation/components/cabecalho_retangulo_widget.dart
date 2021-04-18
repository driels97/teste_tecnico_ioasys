import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/ui/campo_entrada_texto_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/icones.dart';
import 'package:teste_ioasys_app/app/common/utils/dimensionamento_utils.dart';

class CabecalhoRetanguloWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: _ClipRectangle(),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: DimensionamentoUtils.alturaCabecalhoRetangulo(
                    Scaffold.of(context).context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(Icones.background),
                  ),
                ),
              ),
            ),
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: DimensionamentoUtils.alturaTextoCabecalhoRetangulo(
                    Scaffold.of(context).context),
          ),
          child: CampoEntradaTextoWidget(
            prefixIcon: Icons.search,
            fontSize: 18,
            opacity: 0.7,
          ),
        ),
      ],
    );
  }
}

class _ClipRectangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}