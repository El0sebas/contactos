 import 'dart:io';

// Asegúrate de que el nombre del import coincida con el nombre de tu proyecto

import 'package:taller_dart_gitflow/inventario.dart' as inv;



void main() {

int opcion = 0;



do {

print('\n=== SISTEMA DE INVENTARIO ===');

print('1. Agregar Producto');

print('2. Listar Productos');

print('3. Actualizar Producto');

print('4. Eliminar Producto');

print('5. Salir');

stdout.write('Elige una opción: ');



// Leemos la entrada del usuario y evitamos nulos

String? entrada = stdin.readLineSync();

opcion = int.tryParse(entrada ?? '0') ?? 0;



switch (opcion) {

case 1:

stdout.write('ID del producto: ');

int id = int.parse(stdin.readLineSync() ?? '0');

stdout.write('Nombre del producto: ');

String nombre = stdin.readLineSync() ?? 'Sin Nombre';

stdout.write('Precio: ');

double precio = double.parse(stdin.readLineSync() ?? '0.0');

stdout.write('Cantidad: ');

int cantidad = int.parse(stdin.readLineSync() ?? '0');



inv.agregarProducto(id, nombre, precio, cantidad);

break;



case 2:

inv.listarProductos();

break;



case 3:

stdout.write('ID del producto a actualizar: ');

int idUpdate = int.parse(stdin.readLineSync() ?? '0');

stdout.write('Nuevo precio: ');

double nuevoPrecio = double.parse(stdin.readLineSync() ?? '0.0');

stdout.write('Nueva cantidad: ');

int nuevaCantidad = int.parse(stdin.readLineSync() ?? '0');



inv.actualizarProducto(idUpdate, nuevoPrecio, nuevaCantidad);

break;



case 4:

stdout.write('ID del producto a eliminar: ');

int idDelete = int.parse(stdin.readLineSync() ?? '0');

inv.eliminarProducto(idDelete);

break;



case 5:

print('Saliendo del sistema...');

break;



default:

print('Opción inválida. Intenta de nuevo.');

}

} while (opcion != 5);

}