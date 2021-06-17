class Cart {
  int id;
  String title;
  String description;

  Cart(String title, String description) {
    this.title = title;
    this.description = description;
  }
  Cart.withId(int id, String title, String description) {
    this.id = id;
    this.title = title;
    this.description = description;
  }
}
