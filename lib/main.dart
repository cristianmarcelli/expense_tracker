import 'package:flutter/material.dart';
import 'widgets/expenses.dart';

void main() {
  // Codice per obbligare l'app a stare verticalmente
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {});
  runApp(const Expenses());
}
