using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movies
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbTitle.Text = Request.QueryString["title"];
            yearFrom.Text = Request.QueryString["yf"];
            yearTo.Text = Request.QueryString["yt"];
            tbGenre1.Text = Request.QueryString["genre1"];
        }

        protected void searchbt_Click(object sender, EventArgs e)
        {
                string title = tbTitle.Text;
                SqlDataSource1.SelectCommand = "SELECT f.filmName, f.year," +
                    " f.genre, f.runTime, f.boxSales, f.idmb, f.rotten, (SELECT AVG(rating)" +
                    " as expr1 from rating r WHERE(f.filmName = r.filmName)) as avgRating " +
                    "from film f where f.filmName LIKE('%" + title + "%')";
                SqlDataSource1.DataBind();
        }
    }
}