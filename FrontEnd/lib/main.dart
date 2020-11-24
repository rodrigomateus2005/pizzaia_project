import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:myapp/controller/foto.controller.dart';
import 'package:myapp/controller/tema.controller.dart';
import 'package:myapp/model/tema.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:myapp/repository/itema.repository.dart';
import 'package:myapp/repository/shared_preferences/tema.repository.sharedpreferences.dart';
import 'package:myapp/service/ifoto.service.dart';
import 'package:myapp/view/foto.dart';
import 'package:myapp/view/menu.dart';
import 'package:myapp/view/service/foto.view.service.dart';
import 'package:myapp/view/themes/claro.tema.dart';
import 'package:myapp/view/themes/escuro.tema.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras));
}

class MyApp extends StatefulWidget {
  final List<CameraDescription> _cameras;

  MyApp(this._cameras, {Key key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp(_cameras);
}

class _MyApp extends State<MyApp> implements ITemaChangeListner {
  TemaController temaController;
  ITemaRepository temaRepository;
  IFotoService fotoService;
  List<IFotoRepository> fotoRepositories;
  FotoController fotoController;
  List<CameraDescription> _cameras;

  _MyApp(this._cameras) {
    List<Tema> temas = <Tema>[Claro(), Escuro()];

    this.temaRepository = new TemaRepositorySharedPreferences(temas);
    this.temaController = new TemaController(temaRepository);

    temaController.addChangeListner(this);

    this.fotoService = new FotoViewService(this._cameras);
    this.fotoRepositories = [];

    this.fotoController = new FotoController(fotoService, fotoRepositories);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ITemaRepository>(
          create: (_) => temaRepository,
        ),
        Provider<TemaController>(
          create: (_) => temaController,
        ),
        Provider<IFotoService>(
          create: (_) => fotoService,
        ),
        Provider<List<IFotoRepository>>(
          create: (_) => fotoRepositories,
        ),
        Provider<FotoController>(
          create: (_) => fotoController,
        )
      ],
      child: MaterialApp(
        title: 'Instazzaia',
        theme: temaController.escolhido.data,
        initialRoute: '/',
        routes: {
          '/': (context) => MenuPage(temaController, fotoController, title: 'Instazzaia'),
          '/foto': (context) => FotoPage(camera: _cameras.first,),
        },
      ),
    );
  }

  @override
  void onChange(Tema tema) {
    this.setState(() => {});
  }
}
