using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyNS
{
    public partial class frmQlyCongVan : Form
    {
        public frmQlyCongVan()
        {
            InitializeComponent();
        }
		DataConections dt = new DataConections();

        #region ShowData-ListView-ComboBox
        
        private void lvHDLD_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtMaCV.Enabled = false;
            btnThem.Enabled = false;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            if (lvCongVan.SelectedItems.Count == 0) return;
            ListViewItem liv = lvCongVan.SelectedItems[0];
            txtMaCV.Text = liv.SubItems[0].Text;
            txtLoaiCV.Text = liv.SubItems[1].Text;
            txtTenCV.Text = liv.SubItems[2].Text;
            cbbPhongban.Text = liv.SubItems[4].Text;
        }

        private void frmHDLD_Load(object sender, EventArgs e)
        {
            ShowData();
            NhanVien();
        }
        List<string> lst = new List<string>();
        private void ShowData()
        {
            dt.OpenConnection();
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from CongVan";
            cmd.Connection = dt.conn;

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string mahdld = reader.GetString(0);
                ListViewItem liv = new ListViewItem(reader.GetString(0));
                liv.SubItems.Add(reader.GetString(1));
                liv.SubItems.Add(reader.GetInt64(2).ToString());
                liv.SubItems.Add(reader.GetString(3));
                lst.Add(mahdld);
                lvCongVan.Items.Add(liv);
            }
            reader.Close();
        }

        private void NhanVien()
        {
            dt.OpenConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select N.MaNV from NHANVIEN N WHERE NOT EXISTS (SELECT * FROM HOPDONGLAODONG H WHERE N.MaNV=H.MaNV) ";
            cmd.Connection = dt.conn;

            SqlDataReader reader = cmd.ExecuteReader();
            cbbPhongban.Items.Clear();
            while (reader.Read())
            {
                string manvien = reader.GetString(0);
                cbbPhongban.Items.Add(manvien);
            }
            reader.Close();
        }

        string manv = "";
        private void cbbTenNV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string valuePM = cbbPhongban.SelectedItem.ToString();
            string[] arrPM = valuePM.Split('-');
            manv = arrPM[0];
        }
        #endregion

        #region DataBase

        public void AddHD_DataBase()
        {
            dt.OpenConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ThemHD";
            cmd.Connection = dt.conn;

            cmd.Parameters.Add("@MaHD", SqlDbType.NVarChar).Value = txtMaCV.Text;
            cmd.Parameters.Add("@LoaiHD", SqlDbType.NVarChar).Value = txtLoaiCV.Text;
            cmd.Parameters.Add("@Luongthoathuan", SqlDbType.BigInt).Value = Convert.ToInt64(txtTenCV.Text);
            cmd.Parameters.Add("@MaNV", SqlDbType.NVarChar).Value = manv;

            int ret = cmd.ExecuteNonQuery();
            lvCongVan.Items.Clear();
            if (ret > 0)
                ShowData();
        }

        public void RepairHD_Database()
        {
            dt.OpenConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SuaHD";
            cmd.Connection = dt.conn;

            cmd.Parameters.Add("@MaHD", SqlDbType.NVarChar).Value = txtMaCV.Text;
            cmd.Parameters.Add("@LoaiHD", SqlDbType.NVarChar).Value = txtLoaiCV.Text;
            cmd.Parameters.Add("@Luongthoathuan", SqlDbType.BigInt).Value = Convert.ToInt64(txtTenCV.Text);
            cmd.Parameters.Add("@MaNV", SqlDbType.NVarChar).Value = cbbPhongban.Text;

            int ret = cmd.ExecuteNonQuery();
            lvCongVan.Items.Clear();
            if (ret > 0)
                ShowData();

        }

        public void DeleteHD_Database()
        {
            dt.OpenConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "XoaHD";
            cmd.Connection = dt.conn;

            cmd.Parameters.Add("@MaHD", SqlDbType.NVarChar).Value = txtMaCV.Text;

            int ret = cmd.ExecuteNonQuery();
            lvCongVan.Items.Clear();
            if (ret > 0)
                ShowData();
        }


        #endregion
        #region Control
        private void btnThem_Click(object sender, EventArgs e)
        {
            /*ListViewItem liv = new ListViewItem(txtMaHD.Text);
            liv.SubItems.Add(txtLoaiHD.Text);
            liv.SubItems.Add(txtLuong.Text);
            liv.SubItems.Add(manv);            
            lvHDLD.Items.Add(liv);
            if (txtMaHD.Text == "")
                MessageBox.Show("Nhập mã hợp đồng!");
            else
            {
                if (cbbMaNV.Text == "")
                    MessageBox.Show("Nhập mã nhân viên");
                else
                {
                    if (txtLuong.Text == "")
                        txtLuong.Text = "0";
                    AddHD_DataBase();
                    MessageBox.Show("Đã thêm thành công");
                }
            }*/
            if (txtMaCV.Text != "")
            {
                bool check = true;
                foreach (string us in lst)
                {
                    if (us.Contains(txtMaCV.Text) && txtMaCV.Text.Contains(us))
                    {
                        MessageBox.Show("Mã HDLD đã tồn tại!","Thông báo");
                        check = false;
                        break;
                    }
                    check = true;
                }
                if (cbbPhongban.Text == "")
                {
                    MessageBox.Show("Chưa nhập mã nhân viên", "Thông báo");
                    check = false;                    
                }
                if (check == true)
                {
                    ListViewItem liv = new ListViewItem(txtMaCV.Text);
                    liv.SubItems.Add(txtLoaiCV.Text);
                    liv.SubItems.Add(txtTenCV.Text);
                    liv.SubItems.Add(manv);
                    lvCongVan.Items.Add(liv);
                    AddHD_DataBase();
                    MessageBox.Show("Thêm thành công", "Thêm");
                }
            }
            else
            {
                MessageBox.Show("Chưa nhập mã HDLD","Thông báo");
            }
        }
        
        private void btnSua_Click(object sender, EventArgs e)
        {
            
            if (cbbPhongban.Text == "")
            {
                MessageBox.Show("Nhập mã nhân viên","Thông báo");
            }
            else
            {
                if (txtTenCV.Text == "")
                    txtTenCV.Text = "0";
                btnThem.Enabled = true;
                if (lvCongVan.SelectedItems.Count == 0) return;
                ListViewItem liv = lvCongVan.SelectedItems[0];
                liv.SubItems[0].Text = txtMaCV.Text;
                liv.SubItems[1].Text = txtLoaiCV.Text;
                liv.SubItems[2].Text = cbbPhongban.Text;
                liv.SubItems[3].Text = txtTenCV.Text;
                RepairHD_Database();
                MessageBox.Show("Đã sửa thành công","Sửa");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (lvCongVan.SelectedItems != null)
            {
                for (int i = 0; i < lvCongVan.Items.Count; i++)
                {
                    if (lvCongVan.Items[i].Selected)
                    {
                        lvCongVan.Items[i].Remove();
                        i--;
                    }
                }
            }
            DeleteHD_Database();
            MessageBox.Show("Đã xoá thành công","Xoá");
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            txtMaCV.Enabled = true;
            txtMaCV.ResetText();
            txtLoaiCV.ResetText();
            txtTenCV.ResetText();
            cbbPhongban.Refresh();
            cbbPhongban.ResetText();
            
        }
        #endregion

        #region TimKiem_HDLD
        private void btnTimKiemHDLD_Click(object sender, EventArgs e)
        {
            if (cbbTKHDLD.SelectedIndex == 0)
            {
                string str = txtTimKiemHDLD.Text;
                dt.OpenConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from HOPDONGLAODONG Where MaHD like '%" + str + "%'";
                cmd.Connection = dt.conn;

                SqlDataReader reader = cmd.ExecuteReader();
                lvCongVan.Items.Clear();
                while (reader.Read())
                {
                    string mahdld = reader.GetString(0);
                    ListViewItem liv = new ListViewItem(reader.GetString(0));
                    liv.SubItems.Add(reader.GetString(1));
                    liv.SubItems.Add(reader.GetInt64(2).ToString());
                    liv.SubItems.Add(reader.GetString(3));
 
                    lvCongVan.Items.Add(liv);
                }
                reader.Close();

            }
            else if (cbbTKHDLD.SelectedIndex == 1)
            {
                string str = txtTimKiemHDLD.Text;
                dt.OpenConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from HOPDONGLAODONG Where LoaiHD like '%" + str + "%'";
                cmd.Connection = dt.conn;

                SqlDataReader reader = cmd.ExecuteReader();
                lvCongVan.Items.Clear();
                while (reader.Read())
                {
                    string mahdld = reader.GetString(0);
                    ListViewItem liv = new ListViewItem(reader.GetString(0));
                    liv.SubItems.Add(reader.GetString(1));
                    liv.SubItems.Add(reader.GetInt64(2).ToString());
                    liv.SubItems.Add(reader.GetString(3));

                    lvCongVan.Items.Add(liv);
                }
                reader.Close();

            }
            else if (cbbTKHDLD.SelectedIndex == 2)
            {
                string str = txtTimKiemHDLD.Text;
                dt.OpenConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from HOPDONGLAODONG Where MaNV like '%" + str + "%'";
                cmd.Connection = dt.conn;

                SqlDataReader reader = cmd.ExecuteReader();
                lvCongVan.Items.Clear();
                while (reader.Read())
                {
                    string mahdld = reader.GetString(0);
                    ListViewItem liv = new ListViewItem(reader.GetString(0));
                    liv.SubItems.Add(reader.GetString(1));
                    liv.SubItems.Add(reader.GetInt64(2).ToString());
                    liv.SubItems.Add(reader.GetString(3));

                    lvCongVan.Items.Add(liv);
                }
                reader.Close();

            }
        }
        #endregion

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
