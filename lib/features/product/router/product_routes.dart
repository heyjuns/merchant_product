abstract class _Path {
  static const String base = '/products';
  static const String create = '/create';
  static const String product = '/products/:id';
}

enum ProductRoutes {
  products(_Path.base),
  create(_Path.create),
  product(_Path.product);

  final String path;

  const ProductRoutes(this.path);
}
