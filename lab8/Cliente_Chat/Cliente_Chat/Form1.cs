using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Net;
using System.Net.Sockets;
using System.IO;
using Transitions;

namespace Cliente_Chat
{
    public partial class frm_cliente : Form

    {
        static private NetworkStream stream;
        static private StreamWriter streamW;
        static private StreamReader streamR;
        static private TcpClient client = new TcpClient();
        static private string nick = "unknow";

        private delegate void DaddItem(String s);

        private void addItem(String s) {
            listBox1.Items.Add(s);
        }

        public void listem() {
            while (client.Connected) {
                try
                {
                    this.Invoke(new DaddItem(addItem), streamR.ReadLine());
                }
                catch {
                    MessageBox.Show("No se ha podido conectar al servidor...");
                    Application.Exit();
                }
            }
        }
        s
        public void conectar() {
            try
            {
                client.Connect("127.0.0.1", 8000);
                if (client.Connected)
                {
                    Thread t = new Thread(Listen);
                    stream = client.GetStream();
                    streamW = new StreamWriter(stream);
                    streamR = new StreamReader(stream);

                    streamW.WriteLine(nick);
                    streamW.Flush();
                    t.Start();
                }
                else {
                    MessageBox.Show("Servidor no disponible");
                    Application.Exit();
                }

            }
            catch (Exception ex){
                MessageBox.Show("Servidor no disponible" + ex);
                Application.Exit();
            }
        }

        public frm_cliente()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}