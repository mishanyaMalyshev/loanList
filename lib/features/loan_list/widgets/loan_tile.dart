import 'package:credit_list/banki_ui/views/action_button.dart';
import 'package:credit_list/banki_ui/constants.dart';
import 'package:credit_list/features/loan_list/widgets/loan_info_columns.dart';
import 'package:credit_list/repositories/loans/models/loan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoanTile extends StatelessWidget {
  const LoanTile({
    super.key,
    required this.loan,
  });

  final Loan loan;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
              Radius.circular(Insets.defaultCornerRadius)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 1)),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.all(Insets.defaultInset),
            child: Column(children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.network(loan.mfo.iconUrl,
                    height: 40, alignment: Alignment.topLeft),
                const SizedBox(width: Insets.defaultInset),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(loan.name, style: const TextStyle(fontSize: 16)),
                  Text(loan.mfo.name,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF687082))),
                ])
              ]),
              const SizedBox(height: Insets.defaultInset),
              LoanInfoColumns(loanInfo: [
                LoanInfo(LoanInfoType.amount, loan.amountString),
                LoanInfo(LoanInfoType.term, loan.termOfCreditString)
              ]),
              const SizedBox(height: Insets.defaultInset),
              Row(
                children: [
                  ActionButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/loan', arguments: loan);
                      },
                      text: "Подробнее",
                      style: ActionButtonStyle.common),
                  const SizedBox(width: 8),
                  ActionButton(
                      onPressed: () async {
                        final url = Uri.parse(loan.requestURL);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url, mode: LaunchMode.inAppWebView);
                        } else {
                          // ignore: avoid_print
                          print("Can't launch $url");
                        }
                      },
                      text: "Оформить",
                      style: ActionButtonStyle.accented)
                ],
              )
            ])));
  }
}
