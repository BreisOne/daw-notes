import pytest
from calculadora import Calculadora

@pytest.fixture
def calc():
    return Calculadora()

def test_sumar(calc):
    assert calc.sumar(5, 3) == 8
    assert calc.sumar(-1, -1) == -2
    assert calc.sumar(0, 0) == 0

def test_restar(calc):
    assert calc.restar(5, 3) == 2
    assert calc.restar(-1, -1) == 0
    assert calc.restar(0, 5) == -5

def test_multiplicar(calc):
    assert calc.multiplicar(5, 3) == 15
    assert calc.multiplicar(-1, -1) == 1
    assert calc.multiplicar(0, 5) == 0

def test_dividir(calc):
    assert calc.dividir(6, 3) == 2
    assert calc.dividir(-6, -3) == 2
    assert calc.dividir(0, 5) == 0

def test_dividir_por_cero(calc):
    assert calc.dividir(5, 0) == "Error: No se puede dividir entre cero"