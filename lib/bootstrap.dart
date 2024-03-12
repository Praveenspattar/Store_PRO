import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    // Your custom logic for observing Bloc changes
    print('Bloc ${bloc.runtimeType} has changed: $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // Your custom logic for handling Bloc errors
    print('Error in Bloc ${bloc.runtimeType}: $error\n$stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Set up FlutterError.onError for error handling
  FlutterError.onError = (details) {
    Logger().e(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Set up Bloc observer for observing Bloc changes and errors
  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Add cross-flavour configuration here if needed

  // Run the app with the provided builder function
  runApp(ChangeNotifierProvider<AppStateModel>(
    create: (contaxt) => AppStateModel()..loadProducts(),
    child: await builder()
    )
  );
}