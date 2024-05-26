#v ersione semplice casalinga
# usa flask
#
#
# TODO:
# [x] verificare dipendenze


from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/send', methods=['POST'])
def receive_text():
    data = request.json
    text = data.get('text', '')
    # Fai qualcosa con il testo ricevuto
    return jsonify({"status": "success", "received_text": text})

@app.route('/receive', methods=['GET'])
def send_text():
    text_to_send = "Esempio di testo da inviare"
    return jsonify({"status": "success", "text": text_to_send})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000) 
