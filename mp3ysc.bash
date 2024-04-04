#!/bin/bash

# Instalar o Flask
sudo apt update
sudo apt install -y python3-pip
pip3 install Flask

# Criar o código Python
cat <<EOF > chat_server.py
import random
import string
from flask import Flask, request, render_template

app = Flask(__name__)
chat_rooms = {}

def generate_room_id():
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

@app.route('/')
def index():
    room_id = generate_room_id()
    chat_rooms[room_id] = []
    return render_template('index.html', room_id=room_id)

@app.route('/<room_id>')
def chat(room_id):
    if room_id not in chat_rooms:
        return "Room not found"
    return render_template('chat.html', room_id=room_id, messages=chat_rooms[room_id])

@app.route('/send_message', methods=['POST'])
def send_message():
    room_id = request.form['room_id']
    message = request.form['message']
    if room_id in chat_rooms:
        chat_rooms[room_id].append(message)
    return '', 204

if __name__ == '__main__':
    app.run(debug=True)
EOF

# Criar os modelos HTML
mkdir templates
cd templates

cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Room</title>
</head>
<body>
    <h1>Welcome to the Chat Room</h1>
    <p>Share this URL with others to join the chat: <strong>{{ room_id }}</strong></p>
</body>
</html>
EOF

cat <<EOF > chat.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Room</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.3.2/socket.io.js" integrity="sha384-xB2AAg/G1eLUwAnO6p+t0de+CkyVa/FHrhR1cNYn4Kec6u0SoUnk7XeB8UMmVqFq" crossorigin="anonymous"></script>
    <script>
        var socket = io.connect(window.location.origin);

        socket.on('connect', function() {
            console.log('Connected to server');
        });

        socket.on('message', function(data) {
            document.getElementById('messages').innerHTML += '<li>' + data + '</li>';
        });

        function sendMessage() {
            var message = document.getElementById('message').value;
            var room_id = document.getElementById('room_id').value;
            socket.emit('message', { message: message, room_id: room_id });
            document.getElementById('message').value = '';
        }
    </script>
</head>
<body>
    <h1>Chat Room - {{ room_id }}</h1>
    <ul id="messages">
        {% for message in messages %}
            <li>{{ message }}</li>
        {% endfor %}
    </ul>
    <input type="text" id="message" placeholder="Type your message...">
    <input type="hidden" id="room_id" value="{{ room_id }}">
    <button onclick="sendMessage()">Send</button>
</body>
</html>
EOF

# Executar o servidor Flask
python3 ../chat_server.py
