namespace QuanLyNS
{
    partial class frmTrangChu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.btnHD = new System.Windows.Forms.Button();
            this.btnPB = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.LightSteelBlue;
            this.panel1.Controls.Add(this.btnHD);
            this.panel1.Controls.Add(this.btnPB);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(761, 498);
            this.panel1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(256, 105);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(284, 26);
            this.label1.TabIndex = 6;
            this.label1.Text = "Bạn muốn làm gì tiếp theo ?";
            // 
            // btnHD
            // 
            this.btnHD.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnHD.Font = new System.Drawing.Font("Courier New", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHD.ForeColor = System.Drawing.Color.White;
            this.btnHD.Image = global::QuanLyNS.Properties.Resources._101_128;
            this.btnHD.Location = new System.Drawing.Point(406, 164);
            this.btnHD.Margin = new System.Windows.Forms.Padding(2);
            this.btnHD.Name = "btnHD";
            this.btnHD.Size = new System.Drawing.Size(211, 187);
            this.btnHD.TabIndex = 8;
            this.btnHD.Text = "Quản lý công văn";
            this.btnHD.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnHD.UseVisualStyleBackColor = false;
            this.btnHD.Click += new System.EventHandler(this.btnHD_Click);
            // 
            // btnPB
            // 
            this.btnPB.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnPB.Font = new System.Drawing.Font("Courier New", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPB.ForeColor = System.Drawing.SystemColors.Info;
            this.btnPB.Image = global::QuanLyNS.Properties.Resources._833951_hotel_512x512;
            this.btnPB.Location = new System.Drawing.Point(162, 164);
            this.btnPB.Margin = new System.Windows.Forms.Padding(2);
            this.btnPB.Name = "btnPB";
            this.btnPB.Size = new System.Drawing.Size(214, 187);
            this.btnPB.TabIndex = 7;
            this.btnPB.Text = "Công văn theo phòng ban";
            this.btnPB.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnPB.UseVisualStyleBackColor = false;
            this.btnPB.Click += new System.EventHandler(this.btnPB_Click);
            // 
            // frmTrangChu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(761, 498);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "frmTrangChu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Trang chủ";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnHD;
        private System.Windows.Forms.Button btnPB;
    }
}