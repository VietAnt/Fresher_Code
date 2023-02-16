import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_mobile/Model/transaction_model.dart';
import 'package:money_mobile/Pages/add_card_page.dart';
import 'package:money_mobile/Providers/card_providers.dart';
import 'package:money_mobile/Widget/card_list.dart';
import 'package:money_mobile/Widget/transaction_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CardProvider>(create: (_) => CardProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: HomePage(),
        ),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title: const Text(
          "Home page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCardPage()));
            },
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              (Provider.of<CardProvider>(context).getCardLength() > 0
                  ? Container(
                      height: 210,
                      child: Consumer<CardProvider>(
                        builder: (context, cards, child) => CardList(
                          cards: cards.allCards,
                        ),
                      ))
                  : Container(
                      height: 210,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Add your new card click the \n + \n button in the top right.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Last Transactions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              const SizedBox(
                height: 15,
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Shopping', price: 1000, type: '-', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Salary', price: 1000, type: '+', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Receive', price: 200, type: '+', currency: 'US'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
