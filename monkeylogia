<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Questionário Monkey Logia</title>
    <style>
        body {
            background-color: #121212;
            color: #fff;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background-color: #222;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(255, 0, 128, 0.5);
        }
        button {
            background-color: #ff0080;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #d6006b;
        }
        .opções {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin: 20px 0;
        }
        .opção {
            background-color: #333;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
        .opção:hover {
            background-color: #444;
        }
        .selecionado {
            background-color: #ff0080 !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Questionário Monkey Logia</h1>
        <p id="question">Clique para começar...</p>
        <div class="opções" id="opções"></div>
        <button id="confirmButton" onclick="confirmAnswer()" disabled>Confirmar Resposta</button>
        <button id="nextButton" onclick="nextQuestion()" disabled>Próxima Pergunta</button>
        <p id="resultado"></p>
    </div>
    <script>
        const questions = [
            { question: "Você gosta de ter controle absoluto na intimidade?", options: ["Sim, é essencial", "Não, prefiro ser controlado", "Depende da ocasião", "Não me interessa"] },
            { question: "Você já experimentou ou tem curiosidade em bondage?", options: ["Já experimentei e adorei", "Tenho curiosidade", "Não é minha praia", "Definitivamente não"] },
            { question: "Você gosta de jogos de dominação e submissão?", options: ["Sim, adoro", "Depende do momento", "Não gosto", "Nunca tentei"] },
            { question: "Você prefere liderar ou seguir na intimidade?", options: ["Liderar", "Seguir", "Ambos", "Nenhum"] },
            { question: "Você já usou ou usaria acessórios como algemas ou vendas?", options: ["Sim, uso sempre", "Tenho curiosidade", "Não usaria", "Não gosto da ideia"] },
            { question: "A ideia de obedecer alguém na cama te excita?", options: ["Sim, muito", "Talvez", "Não gosto", "Não me excita"] },
            { question: "Você gosta de brincadeiras provocantes na intimidade?", options: ["Adoro", "Às vezes", "Não gosto", "Nunca tentei"] },
            { question: "Você já participou de jogos de poder na intimidade?", options: ["Sim, frequentemente", "Raramente", "Nunca", "Não tenho interesse"] },
            { question: "Você se considera mais ousado ou recatado na cama?", options: ["Muito ousado", "Moderado", "Recatado", "Depende da situação"] },
            { question: "Você gosta de explorar o prazer por meio de comandos?", options: ["Sim, amo isso", "Talvez", "Não gosto", "Nunca tentei"] },
            { question: "Você se sentiria confortável sendo dominado(a)?", options: ["Sim, muito", "Talvez", "Não gosto", "Nunca tentei"] },
            { question: "Você gosta de fantasias ousadas?", options: ["Sim, adoro", "Às vezes", "Não gosto", "Nunca tentei"] },
            { question: "A ideia de ser punido ou punir na cama te excita?", options: ["Sim, muito", "Depende", "Não gosto", "Nunca pensei nisso"] },
            { question: "Você gosta de elogiar ou ser elogiado na intimidade?", options: ["Elogiar", "Ser elogiado", "Ambos", "Nenhum"] },
            { question: "Você prefere experiências rápidas ou intensas?", options: ["Intensas", "Rápidas", "Ambas", "Nenhuma"] },
            { question: "Você se sente confortável em situações de vulnerabilidade na cama?", options: ["Sim, muito", "Talvez", "Não gosto", "Nunca tentei"] },
            { question: "Você gosta de usar ou experimentar roupas ousadas na intimidade?", options: ["Sim, amo", "Talvez", "Não gosto", "Nunca tentei"] },
            { question: "Você gosta de explorar os limites do prazer?", options: ["Sim, adoro", "Às vezes", "Não gosto", "Nunca tentei"] },
            { question: "Você gosta de receber comandos?", options: ["Sim, muito", "Talvez", "Não gosto", "Nunca tentei"] },
            { question: "Você gosta de provocar ou ser provocado?", options: ["Provocar", "Ser provocado", "Ambos", "Nenhum"] }
        ];

        let index = 0;
        let scores = { dominador: 0, submisso: 0, explorador: 0, manipulador: 0, "cadelinha sexual": 0, "escravo sexual": 0, "soca fofo": 0, "aventureiro sexual": 0 };
        let selectedAnswer = null;

        function nextQuestion() {
            if (index >= questions.length) {
                showResult();
                return;
            }

            document.getElementById("question").innerText = questions[index].question;
            const optionsContainer = document.getElementById("opções");
            optionsContainer.innerHTML = "";
            questions[index].options.forEach((option, i) => {
                const btn = document.createElement("div");
                btn.classList.add("opção");
                btn.innerText = option;
                btn.onclick = () => selectAnswer(btn, i);
                optionsContainer.appendChild(btn);
            });

            document.getElementById("confirmButton").disabled = true;
            document.getElementById("nextButton").disabled = true;
        }

        function selectAnswer(element, i) {
            document.querySelectorAll(".opção").forEach(opt => opt.classList.remove("selecionado"));
            element.classList.add("selecionado");
            selectedAnswer = i;
            document.getElementById("confirmButton").disabled = false;
        }

        function confirmAnswer() {
            if (selectedAnswer === null) return;
            registerAnswer(selectedAnswer);
            document.getElementById("confirmButton").disabled = true;
            document.getElementById("nextButton").disabled = false;
        }

        function registerAnswer(i) {
            if (i === 0) scores.dominador++;
            if (i === 1) scores.submisso++;
            if (i === 2) scores.explorador++;
            if (i === 3) scores["aventureiro sexual"]++;
            index++;
        }

        function showResult() {
            document.getElementById("question").innerText = "Fim do quiz!";
            document.getElementById("opções").innerHTML = "";
            document.getElementById("confirmButton").style.display = "none";
            document.getElementById("nextButton").style.display = "none";

            let maxScore = Math.max(...Object.values(scores));
            let profile = Object.keys(scores).find(key => scores[key] === maxScore);
            document.getElementById("resultado").innerText = `Seu perfil é: ${profile.replace("_", " ")}`;
        }

        nextQuestion();
    </script>
</body>
</html>
