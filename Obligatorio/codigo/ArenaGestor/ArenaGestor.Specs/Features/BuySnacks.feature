Feature: Buy Snacks

@buy_snacks
Scenario: Create Snack with valid data
	Given the description is "Test Snack"
	And the price is 5
	When I click on the "Create Snack" button
	Then I receive a message "Test Snack"

Scenario: Create Snack with invalid data
	Given the description is "Test Snack"
	And the price is -5
	When I click on the "Create Snack" button
	Then I receive a message "Price must be greater than 0"
	
Scenario: Create Snack with empty description
	Given the description is ""
	And the price is 5
	When I click on the "Create Snack" button
	Then I receive a message "The description must have at least one character"

Scenario: Create Snack with the same description
	Given the description is "Test Snack"
	And the snack "Test Snack" already exists
	And the price is 5
	When I click on the "Create Snack" button
	Then I receive a message "Snack description already exists."
	
	
