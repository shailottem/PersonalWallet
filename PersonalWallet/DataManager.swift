//
//  DataManager.swift
//  PersonalWallet
//
//  Created by Shai Lottem on 20/02/2021.
//

import Foundation

struct Expense {
	public var date: Date
	public var amount: Float
	public var description: String
	public var tags: [String]
	
	static func compareByDate(E1: Expense, E2: Expense) -> Bool {
		return E1.earlierThan(E2: E2)
	}
	
	func earlierThan(E2: Expense) -> Bool {
		return self.date < E2.date
	}
	
	func cheaperThan(E2: Expense) -> Bool {
		return self.amount < E2.amount
	}
	
	func toString() -> String {
		let joined_tags = "#" + self.tags.joined(separator: " #")
		return "\(self.date.description) \(self.amount) \(self.description) \(joined_tags)"
	}
}

struct MonthlyExpenses {
	private var expenses: [Expense] {
		didSet {
			self.expenses.sort(by: Expense.compareByDate(E1:E2:))
		}
	}
	
}
