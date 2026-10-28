Feature: FR-011 Schedule quiz availability with date, start time, and duration
    As a lecturer
    I want to define the date, start time, and duration of a quiz
    So that quizzes are only accessible within a defined time frame

    # AC-02.04
    Scenario: Students can access the quiz exactly at the defined start time
        Given a lecturer schedules a quiz named "Final Quiz"
        And the quiz date is set to 2026-04-10
        And the start time is set to 10:00
        And the duration is set to 60 minutes
        When the current time is 2026-04-10 10:00
        Then students can access the quiz
        And the quiz is available for participation

    Scenario: Students cannot access the quiz before the start time
        Given a lecturer schedules a quiz named "Final Quiz"
        And the quiz date is set to 2026-04-10
        And the start time is set to 10:00
        And the duration is set to 60 minutes
        When the current time is 2026-04-10 09:59
        Then students cannot access the quiz
        And the quiz is not visible for participation

    Scenario: Quiz automatically closes after the defined duration
        Given a lecturer schedules a quiz named "Final Quiz"
        And the quiz date is set to 2026-04-10
        And the start time is set to 10:00
        And the duration is set to 60 minutes
        When the current time is 2026-04-10 11:00
        Then the quiz is no longer accessible
        And students cannot submit or continue the quiz

    Scenario: Students cannot access the quiz after the duration has expired
        Given a lecturer schedules a quiz named "Final Quiz"
        And the quiz date is set to 2026-04-10
        And the start time is set to 10:00
        And the duration is set to 60 minutes
        When the current time is 2026-04-10 11:01
        Then students cannot access the quiz
        And the quiz is closed

    Scenario: Reject scheduling a quiz with zero or negative duration
        Given a lecturer creates a quiz named "Invalid Duration Quiz"
        And the quiz date is set to 2026-04-10
        And the start time is set to 10:00
        And the duration is set to 0 minutes
        When the lecturer saves the schedule
        Then the schedule is not saved
        And the lecturer is informed that duration must be greater than 0 minutes