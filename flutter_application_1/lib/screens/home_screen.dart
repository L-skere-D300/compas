import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart'; 
import '../widgets/product_grid.dart'; 

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, 
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Búsqueda',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.qr_code_scanner, color: Colors.black),
              onPressed: () {
               
                print("Escáner activado");
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color.fromARGB(255, 220, 144, 29),
            tabs: [
              Tab(text: 'Todo'),
              Tab(text: 'Surf'),
              Tab(text: 'Fútbol'),
              Tab(text: 'Vóley'),
              Tab(text: 'Vehículos'),
              Tab(text: 'Pesas'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(Icons.person, size: 40, color: Colors.blue),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Usuario',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '11111@certus.edu.pe',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
                onTap: () {
                  Navigator.pushNamed(context, '/profile'); 
                },
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Categorías'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configuración'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Moneda'),
                onTap: () {
                  Navigator.pop(context);
                 
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Acerca de nosotros'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar sesión'),
                onTap: () {
                  Navigator.pop(context);
                 
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductGrid(category: 'Todo'),
            ProductGrid(category: 'Surf'),
            ProductGrid(category: 'Fútbol'),
            ProductGrid(category: 'Vóley'),
            ProductGrid(category: 'Vehículos'),
            ProductGrid(category: 'Pesas'),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
