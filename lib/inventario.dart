// lib/inventario.dart

// Usaremos una lista de mapas para guardar los productos
List<Map<String, dynamic>> productos = [];

// Función para crear (Create)
void agregarProducto(int id, String nombre, double precio, int cantidad) {
  productos.add({
    'id': id,
    'nombre': nombre,
    'precio': precio,
    'cantidad': cantidad
  });
  print('\n✅ Producto agregado con éxito.');
}

// Función para leer/listar (Read)
void listarProductos() {
  if (productos.isEmpty) {
    print('\n⚠️ No hay productos en el inventario.');
    return;
  }
  print('\n--- Inventario Actual ---');
  for (var producto in productos) {
    print('ID: ${producto['id']} | Nombre: ${producto['nombre']} | Precio: \$${producto['precio']} | Stock: ${producto['cantidad']}');
  }
}

// Función para actualizar (Update)
void actualizarProducto(int id, double nuevoPrecio, int nuevaCantidad) {
  // Buscamos el producto por ID
  var productoIndex = productos.indexWhere((p) => p['id'] == id);

  if (productoIndex != -1) {
    productos[productoIndex]['precio'] = nuevoPrecio;
    productos[productoIndex]['cantidad'] = nuevaCantidad;
    print('\n✅ Producto actualizado con éxito.');
  } else {
    print('\n❌ Error: Producto no encontrado.');
  }
}

// Función para eliminar (Delete)
void eliminarProducto(int id) {
  var longitudInicial = productos.length;
  productos.removeWhere((p) => p['id'] == id);

  if (productos.length < longitudInicial) {
    print('\n✅ Producto eliminado con éxito.');
  } else {
    print('\n❌ Error: Producto no encontrado.');
  }
}