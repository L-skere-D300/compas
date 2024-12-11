import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart'; // Importa la barra de navegación personalizada

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        centerTitle: true,
        title: Text(
          'Editar cuenta',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red[200],
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Diego Juarez',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            
            _buildTextField(label: 'Nombre'),
            SizedBox(height: 10),
            _buildTextField(label: 'Apellido'),
            SizedBox(height: 10),
            _buildTextField(label: 'DNI'),
            SizedBox(height: 10),
            _buildTextField(label: 'Dirección'),
            Spacer(),

           
            GestureDetector(
              onTap: () {
                
                print('Términos y condiciones seleccionados');
              },
              child: Text(
                'Términos y condiciones',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(), 
    );
  }

  Widget _buildTextField({required String label}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
