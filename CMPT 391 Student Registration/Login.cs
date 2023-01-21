using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CMPT_391_Student_Registration
{
    public partial class Login : Form
    {
        public SqlConnection myConnection;
        public SqlCommand myCommand;
        public SqlDataReader myReader;
        public Login()
        {
            InitializeComponent();
            ///////////////////////////////
            String connectionString = "Server = LAPTOP-L6HCRV5P; Database = 391database; Trusted_Connection = yes;";
            // Need to change server to your personal SQL server before using (and Database if different)
            // Adam: 
            // Zack: 
            // Jasper: 
            // Salah: 


            /* Starting the connection */
            /*  SqlConnection myConnection = new SqlConnection("user id=temp2;" + // Username
                                         "password=adminadmin;" + // Password
                                         "server=localhost;" + // IP for the server
                                                               //"Trusted_Connection=yes;" +
                                         "database=ConnectTutorial; " + // Database to connect to
                                         "connection timeout=30"); // Timeout in seconds */

            SqlConnection myConnection = new SqlConnection(connectionString); // Timeout in seconds

            try
            {
                myConnection.Open(); // Open connection
                myCommand = new SqlCommand();
                myCommand.Connection = myConnection; // Link the command stream to the connection
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "Error");
                this.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string username = username_input.Text;
            string password = password_input.Text;

            if (username == "admin" && password == "password") //change later
            {
                Registration registrationForm = new Registration();
                registrationForm.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Invalid username or password.");
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.AcceptButton = btn_login;
        }
    }
}
