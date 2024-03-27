// Base Class for Pizza
abstract class BasePizza {
  String getDescription();
  double getPrice();
}

// Concrete Class for Base Pizza like Cheeze Pizza and Margerita Pizza
class CheesePizza extends BasePizza {
  @override
  String getDescription() {
    return 'Cheese Pizza';
  }

  @override
  double getPrice() {
    return 250.0;
  }
}

class MargeritaPizza extends BasePizza {
  @override
  String getDescription() {
    return 'Margerita Pizza';
  }

  @override
  double getPrice() {
    return 100.0;
  }
}

// Decorator class for Pizza
abstract class PizzaDecorator implements BasePizza {
  BasePizza pizza;

  PizzaDecorator(this.pizza);

  @override
  String getDescription() {
    return pizza.getDescription();
  }

  @override
  double getPrice() {
    return pizza.getPrice();
  }
}

// Concrete Decorator for Pizza for adding toppings
class Toppings extends PizzaDecorator {
  Toppings(BasePizza pizza) : super(pizza);

  @override
  String getDescription() {
    return '${super.getDescription()} with toppings';
  }

  @override
  double getPrice() {
    return super.getPrice() + 50.0;
  }
}

void main() {
  BasePizza basePizza = MargeritaPizza();
  BasePizza toppings = Toppings(basePizza);
  print(toppings.getDescription());
  print(toppings.getPrice());
}
