Feature: Get Snacks

@get_snacks
Scenario: Get all snacks
	Given the snack with description "desc1", price 10 and id 1
	And snack with description "desc2", price 13 and id 2
	When I click on this button: "Get Snacks"
	Then I should see a list with two snacks with ids 1 and 2
