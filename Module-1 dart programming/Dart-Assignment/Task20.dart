// Task 20:
// Write a program that simulates a shopping cart. Define classes for Product, Cart, and Order.
// Allow users to add products to the cart and calculate the total price of the items.

class Product {
  String name;
  double price;
  int quantity;


  Product(this.name, this.price, this.quantity);


  void displayProduct() {
    print("Product: $name | Price: \$${price.toStringAsFixed(2)} | Quantity: $quantity");
  }
}

class Cart {
  List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    print("${product.name} added to the cart.");
  }


  void displayCart() {
    if (_products.isEmpty) {
      print("Your cart is empty.");
    } else {
      print("\n--- Cart Items ---");
      for (var product in _products) {
        product.displayProduct();
      }
    }
  }


  double calculateTotal() {
    double total = 0.0;
    for (var product in _products) {
      total += product.price * product.quantity;
    }
    return total;
  }
}


class Order {
  Cart cart;

  Order(this.cart);

  void placeOrder() {
    print("\nPlacing your order...");
    cart.displayCart();
    double total = cart.calculateTotal();
    print("\nTotal Price: \$${total.toStringAsFixed(2)}");
    print("Thank you for your purchase!");
  }
}

void main() {

  Cart cart = Cart();

  cart.addProduct(Product("Milk", 2.50, 2));
  cart.addProduct(Product("Bread", 1.80, 1));
  cart.addProduct(Product("Eggs", 0.30, 12));

  cart.displayCart();

  double total = cart.calculateTotal();
  print("\nTotal Price: \$${total.toStringAsFixed(2)}");

  Order order = Order(cart);
  order.placeOrder();
}
