Feature: Delete Snacks

@delete_snacks
Scenario: Delete Snack with a valid id
	Given the id 1
	And the snack does exist with id 1
	When I click on "Delete" button
	Then I get a 200 status code

Scenario: Delete Snack with an invalid id
	Given the id 2
	And the snack with id 2 does not exist
	When I click on "Delete Snack" button
	Then I get a message "The Snack does not exist"


