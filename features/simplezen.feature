Feature: Expanding tags

  Scenario: tagname
    Given I type "div"
    And I press "TAB"
    Then I should see "<div></div>"

  Scenario: tagname, part 2
    Given I type "h3"
    And I press "TAB"
    Then I should see "<h3></h3>"

  Scenario: keeps other stuff on the line
    Given I insert "abc div def"
    When I go to the end of the word "div"
    And I press "TAB"
    Then I should see "abc <div></div> def"

  Scenario: only completes valid html tags
    Given I type "abc"
    And I press "TAB"
    Then I should not see "<abc"

  Scenario: completes class names
    Given I type ".abc"
    And I press "TAB"
    Then I should see "<div class="abc"></div>"

  Scenario: completes ids
    Given I type "#abc"
    And I press "TAB"
    Then I should see "<div id="abc"></div>"

  Scenario: completes combinations names
    Given I type "ul#hmm.abc.def"
    And I press "TAB"
    Then I should see "<ul id="hmm" class="abc def"></ul>"

  Scenario: leaves self-closing tags closed
    Given I type "input.required"
    And I press "TAB"
    Then I should see "<input class="required">"
    And I should not see "</input>"