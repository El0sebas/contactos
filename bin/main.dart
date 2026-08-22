// bin/main.dart

import 'dart:io';
// Usamos una ruta relativa para evitar errores con el nombre del paquete
import '../lib/contact.dart' as agenda;

void main() {
  int opcion = 0;

  do {
    print('\n=== 📖 AGENDA DE CONTACTOS ===');
    print('1. Agregar Contacto');
    print('2. Listar Contactos');
    print('3. Buscar Contacto');
    print('4. Eliminar Contacto');
    print('5. Salir');
    stdout.write('Elige una opción: ');

    String? entrada = stdin.readLineSync();
    opcion = int.tryParse(entrada ?? '0') ?? 0;

    switch (opcion) {
      case 1:
        stdout.write('ID del contacto: ');
        int id = int.parse(stdin.readLineSync() ?? '0');
        stdout.write('Nombre: ');
        String nombre = stdin.readLineSync() ?? 'Sin Nombre';
        stdout.write('Teléfono: ');
        String telefono = stdin.readLineSync() ?? '0';

        agenda.agregarContacto(id, nombre, telefono);
        break;

      case 2:
        agenda.listarContactos();
        break;

      case 3:
        stdout.write('Nombre a buscar: ');
        String nombreBuscar = stdin.readLineSync() ?? '';
        agenda.buscarContacto(nombreBuscar);
        break;

      case 4:
        stdout.write('ID del contacto a eliminar: ');
        int idDelete = int.parse(stdin.readLineSync() ?? '0');
        agenda.eliminarContacto(idDelete);
        break;

      case 5:
        print('Saliendo de la agenda...');
        break;

      default:
        print('Opción inválida. Intenta de nuevo.');
    }
  } while (opcion != 5);
}