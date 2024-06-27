<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Application</title>
</head>
<body>
    <!-- Start Page -->
    <div id="start-page">
        <h1>Welcome to the Quiz</h1>
        <label for="studentName">Enter your name: </label>
        <input type="text" id="studentName" name="studentName">
        <button onclick="startQuiz()">Start Quiz</button>
    </div>

    <!-- Quiz Section -->
    <div id="quiz-section" style="display:none;">
        <div id="quiz"></div>
        <div id="options"></div>
    </div>

    <!-- Result Section -->
    <div id="result" style="display:none;"></div>

    <!-- Certificate Section -->
    <div id="certificate" style="display:none;">
        <h2>Congratulations, <span id="certificateName"></span>!</h2>
        <p>You have passed the quiz.</p>
    </div>

    <!-- Retest Section -->
    <div id="retest" style="display:none;">
        <p>Sorry, you did not pass. Try again.</p>
        <button onclick="restartQuiz()">Retake Quiz</button>
    </div>

    <script>
        let studentName = "";
        let questions = []; // This will be populated with questions fetched from the database
        let currentQuestion = 0;
        let score = 0;
        const passThreshold = 2; // Set the pass threshold to 2

        function startQuiz() {
            const nameInput = document.getElementById("studentName");
            studentName = nameInput.value.trim();

            if (studentName === "") {
                alert("Please enter your name to start the quiz.");
            } else {
                document.getElementById("start-page").style.display = "none";
                document.getElementById("quiz-section").style.display = "block";
                fetchQuestionsFromDatabase(); // Fetch questions from the database
            }
        }

        function fetchQuestionsFromDatabase() {
            console.log("Start Quiz button clicked.");
            const nameInput = document.getElementById("studentName");
            console.log("Name input value:", nameInput.value.trim());
            fetch('./fetch_questions.php')
                .then(response => response.json())
                .then(data => {
                    questions = data; // Populate questions array with fetched data
                    loadQuestion(); // Call loadQuestion() after fetching questions
                })
                .catch(error => console.error('Error fetching questions:', error));
        }

        function loadQuestion() {
            const quizElement = document.getElementById("quiz");
            const optionsElement = document.getElementById("options");

            quizElement.textContent = `${currentQuestion + 1}. ${questions[currentQuestion].question}`;

            optionsElement.innerHTML = "";

            for (const option of questions[currentQuestion].options) {
                const button = document.createElement("button");
                button.textContent = option;
                button.onclick = () => checkAnswer(option);
                optionsElement.appendChild(button);
            }
        }

        function checkAnswer(selectedOption) {
            if (selectedOption === questions[currentQuestion].correctAnswer) {
                score++;
            }

            currentQuestion++;

            if (currentQuestion < questions.length) {
                loadQuestion();
            } else {
                showResult();
            }
        }

        function showResult() {
            const resultElement = document.getElementById("result");
            const certificateElement = document.getElementById("certificate");
            const retestElement = document.getElementById("retest");
            const certificateName = document.getElementById("certificateName");

            resultElement.textContent = `You scored ${score} out of ${questions.length}.`;
            resultElement.style.display = "block";

            if (score >= passThreshold) {
                certificateName.textContent = studentName;
                certificateElement.style.display = "block";
                retestElement.style.display = "none";
            } else {
                certificateElement.style.display = "none";
                retestElement.style.display = "block";
            }
        }

        function restartQuiz() {
            document.getElementById("start-page").style.display = "block";
            document.getElementById("quiz-section").style.display = "none";
            document.getElementById("result").style.display = "none";
            document.getElementById("certificate").style.display = "none";
            document.getElementById("retest").style.display = "none";
            document.getElementById("quiz").textContent = "";
            document.getElementById("options").innerHTML = "";

            // Reset variables
            currentQuestion = 0;
            score = 0;
        }
    </script>
</body>
</html>
