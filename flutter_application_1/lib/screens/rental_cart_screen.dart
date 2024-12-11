import 'package:flutter/material.dart';
import 'product_detail_screen.dart'; // Importar el archivo donde está `cartItems`
import 'payment_screen.dart'; // Importar la pantalla de pago

class RentalCartScreen extends StatefulWidget {
  @override
  _RentalCartScreenState createState() => _RentalCartScreenState();
}

class _RentalCartScreenState extends State<RentalCartScreen> {
  // Función para calcular el subtotal
  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (double.tryParse(item['price'] ?? '0.0') ?? 0.0));
  }

  // Función para calcular el total (con impuesto del 18%)
  double get total {
    const double taxRate = 0.18; // Impuesto del 18%
    return subtotal + (subtotal * taxRate);
  }

  // Método para eliminar un producto y actualizar el estado
  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index); // Eliminar el producto
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 228, 228),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(
          'Cesta de alquiler',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: cartItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return RentalItem(
                          imageUrl: item['image'] ?? '',
                          title: item['name'] ?? '',
                          price: item['price'] ?? '',
                          onRemove: () => _removeItem(index), // Eliminar producto
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No hay productos en el carrito.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
            ),
            const Divider(height: 32, thickness: 1),
            // Mostrar subtotal y total
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${subtotal.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navegar hacia la pantalla de pago
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: const Color.fromARGB(255, 223, 144, 40),
              ),
              child: const Text(
                'Continuar con la compra',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RentalItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback onRemove; // Callback para manejar la eliminación

  const RentalItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey,
                  child: Icon(Icons.broken_image, color: Colors.white),
                );
              },
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onRemove, // Llamar al callback de eliminación
            ),
          ],
        ),
      ),
    );
  }
}
