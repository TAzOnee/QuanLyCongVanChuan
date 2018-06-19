using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNS
{
    public partial class TrinhQuanLy : Form
    {
        public TrinhQuanLy()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnHD_Click(object sender, EventArgs e)
        {
            frmQlyCongVanDen frmCVDen = new frmQlyCongVanDen();
            this.Hide();
            frmCVDen.ShowDialog();
        }

        private void btnPB_Click(object sender, EventArgs e)
        {
            frmQlyCongVanDi frmCVDi = new frmQlyCongVanDi();
            this.Hide();
            frmCVDi.ShowDialog();
        }
    }
}
