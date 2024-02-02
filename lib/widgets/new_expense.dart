import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // Importante - quando si crea un controller per la modifica del testo
  //bisogna dire a flutter di cancelarlo quando il widget non è più necessario,
  //quindi quando per esempio si chiude il modale. Altrimenti rimarrebbe in memoria

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Descrizione'),
              ),
            ),
            TextField(
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              maxLength: 10,
              decoration: const InputDecoration(
                prefixText: '€',
                labelText: 'Importo',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _resetAmount();
                  },
                  child: const Text('Annulla importo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text('Salva'),
                ),
              ],
            )
          ],
        ));
  }

  void _resetAmount() {
    setState(() {
      _amountController.text = "";
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
