import 'package:flutter/material.dart';
import 'package:widget_tour/Widget/button.dart';
import 'package:widget_tour/Widget/creditcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            'Hey, Hs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '\$5 194 482',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: 'Transfer',
                        bgColor: Colors.amber,
                        textColor: Colors.black,
                      ),
                      Button(
                        text: 'Request',
                        bgColor: Color(0xFF1F2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CreditCard(
                    amount: '6 428',
                    code: 'EUR',
                    icon: Icons.euro_rounded,
                    name: 'Eruo',
                    isInverted: false,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: const CreditCard(
                      amount: '8 222',
                      code: 'BTC',
                      icon: Icons.currency_bitcoin_rounded,
                      name: 'Bitcoin',
                      isInverted: true,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: const CreditCard(
                      amount: '423',
                      code: 'USD',
                      icon: Icons.attach_money_rounded,
                      name: 'Dollar',
                      isInverted: false,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
