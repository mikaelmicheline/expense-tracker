import 'package:flutter/material.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({super.key, required this.totalAmount});

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Text('\$ ${totalAmount.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 26,
        ));
  }
}
