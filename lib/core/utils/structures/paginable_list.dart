class PaginableList<T> {
  PaginableList({
    required this.data,
    required this.hasMore,
    this.nextPage,
    this.totalCards,
    this.warnings,
  });

  final List<T> data;

  final bool hasMore;

  final Uri? nextPage;

  final int? totalCards;

  final List<String>? warnings;

  int get length => data.length;

  T operator [](int index) => data[index];
}
