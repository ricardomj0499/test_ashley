// See https://aka.ms/new-console-template for more information
using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

class Program {
    static void Main(string[] args) {
        //Se define el socket de escucha
        Socket escuchar = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        Socket conexion;
        IPEndPoint connect = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 6400);
        escuchar.Bind(connect);
        //Establecer la conexion
        escuchar.Listen(10);

        //Iniciar la conexion
        conexion = escuchar.Accept();
        Console.WriteLine("Conexión establecida :P");
        //por la red viajan bytes
        //por lo tanto se define una variable arregle de tipo
        //byte con un tamaño maximo de bytes a recibir
        byte[] recibir = new Byte[100];
        string datos = "";
        int tamanoArreglo = 0;

        //para almacenar el numero exacto de bytes que no envia el cliente
        tamanoArreglo = conexion.Receive(recibir, 0, recibir.Length, 0);
        //Recibe una referencia al arreglo que se quiere redimencionar, y el tamaño
        Array.Resize(ref recibir, tamanoArreglo);
        //convertir los bytes recibidos en una cadena de caracteres
        datos = Encoding.Default.GetString(recibir);
        Console.WriteLine("La imformación recibida es: " + datos);
        Console.ReadKey();
    }
}
