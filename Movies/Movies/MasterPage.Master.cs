using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movies
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sbBTitle_Click(object sender, EventArgs e)
        {
            string title = sbTitle.Text;
            Response.Redirect("Search2.aspx?title=" + title);
        }

        protected void sbByear_Click(object sender, EventArgs e)
        {
            string from = sbYearF.Text;
            string to = sbYearT.Text;
            Response.Redirect("Search2.aspx?yf=" + from + "&yt=" + to);
        }

        protected void sbBGenre_Click(object sender, EventArgs e)
        {
            string g1 = sbGenre.Text;
            Response.Redirect("Search2.aspx?genre1=" + g1);
        }

        protected void bLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx?username=" + userName.Text + "&password=" + Password.Text);
        }
    }
}