namespace Cliente_Chat
{
    partial class frm_cliente
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            listBox1 = new ListBox();
            label = new Label();
            btn_conectar = new Button();
            txt_usuario = new TextBox();
            textBox2 = new TextBox();
            btn_enviar = new Button();
            SuspendLayout();
            // 
            // listBox1
            // 
            listBox1.FormattingEnabled = true;
            listBox1.ItemHeight = 15;
            listBox1.Location = new Point(49, 23);
            listBox1.Name = "listBox1";
            listBox1.Size = new Size(497, 304);
            listBox1.TabIndex = 0;
            // 
            // label
            // 
            label.AutoSize = true;
            label.Location = new Point(102, 62);
            label.Name = "label";
            label.Size = new Size(47, 15);
            label.TabIndex = 1;
            label.Text = "Usuario";
            label.Click += label1_Click;
            // 
            // btn_conectar
            // 
            btn_conectar.Location = new Point(254, 191);
            btn_conectar.Name = "btn_conectar";
            btn_conectar.Size = new Size(75, 23);
            btn_conectar.TabIndex = 2;
            btn_conectar.Text = "Conectar";
            btn_conectar.UseVisualStyleBackColor = true;
            // 
            // txt_usuario
            // 
            txt_usuario.Location = new Point(106, 89);
            txt_usuario.Name = "txt_usuario";
            txt_usuario.Size = new Size(296, 23);
            txt_usuario.TabIndex = 3;
            // 
            // textBox2
            // 
            textBox2.Location = new Point(50, 340);
            textBox2.Name = "textBox2";
            textBox2.Size = new Size(240, 23);
            textBox2.TabIndex = 4;
            // 
            // btn_enviar
            // 
            btn_enviar.Location = new Point(335, 348);
            btn_enviar.Name = "btn_enviar";
            btn_enviar.Size = new Size(75, 23);
            btn_enviar.TabIndex = 5;
            btn_enviar.Text = "Enviar";
            btn_enviar.UseVisualStyleBackColor = true;
            // 
            // frm_cliente
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(btn_enviar);
            Controls.Add(textBox2);
            Controls.Add(txt_usuario);
            Controls.Add(btn_conectar);
            Controls.Add(label);
            Controls.Add(listBox1);
            Name = "frm_cliente";
            Text = "Form1";
            Load += Form1_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private ListBox listBox1;
        private Label label;
        private Button btn_conectar;
        private TextBox txt_usuario;
        private TextBox textBox2;
        private Button btn_enviar;
    }
}