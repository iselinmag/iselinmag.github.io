Feature: FR-001 Create single-choice quiz questions
    As a lecturer
    I want to create single-choice questions
    So that I can assess basic knowledge quickly

    # AC-01.01
    Scenario: Save a single-choice question with exactly one correct answer
        Given a lecturer enters the question "What is the capital of Norway?"
        And the lecturer provides 4 answer options: "Oslo", "Bergen", "Trondheim", and "Stavanger"
        And the lecturer marks "Oslo" as the only correct answer
        When the lecturer saves the question
        Then the system stores the question as a single-choice question
        And the question contains exactly 4 answer options
        And exactly 1 answer is stored as correct

    Scenario: Reject a question when more than one answer is marked as correct
        Given a lecturer enters the question "Which number is even?"
        And the lecturer provides 4 answer options: "2", "3", "4", and "5"
        And the lecturer marks "2" and "4" as correct
        When the lecturer saves the question
        Then the question is not stored
        And the lecturer is informed that exactly 1 correct answer must be selected

    Scenario: Reject a question when no answer is marked as correct
        Given a lecturer enters the question "Which planet is known as the Red Planet?"
        And the lecturer provides 4 answer options: "Earth", "Venus", "Mars", and "Jupiter"
        And the lecturer marks 0 answers as correct
        When the lecturer saves the question
        Then the question is not stored
        And the lecturer is informed that exactly 1 correct answer must be selected