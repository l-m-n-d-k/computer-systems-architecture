import math
import time
import numpy as np

def function_to_integrate(x, k, function_type='sin'):
    """
    Вычисляет значение функции в точке x.

    Параметры:
    ----------
    x : float
        Точка, в которой вычисляется значение
    k : float
        Коэффициент функции
    function_type : str
        Тип функции: 'sin', 'x2', 'exp'
    """
    if function_type == 'sin':
        return k * np.sin(x)
    elif function_type == 'x2':
        return k * x * x
    elif function_type == 'exp':
        return k * np.exp(-x)
    else:
        raise ValueError(f"Неизвестный тип функции: {function_type}")

def sequential_integration(a, b, n, variant_param, function_type='sin'):
    """
    Последовательная реализация метода трапеций для численного интегрирования.

    Параметры:
    ----------
    a : float
        Нижняя граница интегрирования
    b : float
        Верхняя граница интегрирования
    n : int
        Число разбиений интервала
    variant_param : float
        Параметр функции (коэффициент k)
    function_type : str
        Тип функции: 'sin', 'x2', 'exp'

    Возвращает:
    -----------
    float
        Приближенное значение интеграла

    Описание метода:
    """
    # ВОССТАНОВЛЕНО: в листинге 11.7 пособия тело функции отсутствует
    # (после "Описание метода:" сразу идет "integral *= h"). Ниже - метод
    # трапеций по формуле из п. 11.8: I = h * (f(a)/2 + sum f(x_i) + f(b)/2).
    h = (b - a) / n

    # Граничные значения (k_0 = k_n = 1/2 после вынесения множителя h)
    integral = 0.5 * (function_to_integrate(a, variant_param, function_type) +
                      function_to_integrate(b, variant_param, function_type))

    # Внутренние точки (k_i = 1)
    for i in range(1, n):
        x = a + i * h
        integral += function_to_integrate(x, variant_param, function_type)

    # Умножаем на ширину трапеции
    integral *= h

    return integral
