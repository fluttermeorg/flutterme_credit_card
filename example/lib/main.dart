import 'package:flutter/material.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutterme',
      home: CardScreen(),
    );
  }
}

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController number = TextEditingController();
  late TextEditingController validThru = TextEditingController();
  late TextEditingController cvv = TextEditingController();
  late TextEditingController holder = TextEditingController();

  @override
  void initState() {
    super.initState();

    // listen to state changes within the form field controllers
    number.addListener(() => setState(() {}));
    validThru.addListener(() => setState(() {}));
    cvv.addListener(() => setState(() {}));
    holder.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FMCreditCard(
                number: number.text,
                numberMaskType: FMMaskType.first6last2,
                cvv: cvv.text,
                cvvMaskType: FMMaskType.full,
                validThru: validThru.text,
                validThruMaskType: FMMaskType.none,
                holder: holder.text,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      FMHolderField(
                        controller: holder,
                        cursorColor: const Color(0xFF49B7AE),
                        decoration: inputDecoration(
                          labelText: "Card Holder",
                          hintText: "John Doe",
                        ),
                      ),
                      const SizedBox(height: 30),
                      FMNumberField(
                        controller: number,
                        cursorColor: const Color(0xFF49B7AE),
                        decoration: inputDecoration(
                          labelText: "Card Number",
                          hintText: "0000 0000 0000 0000",
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FMValidThruField(
                              controller: validThru,
                              cursorColor: const Color(0xFF49B7AE),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF49B7AE),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF49B7AE)),
                                labelText: "Valid Thru",
                                hintText: "****",
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: FMCvvField(
                              controller: cvv,
                              cursorColor: const Color(0xFF49B7AE),
                              decoration: inputDecoration(
                                labelText: "CVV",
                                hintText: "***",
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF49B7AE),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                ),
                onPressed: () {
                  // check if form is validated
                  if (formKey.currentState!.validate()) {
                    /* do something great */
                  }
                },
                child: const Text("Add Card", style: TextStyle(fontSize: 24)),
              )
            ],
          ),
        ),
      ),
    );
  }

  // input decoration for card fields
  InputDecoration inputDecoration({
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF49B7AE),
        ),
      ),
      labelStyle: const TextStyle(color: Color(0xFF49B7AE)),
      labelText: labelText,
      hintText: hintText,
    );
  }
}
