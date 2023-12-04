import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/routes/bloc_observer.dart';
import 'package:u_learning/common/services/storage.dart';
import 'package:u_learning/firebase_options.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = const AppBlocObserver();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    storageService = await StorageService().init();
  }
}
