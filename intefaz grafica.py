import mysql.connector
import tkinter as tk
from tkinter import messagebox

# Configuración de conexión a MySQL
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Filiph.nico03",
    database="Municipiobd"
)
cursor = db.cursor()

# Funciones SQL
def agregar_municipio():
    try:
        valores = (
            entry_nombre.get(),
            entry_poblacion.get(),
            entry_hombres.get(),
            entry_mujeres.get(),
            entry_edad.get(),
            entry_temperatura.get(),
            entry_ingreso.get(),
            entry_id_geografia.get(),
            entry_es_capital.get()
        )

        query = """INSERT INTO municipio (Nombre, Poblacion_total, Cantidad_hombres, Cantidad_mujeres, 
                   Edad_promedio, Temperatura_promedio, Ingreso_promedio, ID_Geografia, Es_Capital) 
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""

        cursor.execute(query, valores)
        db.commit()
        messagebox.showinfo("Éxito", "Municipio agregado correctamente")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error en la inserción: {err}")

def actualizar_edad_promedio():
    try:
        valores = (entry_edad.get(), entry_nombre.get())
        query = """UPDATE municipio 
                   SET Edad_promedio = %s 
                   WHERE Nombre = %s"""
        
        cursor.execute(query, valores)
        db.commit()
        messagebox.showinfo("Éxito", "Edad promedio actualizada correctamente")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error en la actualización: {err}")

def actualizar_ingreso_promedio():
    try:
        valores = (entry_ingreso.get(), entry_nombre.get())
        query = """UPDATE municipio 
                   SET Ingreso_promedio = %s 
                   WHERE Nombre = %s"""
        
        cursor.execute(query, valores)
        db.commit()
        messagebox.showinfo("Éxito", "Ingreso promedio actualizado correctamente")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error en la actualización: {err}")

def actualizar_municipio_completo():
    try:
        valores = (
            entry_poblacion.get(),
            entry_hombres.get(),
            entry_mujeres.get(),
            entry_edad.get(),
            entry_temperatura.get(),
            entry_ingreso.get(),
            entry_id_geografia.get(),
            entry_es_capital.get(),
            entry_nombre.get()
        )

        query = """UPDATE municipio 
                   SET Poblacion_total = %s, Cantidad_hombres = %s, Cantidad_mujeres = %s, Edad_promedio = %s, 
                       Temperatura_promedio = %s, Ingreso_promedio = %s, ID_Geografia = %s, Es_Capital = %s 
                   WHERE Nombre = %s"""
        
        cursor.execute(query, valores)
        db.commit()
        messagebox.showinfo("Éxito", "Municipio actualizado correctamente")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error en la actualización: {err}")


def eliminar_municipio():
    try:
        nombre = entry_nombre.get()
        query = "DELETE FROM municipio WHERE Nombre = %s"
        valores = (nombre,)
        cursor.execute(query, valores)
        db.commit()
        messagebox.showinfo("Éxito", "Municipio eliminado correctamente")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error en la eliminación: {err}")

def consultar_municipio():
    try:
        nombre = entry_nombre.get()
        query = """SELECT g.Nombre 
                   FROM municipio m 
                   JOIN geografia g ON m.ID_Geografia = g.ID 
                   WHERE m.Nombre = %s"""
        
        cursor.execute(query, (nombre,))
        resultado = cursor.fetchone()
        if resultado:
            messagebox.showinfo("Consulta", f"Departamento: {resultado[0]}")
        else:
            messagebox.showinfo("Consulta", "No se encontró el municipio")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error en la consulta: {err}")

def actualizar_hombres_mujeres():
    try:
        valores = (entry_hombres.get(), entry_mujeres.get(), entry_nombre.get())
        query = """UPDATE municipio 
                   SET Cantidad_hombres = %s, Cantidad_mujeres = %s 
                   WHERE Nombre = %s"""
        
        cursor.execute(query, valores)
        db.commit()
        messagebox.showinfo("Éxito", "Cantidad de hombres y mujeres actualizada correctamente")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error en la actualización: {err}")


# Interfaz gráfica con Tkinter
root = tk.Tk()
root.title("Gestión de Municipios")

# Labels y Entrys
tk.Label(root, text="Nombre:").pack()
entry_nombre = tk.Entry(root)
entry_nombre.pack()

tk.Label(root, text="Población Total:").pack()
entry_poblacion = tk.Entry(root)
entry_poblacion.pack()

tk.Label(root, text="Cantidad Hombres:").pack()
entry_hombres = tk.Entry(root)
entry_hombres.pack()

tk.Label(root, text="Cantidad Mujeres:").pack()
entry_mujeres = tk.Entry(root)
entry_mujeres.pack()

tk.Label(root, text="Edad Promedio:").pack()
entry_edad = tk.Entry(root)
entry_edad.pack()

tk.Label(root, text="Temperatura Promedio:").pack()
entry_temperatura = tk.Entry(root)
entry_temperatura.pack()

tk.Label(root, text="Ingreso Promedio:").pack()
entry_ingreso = tk.Entry(root)
entry_ingreso.pack()

tk.Label(root, text="ID Geografía:").pack()
entry_id_geografia = tk.Entry(root)
entry_id_geografia.pack()

tk.Label(root, text="Es Capital (1 o 0):").pack()
entry_es_capital = tk.Entry(root)
entry_es_capital.pack()

# Botones
tk.Button(root, text="Agregar Municipio", command=agregar_municipio).pack(pady=5)
tk.Button(root, text="Eliminar Municipio", command=eliminar_municipio).pack(pady=5)
tk.Button(root, text="Consultar Municipio", command=consultar_municipio).pack(pady=5)
tk.Button(root, text="Actualizar Edad Promedio", command=actualizar_edad_promedio).pack(pady=5)
tk.Button(root, text="Actualizar Ingreso Promedio", command=actualizar_ingreso_promedio).pack(pady=5)
tk.Button(root, text="Actualizar Municipio Completo", command=actualizar_municipio_completo).pack(pady=5)
tk.Button(root, text="Actualizar Hombres y Mujeres", command=actualizar_hombres_mujeres).pack(pady=5)


root.mainloop()

# Cerrar la conexión al salir
cursor.close()
db.close()
