import 'package:get_it/get_it.dart';
import 'package:malina_delivery/features/main/presentation/bloc/main_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Features
  _mainPage();
}

void _mainPage() {
  sl.registerFactory<MainBloc>(() => MainBloc());
}
