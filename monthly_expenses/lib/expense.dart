class Expense {
  final String expId;
  final String expItem;
  final int expAmount;
  final DateTime expDate;
  final bool isPaid;

  Expense(
      {required this.expId,
      required this.expItem,
      required this.expAmount,
      required this.expDate,
      required this.isPaid});
}
