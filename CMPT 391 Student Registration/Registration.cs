using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CMPT_391_Student_Registration
{
    public partial class Registration : Form
    {
        public SqlConnection myConnection;
        public SqlCommand myCommand;
        public SqlDataReader myReader;
        
        //The logged in students Student ID (SID)
        public int SID { get; set; }
        public Registration()
        {
            InitializeComponent();
            ///////////////////////////////
            String connectionString = "Server = LAPTOP-JPNKMR; Database = 391database; Trusted_Connection = yes;";
            // Need to change server to your personal SQL server before using (and Database if different)
            // Adam: 
            // Zach: LAPTOP-HUT8634L
            // Jasper: LAPTOP-JPNKMR
            // Salah: 
            // Brittney: LAPTOP-L6HCRV5P


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

        private void Registration_Load(object sender, EventArgs e)
        {
            string year = "2023";
            string term = "Winter";
            term_label.Text = year + " " + term + " Term";

            this.AcceptButton = class_search_btn;
        }

        private void class_search_btn_Click(object sender, EventArgs e)
        {
            if (class_search_box.Text.Length > 0)
            {
                //Gets term from the top left text box, term[0] will be year, term[1] will be semester
                string[] term = term_label.Text.ToString().Split(' ');


                myCommand.CommandText = "select * from Section where CourseID like '" + class_search_box.Text + 
                    "%' and semester = '" + term[1] + "' and year = '" + term[0] + "'";

                try
                {
                    myReader = myCommand.ExecuteReader();
                    class_view.Rows.Clear();

                    while (myReader.Read())
                    {
                        class_view.Rows.Add(myReader["CourseID"].ToString(), myReader["sec_id"].ToString(), myReader["time_slot_id"].ToString(),
                            myReader["building"].ToString(), myReader["room_number"].ToString(), myReader["capacity"].ToString(),
                            myReader["enrollment"].ToString());
                    }
                    myReader.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString(), "Error");
                }
            }
        }
    }




  }

