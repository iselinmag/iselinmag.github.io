Feature: FR-013 Compare quiz results with previous quiz attempts
    As a lecturer
    I want to compare quiz results with previous attempts
    So that I can measure learning progress

    # AC-03.04
    Scenario: Compare two completed quiz attempts and display performance differences side by side
        Given a student has completed "Quiz 1" with a score of 12 out of 20 points
        And the same student has completed "Quiz 2" with a score of 16 out of 20 points
        When the lecturer compares the two completed quiz results
        Then the system displays both quiz results side by side
        And the score difference is shown as 4 points
        And the percentage changes from 60% to 80%

    Scenario: Show decreased performance when the second quiz result is lower
        Given a student has completed "Quiz 1" with a score of 18 out of 20 points
        And the same student has completed "Quiz 2" with a score of 14 out of 20 points
        When the lecturer compares the two completed quiz results
        Then the system displays both quiz results side by side
        And the score difference is shown as minus 4 points
        And the percentage changes from 90% to 70%

    Scenario: Show no performance difference when both quiz results are equal
        Given a student has completed "Quiz 1" with a score of 15 out of 20 points
        And the same student has completed "Quiz 2" with a score of 15 out of 20 points
        When the lecturer compares the two completed quiz results
        Then the system displays both quiz results side by side
        And the score difference is shown as 0 points
        And both results are shown as 75%

    Scenario: Reject comparison if one selected quiz attempt is not completed
        Given a student has completed "Quiz 1" with a score of 13 out of 20 points
        And "Quiz 2" has been started but not completed
        When the lecturer compares the two quiz attempts
        Then the comparison is not shown
        And the lecturer is informed that only completed quiz attempts can be compared

    Scenario: Reject comparison if fewer than two quiz attempts are available
        Given a student has completed only 1 quiz attempt with a score of 17 out of 20 points
        When the lecturer requests a comparison with previous attempts
        Then the comparison is not shown
        And the lecturer is informed that at least 2 completed quiz attempts are required