class Expense {
  final String expId;
  final String expItem;
  final int expAmount;
  final DateTime expDate;

  Expense(
      {required this.expId,
      required this.expItem,
      required this.expAmount,
      required this.expDate});
}
