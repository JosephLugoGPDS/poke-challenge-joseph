import 'package:app/app/app.dart';
import 'package:app/bootstrap.dart';
import 'package:app/app/bloc_di.dart';

void main() {
  bootstrap(() => const BlocDI(child: App()));
}
