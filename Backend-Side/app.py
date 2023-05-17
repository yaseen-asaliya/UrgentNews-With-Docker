from flask import Flask, jsonify
import mysql.connector
import os
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/news')
def get_data():
    cnx = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASS"),
        database=os.getenv("DB_NAME")
    )

    cursor = cnx.cursor()
    query = "SELECT * FROM News ORDER BY published_at DESC LIMIT 10"
    cursor.execute(query)
    result = cursor.fetchall()

    cursor.close()
    cnx.close()

    return jsonify(result)

if __name__ == '__main__':
    app.run()