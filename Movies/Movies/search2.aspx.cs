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
    public partial class search2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbTitle.Text = Request.QueryString["title"];
                yearFrom.Text = Request.QueryString["yf"];
                yearTo.Text = Request.QueryString["yt"];
                tbGenre1.Text = Request.QueryString["genre1"];
                searchDB();
            }
        }

        protected void searchbt_Click(object sender, EventArgs e)
        {
            searchDB();
        }

        public void searchDB()
        {
            SqlDataSource1.SelectCommand = "SELECT f.filmName, f.year," +
                    " f.genre, f.runTime, f.boxSales, f.idmb, f.rotten, (SELECT AVG(rating)" +
                    " as expr1 from rating r WHERE(f.filmName = r.filmName)) as avgRating " +
                    "from film f";
            string title = tbTitle.Text, yearf = yearFrom.Text, yeart = yearTo.Text, g1 = tbGenre1.Text,
                g2 = genre2.Text, g3 = genre3.Text, a1 = actor1.Text, a2 = actor2.Text;
            string select = "SELECT f.filmName, f.year," +
                    " f.genre, f.runTime, f.boxSales, f.idmb, f.rotten, (SELECT AVG(rating)" +
                    " as expr1 from rating r WHERE(f.filmName = r.filmName)) as avgRating " +
                    "from film f where ";

            if (title.Length > 2)
            {
                select += " f.filmName LIKE('%" + title + "%')";
                SqlDataSource1.SelectCommand = select;
                GridView1.DataBind();
                select += " AND ";
            }
            if (yearf.Length > 2 && yeart.Length > 2)
            {
                select += "f.year BETWEEN " + yearf + " And " + yeart;
                SqlDataSource1.SelectCommand = select;
                GridView1.DataBind();
                select += " And ";
            }
            if (g1.Length > 2)
            {
                if (g2.Length > 2)
                {
                    if (g3.Length > 2)
                    {
                        select += "f.genre LIKE ('%" + g1 + "%') OR f.genre LIKE ('%" + g2 + "%') OR f.genre LIKE ('%" + g3 + "%')";
                        SqlDataSource1.SelectCommand = select;
                        GridView1.DataBind();
                        select += " And ";
                    }
                    else
                    {
                        select += "f.genre LIKE ('%" + g1 + "%') OR f.genre LIKE ('%" + g2 + "%')";
                        SqlDataSource1.SelectCommand = select;
                        GridView1.DataBind();
                        select += " And ";
                    }

                }
                else
                {
                    select += "f.genre LIKE ('%" + g1 + "%')";
                    SqlDataSource1.SelectCommand = select;
                    GridView1.DataBind();
                    select += " And ";
                }
            }
            select = null;
            title = null; yearf = null; yeart = null; g1 = null; g2 = null; g3 = null;

        }
        
    }
}
/* if(yearFrom.Text != null && yearTo.Text != null )

            if(tbGenre1.Text != null)
            {
                string genreA = tbGenre1.Text;
                if(genre2.Text != null)
                {
                    string genreB = genre2.Text;
                    if (genre3.Text != null)
                    {
                        string genreC = genre3.Text;
                        this.SqlDataSource1.SelectCommand = "SELECT f.filmName, f.year," +
                            " f.genre, f.runTime, f.boxSales, f.idmb, f.rotten, (SELECT AVG(rating)" +
                            " as expr1 from rating r WHERE(f.filmName = r.filmName)) as avgRating " +
                            "from film f where f.genre LIKE ('%" + genreA + "%') OR f.genre LIKE ('%" +genreB + "%') OR f.genre LIKE ('%" +genreC + "%')";
                        SqlDataSource1.DataBind();
                    }
                    else {
                        this.SqlDataSource1.SelectCommand = "SELECT f.filmName, f.year," +
                            " f.genre, f.runTime, f.boxSales, f.idmb, f.rotten, (SELECT AVG(rating)" +
                            " as expr1 from rating r WHERE(f.filmName = r.filmName)) as avgRating " +
                            "from film f where f.genre LIKE ('%" + genreA + "%') OR f.genre LIKE ('%" + genreB + "%')";
                        SqlDataSource1.DataBind();
                    }
                }
                else
                {
                    this.SqlDataSource1.SelectCommand = "SELECT f.filmName, f.year," +
                            " f.genre, f.runTime, f.boxSales, f.idmb, f.rotten, (SELECT AVG(rating)" +
                            " as expr1 from rating r WHERE(f.filmName = r.filmName)) as avgRating " +
                            "from film f where f.genre LIKE ('%" + genreA + "%')";
                    SqlDataSource1.DataBind();
                }
*/ 