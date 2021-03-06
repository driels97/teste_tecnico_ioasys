import 'dart:async';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/coordinator/main_coordinator.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/usecases/ler_headers_usecase.dart';
import 'package:teste_ioasys_app/app/common/ui/icones.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      _avaliarFluxoAposSplash,
    );
  }

  void _avaliarFluxoAposSplash() async {
    final resultado = await LerHeadersUsecase()();

    resultado.forEach((_, value) {
      if (value == null) {
        MainCoordinator.irParaLogin();
        return;
      }

      MainCoordinator.irParaHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(Icones.background, fit: BoxFit.cover),
          ),
          Center(
            child: Container(
              child: Image.asset(Icones.iconeLogoComTitulo, scale: 3.0),
            ),
          )
        ],
      ),
    );
  }
}
