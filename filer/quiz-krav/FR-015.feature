Feature: FR-015 Generate a report of collected quiz results after quiz completion
    As a lecturer
    I want the system to generate a report immediately after quiz completion
    So that I can document results

    # AC-03.02
    Scenario: Automatically generate a downloadable report when all quiz submissions are finalized
        Given a quiz named "Quiz" has 25 enrolled students
        And 25 out of 25 submissions are finalized
        When the quiz is completed
        Then the system automatically generates 1 report for "Quiz"
        And the report is downloadable
        And the report contains results from all 25 finalized submissions

    Scenario: Do not generate the report if at least one submission is not finalized
        Given a quiz named "Quiz" has 25 enrolled students
        And 24 submissions are finalized
        And 1 submission is still not finalized
        When the quiz reaches its scheduled end
        Then the system does not generate the report
        And the lecturer is informed that the report is available only after all submissions are 
        finalized

    Scenario: Generate a report for a quiz with no student submissions
        Given a quiz named "Optional Quiz" has 10 enrolled students
        And 0 students submitted the quiz
        And all submissions are finalized
        When the quiz is completed
        Then the system automatically generates 1 report for "Optional Quiz"
        And the report is downloadable
        And the report shows 0 submitted results