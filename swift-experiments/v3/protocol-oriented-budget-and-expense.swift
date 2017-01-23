typealias Value = Double

protocol ExpenseType {
    var spent: Value { get }
}

protocol BudgetType {
    associatedtype Expense
    var amount: Value { get }
    var expenses: [Expense] { get }
}

extension BudgetType where Self.Expense: ExpenseType {
    var spent: Value {
        return expenses.reduce(0) { sum, expense in sum + expense.spent  }
    }

    var left: Value {
        return amount - spent
    }
}

struct Expense: ExpenseType {
    let spent: Value
}

struct Budget: BudgetType {
    let amount: Value
    var expenses: [Expense] = []

    init(amount: Value) {
        self.amount = amount
    }
}


// setup
var budget = Budget(amount: 100)

// created budget
assert(budget.spent == 0)
assert(budget.amount == 100)
assert(budget.left == 100)

// budget.spent is the sum of its expense.spent

budget.expenses.append(Expense(spent: 10))
assert(budget.spent == 10)
assert(budget.amount == 100)
assert(budget.left == 90)

budget.expenses.append(Expense(spent: 20))
assert(budget.spent == 30)
assert(budget.left == 70)

