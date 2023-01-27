﻿namespace CMPT_391_Student_Registration
{
    partial class Registration
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
            this.class_search_box = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.class_search_btn = new System.Windows.Forms.Button();
            this.term_label = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.user_label = new System.Windows.Forms.Label();
            this.class_view = new System.Windows.Forms.DataGridView();
            this.CourseID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sec_id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.building = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.day = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.start_time = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.end_time = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.room_number = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.capacity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.enrollment = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.register_button = new System.Windows.Forms.Button();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.class_view)).BeginInit();
            this.SuspendLayout();
            // 
            // class_search_box
            // 
            this.class_search_box.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.class_search_box.ForeColor = System.Drawing.SystemColors.GrayText;
            this.class_search_box.Location = new System.Drawing.Point(464, 279);
            this.class_search_box.Margin = new System.Windows.Forms.Padding(4);
            this.class_search_box.Name = "class_search_box";
            this.class_search_box.Size = new System.Drawing.Size(851, 30);
            this.class_search_box.TabIndex = 0;
            this.class_search_box.Text = "Enter keyword e.g. course, subject, class";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(75)))), ((int)(((byte)(143)))), ((int)(((byte)(140)))));
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label1.Location = new System.Drawing.Point(455, 218);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(376, 46);
            this.label1.TabIndex = 2;
            this.label1.Text = "Search for Classes";
            // 
            // class_search_btn
            // 
            this.class_search_btn.BackgroundImage = global::CMPT_391_Student_Registration.Properties.Resources.search1;
            this.class_search_btn.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.class_search_btn.Location = new System.Drawing.Point(1324, 277);
            this.class_search_btn.Margin = new System.Windows.Forms.Padding(4);
            this.class_search_btn.Name = "class_search_btn";
            this.class_search_btn.Size = new System.Drawing.Size(40, 37);
            this.class_search_btn.TabIndex = 1;
            this.class_search_btn.UseVisualStyleBackColor = true;
            this.class_search_btn.Click += new System.EventHandler(this.class_search_btn_Click);
            // 
            // term_label
            // 
            this.term_label.AutoSize = true;
            this.term_label.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(131)))), ((int)(((byte)(129)))));
            this.term_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.term_label.ForeColor = System.Drawing.SystemColors.ControlLight;
            this.term_label.Location = new System.Drawing.Point(40, 25);
            this.term_label.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.term_label.Name = "term_label";
            this.term_label.Size = new System.Drawing.Size(318, 46);
            this.term_label.TabIndex = 3;
            this.term_label.Text = "Semester + Year";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(75)))), ((int)(((byte)(143)))), ((int)(((byte)(140)))));
            this.panel1.Location = new System.Drawing.Point(417, 204);
            this.panel1.Margin = new System.Windows.Forms.Padding(4);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1013, 159);
            this.panel1.TabIndex = 4;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(131)))), ((int)(((byte)(129)))));
            this.panel2.Controls.Add(this.user_label);
            this.panel2.Controls.Add(this.term_label);
            this.panel2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.panel2.ImeMode = System.Windows.Forms.ImeMode.On;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Margin = new System.Windows.Forms.Padding(4);
            this.panel2.Name = "panel2";
            this.panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.panel2.Size = new System.Drawing.Size(1687, 138);
            this.panel2.TabIndex = 5;
            // 
            // user_label
            // 
            this.user_label.AutoSize = true;
            this.user_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.user_label.ForeColor = System.Drawing.SystemColors.ControlLight;
            this.user_label.Location = new System.Drawing.Point(44, 81);
            this.user_label.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.user_label.Name = "user_label";
            this.user_label.Size = new System.Drawing.Size(189, 25);
            this.user_label.TabIndex = 4;
            this.user_label.Text = "Logged In: First Last";
            // 
            // class_view
            // 
            this.class_view.AllowUserToAddRows = false;
            this.class_view.AllowUserToDeleteRows = false;
            this.class_view.AllowUserToResizeColumns = false;
            this.class_view.AllowUserToResizeRows = false;
            this.class_view.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.class_view.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(75)))), ((int)(((byte)(143)))), ((int)(((byte)(140)))));
            this.class_view.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.class_view.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.CourseID,
            this.sec_id,
            this.building,
            this.day,
            this.start_time,
            this.end_time,
            this.room_number,
            this.capacity,
            this.enrollment});
            this.class_view.EnableHeadersVisualStyles = false;
            this.class_view.Location = new System.Drawing.Point(417, 370);
            this.class_view.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.class_view.Name = "class_view";
            this.class_view.ReadOnly = true;
            this.class_view.RowHeadersWidth = 51;
            this.class_view.RowTemplate.Height = 24;
            this.class_view.Size = new System.Drawing.Size(1013, 443);
            this.class_view.TabIndex = 6;
            // 
            // CourseID
            // 
            this.CourseID.HeaderText = "Course";
            this.CourseID.MinimumWidth = 6;
            this.CourseID.Name = "CourseID";
            // 
            // sec_id
            // 
            this.sec_id.HeaderText = "Section";
            this.sec_id.MinimumWidth = 6;
            this.sec_id.Name = "sec_id";
            // 
            // building
            // 
            this.building.HeaderText = "Building";
            this.building.MinimumWidth = 6;
            this.building.Name = "building";
            // 
            // day
            // 
            this.day.HeaderText = "Days";
            this.day.MinimumWidth = 6;
            this.day.Name = "day";
            // 
            // start_time
            // 
            this.start_time.HeaderText = "Start Time";
            this.start_time.MinimumWidth = 6;
            this.start_time.Name = "start_time";
            // 
            // end_time
            // 
            this.end_time.HeaderText = "End Time";
            this.end_time.MinimumWidth = 6;
            this.end_time.Name = "end_time";
            // 
            // room_number
            // 
            this.room_number.HeaderText = "Room";
            this.room_number.MinimumWidth = 6;
            this.room_number.Name = "room_number";
            // 
            // capacity
            // 
            this.capacity.HeaderText = "Capacity";
            this.capacity.MinimumWidth = 6;
            this.capacity.Name = "capacity";
            // 
            // enrollment
            // 
            this.enrollment.HeaderText = "Enrolled";
            this.enrollment.MinimumWidth = 6;
            this.enrollment.Name = "enrollment";
            // 
            // register_button
            // 
            this.register_button.BackColor = System.Drawing.Color.White;
            this.register_button.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.register_button.Location = new System.Drawing.Point(1436, 753);
            this.register_button.Name = "register_button";
            this.register_button.Size = new System.Drawing.Size(166, 60);
            this.register_button.TabIndex = 7;
            this.register_button.Text = "Register";
            this.register_button.UseVisualStyleBackColor = false;
            this.register_button.Click += new System.EventHandler(this.register_button_Click);
            // 
            // Registration
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(25)))), ((int)(((byte)(31)))), ((int)(((byte)(38)))));
            this.ClientSize = new System.Drawing.Size(1685, 838);
            this.Controls.Add(this.register_button);
            this.Controls.Add(this.class_view);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.class_search_btn);
            this.Controls.Add(this.class_search_box);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.panel2);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Registration";
            this.Text = "Registration";
            this.Load += new System.EventHandler(this.Registration_Load);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.class_view)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox class_search_box;
        private System.Windows.Forms.Button class_search_btn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label term_label;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView class_view;
        private System.Windows.Forms.DataGridViewTextBoxColumn CourseID;
        private System.Windows.Forms.DataGridViewTextBoxColumn sec_id;
        private System.Windows.Forms.DataGridViewTextBoxColumn building;
        private System.Windows.Forms.DataGridViewTextBoxColumn day;
        private System.Windows.Forms.DataGridViewTextBoxColumn start_time;
        private System.Windows.Forms.DataGridViewTextBoxColumn end_time;
        private System.Windows.Forms.DataGridViewTextBoxColumn room_number;
        private System.Windows.Forms.DataGridViewTextBoxColumn capacity;
        private System.Windows.Forms.DataGridViewTextBoxColumn enrollment;
        private System.Windows.Forms.Label user_label;
        private System.Windows.Forms.Button register_button;
    }
}