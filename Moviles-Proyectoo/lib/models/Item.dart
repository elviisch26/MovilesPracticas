class Item {
  String id;
  String nombre;
  double precio;
  String unidad;
  String imagen;
  int cantidad;
  
  Item({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.unidad,
    required this.imagen,
    required this.cantidad,
  });

  Item.map(dynamic o)
      : id = o['id'],
        nombre = o['nombre'],
        precio = o['precio'],
        unidad = o['unidad'],
        imagen = o['imagen'],
        cantidad = o['cantidad'] ?? 0; // Puedes proporcionar un valor por defecto, como 0

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['nombre'] = nombre;
    map['precio'] = precio;
    map['unidad'] = unidad;
    map['imagen'] = imagen;
    map['cantidad'] = cantidad;
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['precio'] = this.precio;
    data['unidad'] = this.unidad;
    data['imagen'] = this.imagen;
    data['cantidad'] = this.cantidad;
    return data;
  }
}
