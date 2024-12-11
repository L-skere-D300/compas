import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromARGB(255, 232, 121, 30),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 2) {
          Navigator.pushNamed(context, '/cart');  
        } else {
          
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'MENSAJE'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mi Perfil'),
      ],
    );
  }
}
