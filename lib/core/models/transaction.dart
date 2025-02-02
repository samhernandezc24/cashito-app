class Transaction {
  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.categoryId,
    required this.note,
    required this.tagIds,
  });
  final String title;
  final DateTime date;
  final double amount;
  final String categoryId;
  final String note;
  final List<String> tagIds;
}
