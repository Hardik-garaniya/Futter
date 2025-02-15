// Task 18:
// Define a BankAccount class with properties like account number, account holder, and
// balance. Add methods to deposit, withdraw, and check the balance. Ensure the withdraw
// method doesn’t allow overdrafts.



class BankAccount {
  late String accountNumber;
  late String accountHolder;
  late double balance;


  BankAccount({
    required this.accountNumber,
    required this.accountHolder,
    required this.balance,
  });


  void deposit(double amount) {

    if (amount > 0) {

      balance += amount;
      print("Deposit successful. Your current balance is: \$${balance.toStringAsFixed(2)}");

    } else {

      print("Deposit amount must be greater than zero.");
    }
  }


  void withdraw(double amount) {

    if (amount > 0 && balance >= amount) {

      balance -= amount;
      print("Withdrawal successful. Your current balance is: \$${balance.toStringAsFixed(2)}");

    } else if (amount <= 0) {
      print("Withdrawal amount must be greater than zero.");

    } else {
      print("Insufficient balance. Cannot withdraw.");
    }
  }


  void checkBalance() {
    print("Your current balance is: \$${balance.toStringAsFixed(2)}");
  }
}

void main() {

  BankAccount account = BankAccount(
    accountNumber: "123456789",
    accountHolder: "John Doe",
    balance: 500.00,
  );


  account.checkBalance();


  account.deposit(200.00);


  account.withdraw(100.00);


  account.withdraw(700.00);


  account.checkBalance();
}
