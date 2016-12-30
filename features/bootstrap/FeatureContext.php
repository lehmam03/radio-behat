<?php

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;

//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     * Initializes context.
     * Every scenario gets its own context object.
     *
     * @param array $parameters context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
        // Initialize your context here
    }


    /**
     * @Then /^I can see "([^"]*)"$/
     */
    public function iCanSee($text)
    {
        MinkContext::assertPageContainsText($text);
    }

    /**
     * @Then /^I can see the following text$/
     */
    public function iCanSeeTheFollowingText($table)
    {
        foreach ($table->getRowsHash() as $key => $value) {
            $this->iCanSee($key);
        }
    }
    
    /**
     * @Then /^the page contains the selector ([^"]*)$/
     */
    public function pageContainsCss($css)
    {
        $this->assertSession()->elementExists('css', $css);  
    }
    
    /**
     * @Then /^the page contains the following selectors$/
     */
    public function pageContainsCssSelectors($table)
    {
        foreach ($table->getRowsHash() as $key => $value) {
            $this->pageContainsCss($key);
        } 
    }

    /**
     * Checks, that current page PATH is equal to specified.
     *
     * @Then /^I arrive on "(?P<page>[^"]+)"$/
     */
    public function arriveOnPage($page)
    {
        MinkContext::assertPageAddress($page);
    }

}
