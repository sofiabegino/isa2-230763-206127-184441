namespace ArenaGestor.Specs.Steps;

[Binding]
public sealed class SnacksStepDefinitions
{
    private readonly ScenarioContext _scenarioContext;

    public SnacksStepDefinitions(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
    }

    [Given(@"the description is ""(.*)""")]
    public void GivenTheDescriptionIs(string p0)
    {
        ScenarioContext.StepIsPending();
    }

    [Given(@"the price is (.*)")]
    public void GivenThePriceIs(int p0)
    {
        ScenarioContext.StepIsPending();
    }

    [When(@"I click on the ""(.*)"" button")]
    public void WhenIClickOnTheButton(string p0)
    {
        ScenarioContext.StepIsPending();
    }

    [Then(@"I receive a message ""(.*)""")]
    public void ThenIReceiveAMessage(string p0)
    {
        ScenarioContext.StepIsPending();
    }
}