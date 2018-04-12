using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Movies
{
	public partial class Admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                string username, password;
                username = Request.QueryString["username"];
                password = Request.QueryString["password"];
                message.Text = username + " " + password;

                /* 
                 * SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB; Initial Catalog = Movies; Integrated Security=SSPI;");
                 * SqlCommand check_User = new SqlCommand("SELECT COUNT(*) FROM users WHERE ( userName = @userName, Password = @password)", conn );
                 * check_User.Parameters.AddWithValue("@username", userName);
                 * check_User.Parameters.AddWithValue("@password", password);
                 * SqlDataReader reader = check_User.ExecuteReader();
                 * if(reader.HasRows)
                 * {
                 *  // make rest of page visable
                 * }
                 * else 
                 * {
                 *  // display message "username or password incorrect"
                 * }
               */


            }
        }

        protected void movieSubmit_Click(object sender, EventArgs e)
        {
            /* I cant get the connection to work and to be honest it's really driving me insaine
             * the error message says failed login for user 'DESKTOP-RIVKSFK\Phillip'
             * but I've tried using my username "Phillip"
             * and my pass "its not like your ganna come steal my computer" (pdjlras1219)
             * but nothing is going through and I can't figure out what I'm am doing worng
             * so.... yeah, maybe next time */

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB; Initial Catalog = MovieDB; Integrated Security=SSPI;");
            SqlCommand cmd = new SqlCommand("SELECT * FROM film WHERE filmName = " + tb_Title.Text + 
                "UPDATE film SET filmName = @filmName, year = @year, runTime = @runTime," +
                " genre = @genre, prodComp = @prodComp, boxSales = @boxSales, idmb = @idmb," + 
                " rotten = @rotten", con);
            con.Open();
            cmd.Parameters.AddWithValue("@filmName", tb_Title.Text);
            cmd.Parameters.AddWithValue("@year", tb_year.Text);
            cmd.Parameters.AddWithValue("@runTime", tb_runtime.Text);
            cmd.Parameters.AddWithValue("@genre", tb_genre.Text);
            cmd.Parameters.AddWithValue("@prodComp", tb_director.Text);
            cmd.Parameters.AddWithValue("@boxSales", tb_sales.Text);
            cmd.Parameters.AddWithValue("@idmb", tb_idmb.Text);
            cmd.Parameters.AddWithValue("@rotten", tb_rotten.Text);
            con.Close();
            cmd = new SqlCommand("SELECT * FROM rating WHERE filmName = " + tb_Title.Text +
                " AND rating = " + tb_user + "UPDATE rating SET filmName = @filmName, rating = @rating", con);
            con.Open();
            cmd.Parameters.AddWithValue("@filmName", tb_Title.Text);
            cmd.Parameters.AddWithValue("@rating", tb_user.Text);
            con.Close();
            GridView1.DataBind();
        }
    }
}