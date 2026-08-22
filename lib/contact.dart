// lib/contact.dart

// Usaremos una lista de mapas para guardar los contactos
List<Map<String, dynamic>> contactos = [];

// Función para crear (Agregar)
void agregarContacto(int id, String nombre, String telefono) {
  contactos.add({
    'id': id,
    'nombre': nombre,
    'telefono': telefono
  });
  print('\n✅ Contacto agregado con éxito.');
}

// Función para leer/listar (Listar)
void listarContactos() {
  if (contactos.isEmpty) {
    print('\n⚠️ No hay contactos en la agenda.');
    return;
  }
  print('\n--- Agenda de Contactos ---');
  for (var contacto in contactos) {
    print('ID: ${contacto['id']} | Nombre: ${contacto['nombre']} | Teléfono: ${contacto['telefono']}');
  }
}

// Función para buscar (Buscar)
void buscarContacto(String nombreBuscar) {
  // Buscamos si algún nombre coincide con la búsqueda (ignorando mayúsculas)
  var resultados = contactos.where((c) => 
      c['nombre'].toString().toLowerCase().contains(nombreBuscar.toLowerCase()));

  if (resultados.isNotEmpty) {
    print('\n--- Resultados de la Búsqueda ---');
    for (var contacto in resultados) {
      print('ID: ${contacto['id']} | Nombre: ${contacto['nombre']} | Teléfono: ${contacto['telefono']}');
    }
  } else {
    print('\n❌ No se encontró ningún contacto con el nombre "$nombreBuscar".');
  }
}

// Función para eliminar (Eliminar)
void eliminarContacto(int id) {
  var longitudInicial = contactos.length;
  contactos.removeWhere((c) => c['id'] == id);

  if (contactos.length < longitudInicial) {
    print('\n✅ Contacto eliminado con éxito.');
  } else {
    print('\n❌ Error: Contacto no encontrado con ese ID.');
  }
}