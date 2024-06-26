import 'package:flutter/material.dart';

class LoanInfoColumns extends StatelessWidget {
  const LoanInfoColumns({
    super.key,
    required this.loanInfo,
  });

  final List<LoanInfo> loanInfo;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var element in loanInfo)
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(element.infoType.title,
              style: const TextStyle(fontSize: 12, color: Color(0xFF687082))),
          const SizedBox(height: 8),
          Text(element.value,
              style: const TextStyle(
                  color: Color(0xFF162136),
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
        ]))
    ]);
  }
}

enum LoanInfoType { term, amount }

extension on LoanInfoType {
  String get title {
    switch (this) {
      case LoanInfoType.term:
        return "Срок";
      case LoanInfoType.amount:
        return "Сумма";
    }
  }
}

class LoanInfo {
  LoanInfo(this.infoType, this.value);

  final LoanInfoType infoType;
  final String value;
}
