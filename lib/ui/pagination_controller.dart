class PaginationController<T> {
  PaginationController({required this.limit});

  final int limit;

  int _page = 1;
  List<T> _allItems = [];

  int get page => _page;

  int get visibleCount => _page * limit;

  List<T> visibleItems() => _allItems.take(visibleCount).toList();

  bool get hasReachedMax => visibleItems().length >= _allItems.length;

  void reset() {
    _page = 1;
    _allItems.clear();
  }

  void updateAll(List<T> items) {
    _allItems = _allItems..addAll(items);
  }

  void resetAndUpdateAll(List<T> items) {
    _allItems = _allItems
      ..clear()
      ..addAll(items);
  }

  bool canLoadMoreFromCache() => _allItems.length >= (_page + 1) * limit;

  void nextPage() => _page++;
}
