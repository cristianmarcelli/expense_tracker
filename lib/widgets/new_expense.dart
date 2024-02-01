import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.black,
    );
    // return const Padding(
    //     padding: EdgeInsets.all(16),
    //     child: Column(
    //       children: [
    //         TextField(
    //           maxLength: 50,
    //           decoration: InputDecoration(
    //             label: Text('title'),
    //           ),
    //         ),
    //       ],
    //     ));
  }
}
