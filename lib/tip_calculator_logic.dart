class TipResult {
  final double tipAmount;
  final double totalAmount;

  TipResult({required this.tipAmount, required this.totalAmount});
}

class TipCalculatorLogic {
  TipResult calculateTip(double amount, double percentage) {
    if (amount < 0 || percentage < 0) {
      return TipResult(tipAmount: 0.0, totalAmount: amount > 0 ? amount : 0.0);
    }
    final tipAmount = amount * (percentage / 100);
    final totalAmount = amount + tipAmount;
    return TipResult(tipAmount: tipAmount, totalAmount: totalAmount);
  }
}
