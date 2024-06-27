<?php
// Include database connection file
include 'components/connect.php';

// Fetch random question from the database
$sql = "SELECT * FROM quiz_questions ORDER BY RAND() LIMIT 5"; // Limit to 5 questions for testing
$result = $conn->query($sql);

// Check if there are any rows returned
if ($result->rowCount() > 0) {
    $questions = array();
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $questions[] = array(
            'question' => $row['question'],
            'options' => array(
                $row['option1'],
                $row['option2'],
                $row['option3'],
                $row['option4']
            ),
            'correctAnswer' => $row['correct_answer']
        );
    }
    echo json_encode($questions);
} else {
    echo json_encode(array('error' => 'No questions found'));
}
?>
