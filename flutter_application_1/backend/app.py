from flask import Flask, request, jsonify
from flask_cors import CORS  # Import the CORS extension
import pandas as pd

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

def get_loan_decision(user_data):
    try:
        monthly_income_str = user_data.get('What is your monthly income?')
        loan_amount_str = user_data.get('What is your desired loan amount?')
        
        monthly_income = float(monthly_income_str.replace('₹', '').replace(',', '')) if isinstance(monthly_income_str, str) else 0
        loan_amount = float(loan_amount_str.replace('₹', '').replace(',', '')) if isinstance(loan_amount_str, str) else 0

        if monthly_income < 5000:
            decision = "Rejected"
            reason = "Monthly income is too low."
        elif loan_amount > monthly_income * 5:
            decision = "Rejected"
            reason = "Requested loan amount exceeds income threshold."
        else:
            decision = "Approved"
            reason = "Meets basic underwriting criteria."

        return decision, reason
        
    except Exception as e:
        return "Error", f"An error occurred during underwriting: {e}"

@app.route('/underwrite', methods=['POST'])
def underwrite_loan():
    data = request.json
    print("Received data from app:", data)

    decision, reason = get_loan_decision(data)
    
    response = {
        "status": "completed",
        "decision": decision,
        "reason": reason,
        "application_data": data
    }
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True, port=5000)