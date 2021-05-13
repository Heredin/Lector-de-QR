import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_pages.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        elevation:0,
        title: Text('Historial'),
        actions:[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed:(){
     Provider.of<ScanListProvider>(context,listen:false).borrarTodos();},
          )
        ]
      ),
body: _HomePageBody(),
bottomNavigationBar: CustomNavigationBar(),
floatingActionButton: ScanButton(),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //obtener el selected menu opt
    final uiProvider=Provider.of<UiProvider>(context);
   final currentIndex=uiProvider.selectedMenuOpt;
   //cambiar para mostrar las paginas respectivas
   // SStodo Temporal leer la base de datos
   //final tempScan=new ScanModel(valor: 'http://google.com');
  // DBProvider.db.nuevoScan(tempScan);
    //usar  el ScanListProvider
    final scanListProvider =Provider.of<ScanListProvider>(context,listen:false);
   switch(currentIndex){
     case 0:
     scanListProvider.cargarScansPorTipo('geo');
     return MapasPage();
     case 1:
     scanListProvider.cargarScansPorTipo('http');
     return DireccionesPage();
default:
return MapasPage();
   } 
  }
}