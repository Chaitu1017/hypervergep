from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/underwrite', methods=['POST'])
def underwrite_loan():
    data = request.json
    print("Received data from app:", data)

    # TODO: Implement AI underwriting logic here

    # Placeholder response
    response = {
        "status": "success",
        "message": "Application received and under review.",
        "data": data
    }
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True, port=5000) # Use port 5000 by default