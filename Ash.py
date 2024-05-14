import numpy as np


def calcular_determinante():
    print("Ingrese las entradas de la matriz 3x3:")
    matriz = []
    for i in range(3):
        fila = input(f"Fila {i + 1}: ").split()
        fila = [float(x) for x in fila]
        matriz.append(fila)

    determinante = np.linalg.det(matriz)
    print(f"El determinante de la matriz es: {determinante}")


def resolver_sistema():
    print("Ingrese las entradas del sistema de ecuaciones 3x3:")
    sistema = []
    for i in range(3):
        ecuacion = input(
            f"Ecuación {i + 1} (separe coeficientes con espacios): "
        ).split()
        ecuacion = [float(x) for x in ecuacion]
        sistema.append(ecuacion)

    matriz_coeficientes = np.array([ecuacion[:3] for ecuacion in sistema])
    vector_resultados = np.array([ecuacion[2] for ecuacion in sistema])

    determinante_principal = np.linalg.det(matriz_coeficientes)

    if determinante_principal == 0:
        print("El sistema no tiene solución única (determinante principal = 0).")
    else:
        soluciones = []
        for i in range(3):
            matriz_copia = matriz_coeficientes.copy()
            matriz_copia[:, i] = vector_resultados
            determinante_i = np.linalg.det(matriz_copia)
            solucion_i = determinante_i / determinante_principal
            soluciones.append(solucion_i)
            print(f"X{i+1} = {solucion_i}")

        print("Las soluciones del sistema son:")
        print(f"X1 = {soluciones[0]}")
        print(f"X2 = {soluciones[1]}")
        print(f"X3 = {soluciones[2]}")


if __name__ == "__main__":
    print("1. Calcular el determinante de una matriz 3x3")
    print("2. Resolver un sistema de ecuaciones 3x3 con la regla de Cramer")
    opcion = input("Ingrese el número de la opción que desea ejecutar: ")

    if opcion == "1":
        calcular_determinante()
    elif opcion == "2":
        resolver_sistema()
    else:
        print("Opción no válida. Por favor, seleccione 1 o 2.")
