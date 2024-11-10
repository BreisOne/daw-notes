
from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World"}

def test_sumar():
    response = client.get("/sumar/?num1=10&num2=5")
    assert response.status_code == 200
    assert response.json() == {"resultado": 15}

def test_restar():
    response = client.get("/restar/?num1=10&num2=5")
    assert response.status_code == 200
    assert response.json() == {"resultado": 5}

def test_multiplicar():
    response = client.get("/multiplicar/?num1=10&num2=5")
    assert response.status_code == 200
    assert response.json() == {"resultado": 50}

def test_dividir():
    response = client.get("/dividir/?num1=10&num2=5")
    assert response.status_code == 200
    assert response.json() == {"resultado": 2.0}

def test_dividir_por_cero():
    response = client.get("/dividir/?num1=10&num2=0")
    assert response.status_code == 200
    assert response.json() == {"resultado": "Error: No se puede dividir entre cero"}