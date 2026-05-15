from flask import Flask, render_template, request
import psycopg2
import os

app = Flask(__name__)

DB_HOST = os.environ.get("DB_HOST", "db")
DB_NAME = os.environ.get("DB_NAME", "messages")
DB_USER = os.environ.get("DB_USER", "user")
DB_PASS = os.environ.get("DB_PASS", "password")

def get_db_connection():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASS
    )

@app.route("/", methods=["GET", "POST"])
def index():
    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute("""
        CREATE TABLE IF NOT EXISTS messages (
            id SERIAL PRIMARY KEY,
            content TEXT
        )
    """)
    conn.commit()

    if request.method == "POST":
        message = request.form["message"]
        cur.execute("INSERT INTO messages (content) VALUES (%s)", (message,))
        conn.commit()

    cur.execute("SELECT content FROM messages")
    messages = cur.fetchall()

    cur.close()
    conn.close()

    return render_template("index.html", messages=messages)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
