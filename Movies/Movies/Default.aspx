<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Movies.Default" %>

<script runat="server">

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
</script>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent1" runat="server">
    <div id="box">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnection %>" SelectCommand="SELECT TOP (50) filmName, genre, year, runTime, idmb FROM film ORDER BY idmb DESC" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        <h2>
            
            My Movie Collection</h2>
        <p>&nbsp&nbsp&nbsp&nbsp This is my collection of movies, blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah 
            blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah 
            blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah 
            blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah 
        </p>
    </div>
    <ul>
        <li><a>Highest Rated</a></li>
        <li><a>Longest Runtime</a></li>
        <li><a>Shortest Runtime</a></li>
    </ul>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="filmName" DataSourceID="SqlDataSource1" Width="646px" BackColor="#999966" BorderColor="Black" BorderWidth="3px" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#627663" />
            <Columns>
                <asp:BoundField DataField="filmName" HeaderText="Title" ReadOnly="True" SortExpression="filmName"/>
                <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                <asp:BoundField DataField="runTime" HeaderText="Run TIme" SortExpression="runTime" />
                <asp:BoundField DataField="idmb" HeaderText="IMDB" SortExpression="idmb" />
            </Columns>
        </asp:GridView>
        </div>

</asp:Content>
