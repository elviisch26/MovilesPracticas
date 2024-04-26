class Pedido {
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;
  
  // Usar un valor por defecto para hacer el parámetro opcional
  const Pedido({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.descripcion,
  });
}

final clasicos = [
  Pedido(
    id: 1,
    nombre: "Americano",
    precio: 6.25,
    imagen: "assets/sam1.jpeg",
    descripcion: "Pancito con queso manaba tamaño XL siempre fresquito DEL DÍA, tocinos, cheddarcito, lechuga, tomate, salsita artesanal de albahaca🌱"
  ),
  Pedido(
    id: 2,
    nombre: "Dos pisos",
    precio: 5.55,
    imagen: "assets/sam2.jpeg",
    descripcion: "Pancito con queso manaba tamaño XL siempre fresquito DEL DÍA, Jamón o mortadela, cheddarcito, salami, lechuga, tomate, salsita artesanal de albahaca🌱"
  ),
  Pedido(
    id: 3,
    nombre: "Rechicken bechamel",
    precio: 6.95,
    imagen: "assets/sam3.jpeg",
    descripcion: "Pancito con queso manaba tamaño XL fresquito siempre DEL DÍA, pollito desmechadito, cheddar, salami, lechuga picadito, tomate, salsita bechamel"
  ),
];

final premium = [
  Pedido(
    id: 4,
    nombre: "El tiktoker",
    precio: 7.50,
    imagen: "assets/images/sanguchito1.jpg",
    descripcion: "Pancito con queso manaba tamaño XL fresquito DEL DÍA, filete de cerdo bañadito en bbq, capita de mozarella, salsita de cebolla con limón , lechuga, chifle crunchie pa tu corazón."
  ),
  Pedido(
    id: 5,
    nombre: "La popular",
    precio: 9.75,
    imagen: "assets/images/sanguchito2.jpg",
    descripcion: "Pancito con queso manaba tamaño XL fresquito DEL DÍA, cerdo desmechadito bañado en bbq, queso holandés derretidito, corona de cebolla caramelizada, lechuga, chiflecito crunch"
  ),
  Pedido(
    id: 6,
    nombre: "Mi amor",
    precio: 7.00,
    imagen: "assets/images/sanguchito3.jpg",
    descripcion: "Pancito con queso manaba tamaño XL fresquito DEL DÍA, pavo en albahaca,mozarella derretidita, lechuga, pasta de tomate romanticona, jamón de espalda"
  ),
];

final bebidas = [
  Pedido(
    id: 7,
    nombre: "Malteada de limón",
    precio: 3.75,
    imagen: "assets/images/bebida1.jpg",
    descripcion: "Chao a los batidos tradicionales HOLAAA AL limoncito ácido con un shot de leche condensada mixeado! ¡El cielo! 🌟"
  ),
  Pedido(
    id: 8,
    nombre: "Malteada de maracuyá",
    precio: 3.75,
    imagen: "assets/images/bebida2.jpg",
    descripcion: "Chao a los batidos tradicionales HOLAAA AL maracuyá ácida con un shot de leche condensada mixeado! ¡El cielo! 🌟"
  ),

];
