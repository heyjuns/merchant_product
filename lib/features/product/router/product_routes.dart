abstract class _Path {
  static const String base = '/products';
  static const String create = '/create-product';
  static const String edit = '/edit-product/:id';
  static const String product = '/products/:id';
}

enum ProductRoutes {
  products(_Path.base),
  create(_Path.create),
  edit(_Path.edit),
  product(_Path.product);

  final String path;

  const ProductRoutes(this.path);
}
