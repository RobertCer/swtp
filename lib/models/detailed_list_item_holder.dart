class DetailsListItemHolder<T> {
  final String title;
  final Object value;
  final List<T>? items;
  final T? item;

  DetailsListItemHolder({
    required this.title,
    required this.value,
    this.items,
    this.item,
  });
}
