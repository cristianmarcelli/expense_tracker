import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

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

  DateTime? _selectedDate;
  Category _selectedCategory = Category.other;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Descrizione'),
            ),
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  maxLength: 10,
                  decoration: const InputDecoration(
                    prefixText: '€',
                    labelText: 'Importo',
                  ),
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // con il ! diciamo a DART che questo valore non sarà mai nullo
                    Text(
                      _selectedDate == null
                          ? 'Data'
                          : formatter.format(_selectedDate!),
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          categoryName[category]?.data ?? '',
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                menuMaxHeight: 250.00,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Chiudi'),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: _submitExpenseDate,
                child: const Text('Salva'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    // questa linea di codice verrà eseguita solo dopo che pickedDate sarà disponibile,
    // in quanto stando in una funziona asincrona, con l'await facciamo sì che prima di continuare ad eseguire il codice,
    // abbiamo tutti i dati necessari, inseriti dall'utente

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseDate() {
    final enteredAmount = double.tryParse(_amountController.text);
    // amountIsInvalid if enteredAmount is null or less/equal to 0
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Dati non validi',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          content: Text(
            'Verifica l\'inserimento corretto di descrizione, importo, data e categoria prima di continuare.',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
