using System;
using System.Data.SqlClient;
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
            this.AcceptButton = btn_login;
        }


        private void button1_Click(object sender, EventArgs e)
        {
            ///////////////////////////////
            String connectionString = "Server = DESKTOP-SO5MCT3; Database = 391database; Trusted_Connection = yes;";
            // Need to change server to your personal SQL server before using (and Database if different)
            // Adam: DESKTOP-SO5MCT3
            // Zach: LAPTOP-HUT8634L
            // Jasper: LAPTOP-JPNKMR
            // Salah: 
            // Brittney: LAPTOP-L6HCRV5P

            SqlConnection myConnection = new SqlConnection(connectionString); // Timeout in seconds

            try
            {
                myConnection.Open(); // Open connection
                myCommand = new SqlCommand();
                myCommand.Connection = myConnection; // Link the command stream to the connection
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Error");
                this.Close();
            }
            ///////////////////////////////

            //Takes user input
            string username = username_input.Text;
            string password = password_input.Text;

            //Find a matching value
            string queryString = "SELECT * FROM Logins WHERE username = @username AND password = @password";

            myCommand.CommandText = queryString;
            myCommand.Parameters.AddWithValue("@username", username);
            myCommand.Parameters.AddWithValue("@password", password);

            //If successful then they can login
            try
            {
                myReader = myCommand.ExecuteReader();
                if (myReader.HasRows)
                {
                    while (myReader.Read())
                    {
                        Registration registrationForm = new Registration();
                        registrationForm.SID = (int)myReader["SID"];
                        registrationForm.Show();
                        this.Hide();
                    }
                }
                else
                {
                    MessageBox.Show("Invalid Username or Password");
                }
            }
            //If unsuccessful then they cannot login
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                myReader.Close();
            }
        }
    }
}
