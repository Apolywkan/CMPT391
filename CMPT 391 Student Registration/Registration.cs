using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

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
            String connectionString = "Server = DESKTOP-JSPRNKM; Database = 391database; Trusted_Connection = yes;";
            // Need to change server to your personal SQL server before using (and Database if different)
            // Adam: DESKTOP-SO5MCT3
            // Zach: LAPTOP-HUT8634L
            // Jasper: LAPTOP-JPNKMR DESKTOP-JSPRNKM
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
            update_takes();
        }

        private void update_takes()
        {
            string year = "2023";
            string term = "Winter";
            term_label.Text = year + " " + term + " Term";
            myCommand.CommandType = CommandType.Text;
            myCommand.CommandText = "SELECT name from Student JOIN Logins ON Student.SID = Logins.SID WHERE Student.SID = " + SID;

            string input = "";

            try
            {
                myReader = myCommand.ExecuteReader();
                class_view.Rows.Clear();

                while (myReader.Read())
                {
                    input = myReader["name"].ToString();
                }
                myReader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Error");
            }

            string output = "";

            for (int i = 0; i < input.Length; i++)
            {
                if (i > 0 && char.IsUpper(input[i]) && char.IsLower(input[i - 1]))
                {
                    output += " ";
                }
                if (!char.IsNumber(input[i]))
                {
                    output += input[i];
                }
            }

            user_label.Text = "Logged In: " + output;

            this.AcceptButton = class_search_btn;

            // View classes tab
            //sql command using stored procedure
            //myCommand.CommandText = "SELECT S.*, T.grades, TS.day, TS.start_time, TS.endtime from Takes as T, Section as S, Time_slot as TS where T.sec_id = S.sec_id and S.time_slot_id = TS.time_slot_id and SID = " + SID;
            myCommand.CommandText = "SELECT * from vWFullCourses where SID = " + SID;

            try
            {
                //execute command
                myReader = myCommand.ExecuteReader();
                user_class_view.Rows.Clear();

                while (myReader.Read())
                {
                    //add results to the data grid view
                    user_class_view.Rows.Add(myReader["CourseID"].ToString(), myReader["sec_id"].ToString(),
                        myReader["day"].ToString(), myReader["start_time"].ToString(), myReader["endtime"].ToString(),
                        myReader["building"].ToString(), myReader["room_number"].ToString(), myReader["semester"].ToString(),
                        myReader["year"].ToString(), myReader["grades"].ToString());
                }
                myReader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Error");
            }
        }

        private void class_search_btn_Click(object sender, EventArgs e)
        {
            //if there is anything in the search box
            if (class_search_box.Text.Length > 0)
            {
                //Gets term from the top left text box, term[0] will be year, term[1] will be semester
                string[] term = term_label.Text.ToString().Split(' ');
                myCommand.CommandType = CommandType.Text;
                //remove spaces from user input
                string strippedInput = class_search_box.Text.Replace(" ", string.Empty);
                //sql command using stored procedure
                myCommand.CommandText = "exec ClassSearch @CourseID = '" + strippedInput + "%', @year = " + term[0] + ", @semester = '" + term[1] + "'";

                try
                {
                    //execute command
                    myReader = myCommand.ExecuteReader();
                    class_view.Rows.Clear();

                    while (myReader.Read())
                    {
                        //add results to the data grid view
                        class_view.Rows.Add(myReader["CourseID"].ToString(), myReader["sec_id"].ToString(), myReader["building"].ToString(),
                            myReader["day"].ToString(), myReader["start_time"].ToString(), myReader["endtime"].ToString(), myReader["semester"].ToString(),
                        myReader["year"].ToString(),
                            myReader["room_number"].ToString(), myReader["capacity"].ToString(), myReader["enrollment"].ToString());
                    }
                    myReader.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString(), "Error");
                }
            }
        }

        private void register_button_Click(object sender, EventArgs e)
        {
            //REF: https://www.youtube.com/watch?v=39OWGCTpaTk
            DataGridView dtg = class_view;

            //get how many classes are selected by the user
            int number_selected = class_view.GetCellCount(DataGridViewElementStates.Selected);

            if (number_selected == 1) //if only one class is selected
            {
                //get currently selected class from data grid
                String class_selection = dtg.CurrentRow.Cells[0].Value.ToString();
                String class_section = dtg.CurrentRow.Cells[1].Value.ToString();
                String year = dtg.CurrentRow.Cells[7].Value.ToString();
                String semester = dtg.CurrentRow.Cells[6].Value.ToString();

                String message = "Are you sure you want to enroll in " + class_selection;
                const string caption = "Confirm selection";
                var result = MessageBox.Show(message, caption, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                int regSuccess = 0;
                String successMessage = "You are enrolled in " + class_selection;
                String failMessage = "Enrollment not permitted";

                //If the yes button is pressed, run transaction
                if (result == DialogResult.Yes)
                {
                    //sql command using Transaction stored proc.
                    try
                    {
                        myCommand.CommandText = "spRegisterClass";
                        myCommand.CommandType = CommandType.StoredProcedure;
                        myCommand.Parameters.Clear();
                        SqlParameter param = new SqlParameter("@CourseID", SqlDbType.VarChar);
                        param.Direction = ParameterDirection.Input;
                        param.Value = class_selection;
                        myCommand.Parameters.Add(param);

                        SqlParameter param2 = new SqlParameter("@SID", SqlDbType.Int);
                        param2.Direction = ParameterDirection.Input;
                        param2.Value = SID;
                        myCommand.Parameters.Add(param2);

                        SqlParameter param3 = new SqlParameter("@sec_id", SqlDbType.Int);
                        param3.Direction = ParameterDirection.Input;
                        param3.Value = class_section;
                        myCommand.Parameters.Add(param3);

                        SqlParameter param4 = new SqlParameter("@year", SqlDbType.Int);
                        param4.Direction = ParameterDirection.Input;
                        param4.Value = year;
                        myCommand.Parameters.Add(param4);

                        SqlParameter param5 = new SqlParameter("@semester", SqlDbType.VarChar);
                        param5.Direction = ParameterDirection.Input;
                        param5.Value = semester;
                        myCommand.Parameters.Add(param5);


                        SqlParameter retval = myCommand.Parameters.Add("@success", SqlDbType.Int);
                        retval.Direction = ParameterDirection.Output;

                        myCommand.ExecuteNonQuery();

                        regSuccess = (int)retval.Value;

                        if (regSuccess == 1)
                        {
                            MessageBox.Show(successMessage);
                            // return;
                            update_takes();
                            class_search_btn.PerformClick();
                        }
                        else
                        {
                            MessageBox.Show(failMessage);
                        }
                        myCommand.CommandType = CommandType.Text;

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString(), "Error");
                    }
                }
            }
            else if (number_selected == 0) //if no classes are selected
            {
                MessageBox.Show("No classes selected.");


            }
            else //if too many classes are selected
            {
                MessageBox.Show("Select only one class.");
            }
        }

        private void class_search_box_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(class_search_box.Text))
            {
                class_search_box.Text = "";
            }
        }

        private void class_search_box_Leave(object sender, EventArgs e)
        {
            if (class_search_box.Text == "")
            {
                class_search_box.Text = "Enter keyword e.g. course, subject, class";
            }
        }

        private void remove_btn_Click(object sender, EventArgs e)
        {
            DataGridView test = user_class_view;

            int number_selected = user_class_view.GetCellCount(DataGridViewElementStates.Selected);

            if (number_selected == 1) //if only one class is selected
            {
                //get currently selected class from data grid
                String course_id = test.CurrentRow.Cells[0].Value.ToString();

                DialogResult result = MessageBox.Show("Are you sure you want to remove this row?", "Confirm", MessageBoxButtons.YesNo);

                if (result == DialogResult.Yes)
                {
                    try
                    {
                        myCommand.CommandText = "DELETE FROM Takes WHERE SID = " + SID + "and CourseID = '" + course_id + "'";
                        myCommand.ExecuteNonQuery();
                        myCommand.CommandText = "UPDATE Section SET Section.enrollment = enrollment - 1 WHERE Section.CourseID = '" + course_id + "'; ";
                        myCommand.ExecuteNonQuery();
                        update_takes();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString(), "Error");
                    }
                }

            }
        }
    }
}

