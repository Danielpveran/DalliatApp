import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;
  const Product({required this.id, required this.name, required this.image, required this.description, required this.price});
}

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<Product> _products = const [
    Product(
      id: 'p1',
      name: 'Camisa',
      image: 'lib/assets/IMG/camisa.jpeg',
      description: 'Camisa cómoda y casual.',
      price: 59.9,
    ),
    Product(
      id: 'p2',
      name: 'Gorra',
      image: 'lib/assets/IMG/gorra.jpeg',
      description: 'Gorra clásica ajustable.',
      price: 29.9,
    ),
    Product(
      id: 'p3',
      name: 'Chaqueta',
      image: 'lib/assets/IMG/ChaquetaHombre.jpeg',
      description: 'Chaqueta ligera para diario.',
      price: 119.9,
    ),
  ];

  final Map<String, CartItem> _cart = {};

  void _addToCart(Product p) {
    setState(() {
      if (_cart.containsKey(p.id)) {
        _cart[p.id]!.qty += 1;
      } else {
        _cart[p.id] = CartItem(product: p, qty: 1);
      }
    });
  }

  void _removeFromCart(String id) {
    setState(() {
      if (_cart.containsKey(id)) {
        if (_cart[id]!.qty > 1) {
          _cart[id]!.qty -= 1;
        } else {
          _cart.remove(id);
        }
      }
    });
  }

  int get _itemCount => _cart.values.fold(0, (sum, e) => sum + e.qty);
  double get _subtotal => _cart.values.fold(0.0, (sum, e) => sum + e.qty * e.product.price);

  void _openCart() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Carrito', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFFFD230), borderRadius: BorderRadius.circular(999)),
                      child: Text('$_itemCount'),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                if (_cart.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text('Tu carrito está vacío.'),
                  )
                else
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: _cart.values.map((ci) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(ci.product.image, width: 48, height: 48, fit: BoxFit.cover),
                          ),
                          title: Text(ci.product.name),
                          subtitle: Text('x${ci.qty}  •  \$${(ci.product.price * ci.qty).toStringAsFixed(2)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: () => _removeFromCart(ci.product.id), icon: const Icon(Icons.remove)),
                              IconButton(onPressed: () => _addToCart(ci.product), icon: const Icon(Icons.add)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${_subtotal.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _cart.isEmpty ? null : () {},
                    child: const Text('Pagar'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('lib/assets/IMG/LogoDalliat.png', height: 32),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(onPressed: _openCart, icon: const Icon(Icons.shopping_cart_outlined)),
              if (_itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFD230),
                      shape: BoxShape.circle,
                    ),
                    child: Text('$_itemCount', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                )
            ],
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFFFFD230)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
          children: _products.map((p) => _ProductCard(product: p, onAdd: () => _addToCart(p))).toList(),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;
  const _ProductCard({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(product.image, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(product.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed: onAdd,
                      icon: const Icon(Icons.add_shopping_cart),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
