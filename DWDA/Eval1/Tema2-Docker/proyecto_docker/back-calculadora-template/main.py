from urllib.request import Request

from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from calculadora import Calculadora

app = FastAPI()
calc = Calculadora()

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permite todos los orígenes (puedes restringir esto)
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos los métodos (GET, POST, etc.)
    allow_headers=["*"],  # Permite todos los encabezados
)

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/sumar/")
async def sumar(num1: int, num2: int):
    return {"resultado": calc.sumar(num1, num2)}

@app.get("/restar/")
async def restar(num1: int, num2: int):
    return {"resultado": calc.restar(num1, num2)}

@app.get("/multiplicar/")
async def multiplicar(num1: int, num2: int):
    return {"resultado": calc.multiplicar(num1, num2)}

@app.get("/dividir/")
async def dividir(num1: int, num2: int):
    return {"resultado": calc.dividir(num1, num2)}