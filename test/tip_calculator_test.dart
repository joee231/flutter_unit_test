import 'package:flutter_test/flutter_test.dart';
import 'package:tesring/tip_calculator_logic.dart';

void main() {
  group('TipCalculatorLogic Tests', () {
    final logic = TipCalculatorLogic();

    test('Calculate tip for \$100 with 15%', () {
      final result = logic.calculateTip(100.0, 15.0);
      expect(result.tipAmount, 15.0);
      expect(result.totalAmount, 115.0);
    });

    test('Calculate tip for \$50 with 20%', () {
      final result = logic.calculateTip(50.0, 20.0);
      expect(result.tipAmount, 10.0);
      expect(result.totalAmount, 60.0);
    });

    test('Calculate tip for \$0', () {
      final result = logic.calculateTip(0.0, 15.0);
      expect(result.tipAmount, 0.0);
      expect(result.totalAmount, 0.0);
    });

    test('Handle negative amount', () {
      final result = logic.calculateTip(-100.0, 15.0);
      expect(result.tipAmount, 0.0);
      expect(result.totalAmount, 0.0);
    });

    test('Handle negative percentage', () {
      final result = logic.calculateTip(100.0, -5.0);
      expect(result.tipAmount, 0.0);
      expect(result.totalAmount, 100.0);
    });
  });
}
