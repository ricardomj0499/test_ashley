// See https://aka.ms/new-console-template for more information
using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

class Program
{
    static void Main(string[] args)
    {
        //Se define el socket de escucha
        Socket escuchar = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        
        //Aqui iria la ip del servidor al cual se deberia conectar
        //Como estamos en la misma maquiba se pone la misma
        IPEndPoint connect = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 6400);
        //Estableciendo la conexion
        escuchar.Connect(connect);
        byte[] enviar = new Byte[100];
        string datos = "";
        Console.WriteLine("Ingrese la información a enviar: ");
        datos = Console.ReadLine();
        enviar = Encoding.Default.GetBytes(datos);
        escuchar.Send(enviar);
        //Console.WriteLine("Finalizar comunicación: s/n");

        Console.ReadKey();

    }
}

