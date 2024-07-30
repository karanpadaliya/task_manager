import 'package:flutter/material.dart';

class BankAccountPage extends StatefulWidget {
  @override
  _BankAccountPageState createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  final BankAccount _account = BankAccount('123456789', 1000.0);

  final _depositController = TextEditingController();
  final _withdrawController = TextEditingController();

  void _deposit() {
    final amount = double.tryParse(_depositController.text) ?? 0.0;
    if (amount > 0) {
      setState(() {
        _account.deposit(amount);
      });
      _depositController.clear();
    } else {
      _showSnackBar('Deposit amount must be positive.');
    }
  }

  void _withdraw() {
    final amount = double.tryParse(_withdrawController.text) ?? 0.0;
    if (amount > 0) {
      if (amount <= _account.balance) {
        setState(() {
          _account.withdraw(amount);
        });
        _withdrawController.clear();
      } else {
        _showSnackBar('Insufficient balance.');
      }
    } else {
      _showSnackBar('Withdrawal amount must be positive.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                """3) Create a Dart class BankAccount with private attributes accountNumber and balance. Provide public methods to access and modify the balance. Ensure that the account number remains read-only after it is set in the constructor.""",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Text(
                'Account Number: ${_account.accountNumber}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Balance: \$${_account.balance.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _depositController,
                decoration: InputDecoration(
                  labelText: 'Deposit Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _deposit,
                child: Text('Deposit'),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _withdrawController,
                decoration: InputDecoration(
                  labelText: 'Withdraw Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _withdraw,
                child: Text('Withdraw'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BankAccount {
  final String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance);

  String get accountNumber => _accountNumber;

  double get balance => _balance;

  set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
    } else {
      print('Balance cannot be negative.');
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
    } else if (amount > _balance) {
      print('Insufficient balance.');
    } else {
      print('Withdrawal amount must be positive.');
    }
  }
}
