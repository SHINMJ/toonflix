import 'package:flutter/material.dart';
import 'package:toonflix/challenge/first.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency-card.dart';

void main() {
  runApp(FirstApp());
}

// root  widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //테마 선택 : MaterialApp 혹은 CupertinoApp
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8), fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                      fontSize: 22, color: Colors.white.withOpacity(0.8)),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '\$5 194 482',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(text: 'Transfer', bgColor: Colors.amber, textColor: Colors.black,),
                    Button(text: 'Request', bgColor: Color(0xff1f2123), textColor: Colors.white,),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Wallets', 
                      style: TextStyle(
                          color: Colors.white, 
                          fontSize: 36, 
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    Text(
                      'View All', 
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8), 
                        fontSize: 18, 
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ), 
                const CurrencyCard(name: "Euro", code: "EUR", amount: "6 429", icon: Icons.euro_rounded, isInverted: false,),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const CurrencyCard(name: "Bitcoin", code: "BTC", amount: "9 785", icon: Icons.currency_bitcoin, isInverted: true,)),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(name: "Dollars", code: "USD", amount: "428", icon: Icons.money_outlined, isInverted: false,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
