from fastapi.param_functions import File
import pytesseract
from PIL import Image
from fastapi import FastAPI, UploadFile, Response
import sqlite3
app = FastAPI()

@app.post('/uploadFile')
async def create_upload_file(file: UploadFile = File(...)):
    text = await file.read()
    file = open(file.filename, "wb+")    
    file.write(text)
    ocr = pytesseract.image_to_string(Image.open(file))
    print(ocr)
    # ocr = pytesseract.image_to_string(file)

    file.close()


@app.post("/registerUser")
async def registerUser(username, phone, password, name, response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        user = conn.execute("SELECT * FROM app_users WHERE phone_number=?", [phone])
        if user.fetchall() == []:
            conn.execute("INSERT INTO app_users (phone_number, username, password, name) VALUES (?,?,?,?)", [phone, username, password, name])
            conn.commit()
            conn.close()
            response.status_code = 200
        else:
            response.status_code = 404
    except:
        response.status_code = 502

@app.post("/login")
async def login(phone, password, response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        cur = conn.execute("SELECT * FROM app_users WHERE phone_number=? and password=?", [phone, password])
        arr = cur.fetchall()
        print(arr == [])
        if arr != []:
            users = {}
            for i in arr:
                users["id"] = i[0]
                users["username"] = i[1]
                users["password"] = i[2]
                users["name"] = i[3]
                users["phone_number"] = i[4]
            conn.close()
            response.status_code = 200
            return users
        else:
            response.status_code = 404

    except Exception as r:
        print(r)
        response.status_code = 502
        return {"result": "no such user"}


