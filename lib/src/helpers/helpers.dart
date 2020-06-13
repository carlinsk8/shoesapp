import 'package:flutter/services.dart' as services;

void cambiarStatusLight(){
  services.SystemChrome.setSystemUIOverlayStyle(
    services.SystemUiOverlayStyle.light
  );
}
void cambiarStatusDarkt(){
  services.SystemChrome.setSystemUIOverlayStyle(
    services.SystemUiOverlayStyle.dark
  );
}