from typing import cast
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

# TODOIS LIST

@app.post("/addTodo")
async def addTodo(phone_number, todo, response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        conn.execute("INSERT INTO app_todolist (phone_number, todo_item) VALUES (?,?)", [phone_number, todo])
        conn.commit()
        conn.close()
        response.status_code = 200
    except:
        response.status_code = 404

@app.post("/getTodos")
async def getTodos(phone_number):
    conn = sqlite3.connect("db.sqlite3")
    cur = conn.execute("SELECT * FROM app_todolist WHERE phone_number=?", [phone_number])
    todos = []
    for i in cur.fetchall():
        todo = {}
        todo["id"] = i[0]
        todo["item"] = i[2]
        todos.append(todo)
    return todos
        

@app.post("/deleteTodo")
async def deleteTodos(pk, response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        conn.execute("DELETE FROM app_todolist WHERE id=?", [pk])
        conn.commit()
        conn.close()
        response.status_code = 200
    except Exception as r:
        print(r)
        response.status_code = 404

@app.post('/addBooks')
async def addBooks(response: Response,phone, name, city, pin, book):
    try:
        conn = sqlite3.connect("db.sqlite3")
        conn.execute("INSERT INTO app_donatebooks (phone_number, name, city_name, pin_code, book_name) VALUES (?,?,?,?,?)", [phone, name, city, pin, book])
        conn.commit()
        conn.close()
        response.status_code = 200
    except Exception as r:
        print(r)
        response.status_code = 404

@app.post("/getBooks")
async def getBooks(response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        cur = conn.execute("SELECT * FROM app_donatebooks")
        books = []
        for i in cur.fetchall():
            book = {}
            book["id"] = i[0]
            book["phone"] = i[1]
            book["name"] = i[2]
            book["city"] = i[3]
            book["pin"] = i[4]
            book["book"] = i[5]
            books.append(book)
        response.status_code = 200
        return books
    except Exception as e:
        print(e)
        response.status_code = 404

@app.post("/deleteBook")
async def deleteBook(pk, response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        conn.execute("DELETE from app_donatebooks WHERE id=?", [pk])
        conn.commit()
        conn.close()
        response.status_code = 200
    except:
        response.status_code = 404



@app.post("/addWeek")
async def addTodo(phone_number, todo, week, response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        conn.execute("INSERT INTO app_weeklypanner (phone_number, todo_item, week) VALUES (?,?,?)", [phone_number, todo, week])
        conn.commit()
        conn.close()
        response.status_code = 200
    except Exception as r:
        print(r)
        response.status_code = 404

@app.post("/getWeek")
async def getTodos(phone_number, week):
    conn = sqlite3.connect("db.sqlite3")
    cur = conn.execute("SELECT * FROM app_weeklypanner WHERE phone_number=? and week=?", [phone_number, week])
    todos = []
    for i in cur.fetchall():
        todo = {}
        todo["id"] = i[0]
        todo["item"] = i[2]
        todos.append(todo)
    return todos
        

@app.post("/deleteWeek")
async def deleteTodos(pk, response: Response):
    try:
        conn = sqlite3.connect("db.sqlite3")
        conn.execute("DELETE FROM app_weeklypanner WHERE id=?", [pk])
        conn.commit()
        conn.close()
        response.status_code = 200
    except Exception as r:
        print(r)
        response.status_code = 404