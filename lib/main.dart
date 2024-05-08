import 'package:flutter/material.dart';
import 'package:run_flutter_ui/styles/colors.dart';
import 'package:run_flutter_ui/widgets/button.dart';
import 'package:run_flutter_ui/widgets/currency_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Logo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
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
                        'welcome back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 22,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 70),
              Text(
                'Total Balance',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(height: 10),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    backgroundColor: Color(0xfff2b33a),
                    text: 'Transfer',
                  ),
                  Button(
                      backgroundColor: Color(0xff1f2123),
                      textColor: Colors.white,
                      text: 'Request'),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600),
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
              const SizedBox(height: 20),
              const CurrencyCard(
                name: 'Euro',
                code: 'EUR',
                amount: '6 428',
                icon: Icons.euro_rounded,
                index: 0,
              ),
              const CurrencyCard(
                name: 'Bitcoin',
                code: 'BTC',
                amount: '9 785',
                icon: Icons.currency_bitcoin_rounded,
                textColor: blackColor,
                backgroundColor: Colors.white,
                index: 1,
              ),
              const CurrencyCard(
                name: 'Dollar',
                code: 'USD',
                amount: '387',
                icon: Icons.attach_money_outlined,
                index: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
