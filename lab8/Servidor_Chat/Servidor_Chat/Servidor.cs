using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Net;
using System.Net.Sockets;
using System.IO;

namespace Servidor_Chat
{
    public class Servidor
    {
        private TcpListener server;
        private TcpClient client = new TcpClient();
        private IPEndPoint ipendpoint = new IPEndPoint(IPAddress.Any, 8000);
        private List<Connection> list = new List<Connection>();
        Connection con;

        private struct Connection
        {
            public NetworkStream stream;
            public StreamWriter streamW;
            public StreamReader streamR;
            public string nick;
        }

        public Servidor()
        {
            inicio();
        }

        public void inicio()
        {
            Console.WriteLine("Servidor Activado");
            server = new TcpListener(ipendpoint);
            server.Start();

            while (true)
            {
                client = server.AcceptTcpClient();
                con = new Connection();
                con.stream = client.GetStream();
                con.streamR = new StreamReader(con.stream);
                con.streamW = new StreamWriter(con.stream);
                con.nick = con.streamR.ReadLine();
                list.Add(con);
                Console.WriteLine("" + con.nick + "se a conectado...");

                Thread t = new Thread(escucharConexion);
                t.Start();
            }

            void escucharConexion()
            {
                Connection hcon = con;
                do
                {
                    try
                    {
                        string mensaje = hcon.streamR.ReadLine();
                        Console.WriteLine(hcon.nick + ": " + mensaje);
                        foreach (Connection c in list)
                        {
                            try
                            {
                                c.streamW.WriteLine(hcon.nick + ": " + mensaje);
                                c.streamW.Flush();
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("Error: " + ex);
                            }
                        }
                    }
                    catch
                    {
                        list.Remove(hcon);
                        Console.WriteLine(con.nick + " se ha desconectado");
                        break;
                    }
                } while (true);
            }
        }
    }
}
