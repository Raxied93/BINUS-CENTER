﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestCaptcha.Halaman
{
    public partial class Report : System.Web.UI.Page
    {
        public class StudentRepository : TestCaptcha.StudentClass
        {
            public List<StudentClass> studentList = new List<StudentClass>();

            public List<StudentClass> GetStudents()
            {
                StudentClass student1 = new StudentClass();
                student1.No = 1;
                student1.Name = "Bhuvana";
                student1.Degree = "M.Tech";
                studentList.Add(student1);
                StudentClass student2 = new StudentClass();
                student2.No = 2;
                student2.Name = "Annie";
                student2.Degree = "B.Tech";
                studentList.Add(student2);
                StudentClass student3 = new StudentClass();
                student3.No = 3;
                student3.Name = "Muthu Abi";
                student3.Degree = "B.Tech";
                studentList.Add(student3);
                return studentList;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}