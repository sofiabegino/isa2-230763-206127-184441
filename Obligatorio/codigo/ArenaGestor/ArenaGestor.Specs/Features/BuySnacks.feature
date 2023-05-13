Feature: BuySnacks
	

@mytag
Scenario: Buy snacks with valid data
	Given the ticket id is "57F1B4CD-D610-4A1C-EF42-08DA4E703754"
	And the snack id is 1
	And the quantity is 1
	When the user buys the snack
	Then I then receive a message "Snack 1 with quantity 1 bought successfully"
	
Scenario: Buy snacks with invalid ticket id
	Given the ticket id is "57F1B4CD-D610-4A1C-EF42-08DA4E703755"
	And the ticket does not exist
	And the snack id is 1
	And the quantity is 1
	When the user buys the snack
	Then I then receive a message "Ticket not found."
	
Scenario: Buy snacks with invalid snack id
	Given the ticket id is "57F1B4CD-D610-4A1C-EF42-08DA4E703754"
	And the snack id is 0
	And the snack does not exist
	And the quantity is 1
	When the user buys the snack
	Then I then receive a message "Snack not found."
	
Scenario: Buy snacks with quantity 0
	Given the ticket id is "57F1B4CD-D610-4A1C-EF42-08DA4E703754"
	And the snack id is 1
	And the quantity is 0
	When the user buys the snack
	Then I then receive a message "Quantity must be greater than 0"
	
Scenario: Buy snacks with negative quantity
	Given the ticket id is "57F1B4CD-D610-4A1C-EF42-08DA4E703754"
	And the snack id is 1
	And the quantity is -1
	When the user buys the snack
	Then I then receive a message "Quantity must be greater than 0"
