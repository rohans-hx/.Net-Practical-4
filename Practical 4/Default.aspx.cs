using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical_4
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";

            Male.Checked = false;
            Female.Checked = false;

            Paper.Checked = false;
            Poster.Checked = false;
            Coding.Checked = false;

            Calendar1.SelectedDate = DateTime.MinValue;
        }

        protected void CustomValidator1_ServerValidate(
            object source,
            ServerValidateEventArgs args)
        {
            args.IsValid = Male.Checked || Female.Checked;
        }

        protected void CustomValidator2_ServerValidate(
            object source,
            ServerValidateEventArgs args)
        {
            args.IsValid = Paper.Checked || Poster.Checked || Coding.Checked;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Response.Write("Registration Successful");
            }
        }
    }
}