Feature: FR-008 Create quizzes by selecting existing questions
    As a lecturer
    I want to create a quiz by selecting previously created quiz questions
    So that I can assemble assessments efficiently

    # AC-02.01
    Scenario: Save a quiz with multiple selected existing questions in the defined order
        Given a lecturer has existing questions with the IDs Q1, Q2, Q3, and Q4
        And the lecturer creates a quiz named "Practice Quiz"
        And the lecturer selects the questions Q3, Q1, and Q4 in this order
        When the lecturer saves the quiz
        Then the quiz "Practice Quiz" contains exactly 3 questions
        And the questions are stored in the order Q3, Q1, Q4

    Scenario: Reject saving a quiz without any selected questions
        Given a lecturer has existing questions with the IDs Q1, Q2, and Q3
        And the lecturer creates a quiz named "Weekly Quiz"
        And the lecturer selects no questions
        When the lecturer saves the quiz
        Then the quiz is not created
        And the lecturer is informed that at least 1 existing question must be selected

    Scenario: Reject saving a quiz when the same question is selected more than once
        Given a lecturer has existing questions with the IDs Q1, Q2, and Q3
        And the lecturer creates a quiz named "Exam Quiz"
        And the lecturer selects the questions Q1, Q2, and Q1
        When the lecturer saves the quiz
        Then the quiz is not created
        And the lecturer is informed that a question can only appear once in the same quiz