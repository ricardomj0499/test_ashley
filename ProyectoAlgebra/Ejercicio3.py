import numpy as np

# Ingresar las entradas del sistema de ecuaciones 3x3
print("Ingrese las entradas del sistema de ecuaciones 3x3:")
A = []
b = []

for i in range(3):
    row = []
    for j in range(3):
        entry = float(input(f"A[{i+1},{j+1}]: "))
        row.append(entry)
    A.append(row)
    result = float(input(f"b[{i+1}]: "))
    b.append(result)

# Calcular los determinantes
det_A = np.linalg.det(A)

# Calcular los determinantes con reemplazo
solutions = []
for i in range(3):
    A_i = [row[:] for row in A]  # Copia la matriz A para no modificar la original
    for j in range(3):
        A_i[j][i] = b[j]  # Asigna el valor de b a la columna i de A_i
    det_A_i = np.linalg.det(A_i)
    solution = det_A_i / det_A
    solutions.append(solution)


# Mostrar los resultados
print("\n----- Resultados -----")
print(f"Determinante de A: {det_A}")
for i, sol in enumerate(solutions):
    print(f"Solución para x{i+1}: {sol}")
