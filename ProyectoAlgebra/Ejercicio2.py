import numpy as np

# Ingresar las entradas de la matriz 3x3
print("Ingrese las entradas de la matriz A (3x3):")
A = []
for i in range(3):
    row = []
    for j in range(3):
        entry = float(input(f"A[{i+1},{j+1}]: "))
        row.append(entry)
    A.append(row)

# Calcular el determinante de la matriz A
determinante = np.linalg.det(A)

# Mostrar el resultado
print(f"\nEl determinante de la matriz A es: {determinante}")
