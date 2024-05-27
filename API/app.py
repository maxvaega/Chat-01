from flask import Flask, request, jsonify
from interpreter import OpenInterpreter

app = Flask(__name__)

interpreter_instance = None

@app.route("/start-session", methods=["POST"])
def start_session():
    global interpreter_instance
    interpreter_instance = OpenInterpreter()
    return jsonify({"message": "Session started"}), 200

@app.route("/send-message", methods=["POST"])
def send_message():
    data = request.get_json()
    user_message = data.get("message")
    if interpreter_instance:
        response = interpreter_instance.chat(user_message)
        return jsonify({"reply": response}), 200
    return jsonify({"error": "Session not started"}), 400

@app.route("/stream-messages", methods=["GET"])
def stream_messages():
    if not interpreter_instance:
        return "Session not started", 400

    def generate():
        for message in interpreter_instance.stream():
            yield "data: {}\n\n".format(message)

    return app.response_class(generate, mimetype="text/event-stream")

if __name__ == "__main__":
    app.run(debug=True, port=5000)
