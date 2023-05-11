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
	Then I receive a message "Description cannot be empty"

Scenario: Create Snack with empty price
	Given the description is "Test Snack"
	And the price is ""
	When I click on the "Create Snack" button
	Then I receive a message "Price cannot be empty"

Scenario: Create Snack with empty description and price
	Given the description is ""
	And the price is ""
	When I click on the "Create Snack" button
	Then I receive a message "Description cannot be empty"
	And I receive a message "Price cannot be empty"
	
	
