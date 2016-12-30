Feature: Smoke
  In order to ensure the site is up
  As a website user
  I need to be able to see these pages

Scenario: Check dashboard elements
  Given I am on "/radio"
    Then I can see the following text
  | iplayer radio |
  | radio blog    |

Scenario: Check network homepage elements
  Given I am on "/radio2"
  Then I can see the following text
  | iplayer radio |
  | radio blog    |
  | radio 2       |

Scenario Outline: Check network homepage for radionav and listen link
  Given I am on <page>
  Then the page contains the following selectors 
  | .radionav .radionav__content                |
  | #on-air-container .on-air__listen-live--cta |

  Examples: of pages
  | page             |
  | "/radio2"        |
  | "/radio4"        |
  | "/radiowales"    |
  | "/radiobristol"  |
  | "/radiolondon"   |

  Scenario: Check homepage link
  Given I am on "/radio2"
  When I follow "iPlayer Radio"
  Then I arrive on "/radio"

  Scenario: Check radionav categories
  Given I am on "/radio"
  When I follow "Categories"
  Then I can see "All Categories"

Scenario Outline: Check selected stations links
  Given I am on "/radio/stations"
  When I follow <network>
  Then I arrive on <network_homepage>

  Examples: of networks and homepages
  | network               | network_homepage  |
  | "Radio 2"             | "/radio2"         |
  | "BBC Radio Berkshire" | "/radioberkshire" |



