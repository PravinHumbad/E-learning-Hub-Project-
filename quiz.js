



let studentName = "";
let questions = []; // This will be populated with questions fetched from the database
let currentQuestion = 0;
let score = 0;
const passThreshold = 2; // Set the pass threshold here

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

// Update fetchQuestionsFromDatabase function
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

// Show result and handle certificate display
function showResult() {
    const resultElement = document.getElementById("result");
    const certificateElement = document.getElementById("certificate");
    const retestElement = document.getElementById("retest");
    const studentNameDisplay = document.getElementById("studentNameDisplay");
    const certificateName = document.getElementById("certificateName");

    resultElement.textContent = `You scored ${score} out of ${questions.length}.`;
    resultElement.style.display = "block";

    studentNameDisplay.textContent = studentName;

    if (score >= passThreshold) {
        certificateName.textContent = studentName;
        certificateElement.style.display = "block";
        retestElement.style.display = "none";
    } else {
        certificateElement.style.display = "none";
        retestElement.style.display = "block";
    }
}

// Restart quiz
function restartQuiz() {
    document.getElementById("start-page").style.display = "block";
    document.getElementById("quiz").textContent = "";
    document.getElementById("options").innerHTML = "";
    document.getElementById("result").textContent = "";
    document.getElementById("certificate").style.display = "none";
    document.getElementById("quiz-section").style.display = "none";

    // Reset variables
    currentQuestion = 0;
    score = 0;
}
