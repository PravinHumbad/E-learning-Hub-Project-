<?php
include '../components/connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect data from the form
    $question = $_POST['question'];
    $option1 = $_POST['option1'];
    $option2 = $_POST['option2'];
    $option3 = $_POST['option3'];
    $option4 = $_POST['option4'];
    $correct_answer = $_POST['correct_answer'];

    // Insert the data into the database
    $insert_question = $conn->prepare("INSERT INTO quiz_questions (question, option1, option2, option3, option4, correct_answer) VALUES (?, ?, ?, ?, ?, ?)");
    $insert_question->execute([$question, $option1, $option2, $option3, $option4, $correct_answer]);

    if ($insert_question) {
        // Redirect back to the dashboard with a success message
        header("Location: dashboard.php?success=Question added successfully");
        exit();
    } else {
        // Redirect back to the dashboard with an error message
        header("Location: dashboard.php?error=Failed to add question");
        exit();
    }
} else {
    // If the request method is not POST, redirect back to the dashboard
    header("Location: dashboard.php");
    exit();
}
?>
