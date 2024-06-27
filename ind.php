<?php
// Include database connection file
include 'components/connect.php';

// Fetch random question from the database
$sql = "SELECT * FROM quiz_questions ORDER BY RAND() LIMIT 1"; // Change 'your_table' to the actual table name
$result = $conn->query($sql);

// Check if there are any rows returned
if ($result->rowCount() > 0) {
    $row = $result->fetch(PDO::FETCH_ASSOC); // Fetch the random question
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java MCQ Quiz</title>
    <link rel="stylesheet" href="sty.css">
</head>

<body>

    <div class="quiz-container">
        <!-- Start Quiz Form -->
        <form id="start-page">
            <h2>Welcome to the Java MCQ Quiz!</h2>
            <label for="studentName">Enter your name: </label>
            <input type="text" id="studentName" placeholder="Your Name">
            <button type="button" onclick="startQuiz()">Start Quiz</button>
        </form>

        <!-- Quiz Section -->
        <div id="quiz-section" style="display: none;">
            <div id="quiz" class="question"></div>

            <!-- Display Options -->
            <div id="options" class="options"></div>

            <!-- Next Button -->
            <button id="nextBtn" onclick="nextQuestion()">Next</button>

            <!-- Result Display -->
            <div id="result"></div>

            <!-- Certificate Section -->
            <div id="certificate" style="display: none;">
                <h2>Congratulations, <span id="studentNameDisplay"></span>!</h2>
                <p>This is to certify that <span id="certificateName"></span> has successfully completed the Java MCQ Quiz.</p>
                <button onclick="restartQuiz()">Restart Quiz</button>
                <br>
                <button onclick="dnld()" id="downloadBtn">Download Certificate</button>
            </div>

            <!-- Retest Section -->
            <div id="retest" style="display: none;">
                <h2>Retest Required</h2>
                <p>Your score is below the passing threshold. Please retest to improve your score.</p>
                <button onclick="restartQuiz()">Retest</button>
            </div>
        </div>

    </div>

    <script src="quiz.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.66/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.66/vfs_fonts.js"></script>
    <script>
  
  function dnld() {
    console.log("dnld clicked")
      const name = document.getElementById('studentName').value;
      const docDefinition = {
        content: [
          { text: 'Certificate of Achievement', style: 'header' },
          { text: `This is to certify that ${name}`, style: 'name' },
          { text: 'has completed the course successfully.', style: 'info' }

      
        ],
        styles: {
          header: {
            fontSize: 22,
            bold: true,
            alignment: 'center',
            margin: [0, 0, 0, 20],
            color: '#FFD700'
          },
          name: {
            fontSize: 18,
            bold: true,
            alignment: 'center',
            margin: [0, 0, 0, 10],
            color: '#00BFFF'
          },
          info: {
            fontSize: 14,
            alignment: 'center'
          }
        }
      };

      const pdfDocGenerator = pdfMake.createPdf(docDefinition);
      pdfDocGenerator.download('Certificate.pdf');
    };
  </script>

</body>

</html>


<?php
} else {
    echo "No questions found.";
}
?>
