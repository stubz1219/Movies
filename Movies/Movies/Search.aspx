<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Movies.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="Master.css" />
    <link type="text/css" rel="stylesheet" href="Search.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <div class="searchContainer">
        <div class="search1">
            <asp:Label ID="labe1" runat="server" Text="Title Keyword" Width="226px"></asp:Label><br />
            <asp:TextBox ID="tbTitle" runat="server" Width="226px"></asp:TextBox><br /><br />
            <asp:Label ID="lable2" runat="server" Text="Genres" Width="226px" />
            <asp:TextBox ID="tbGenre1" runat="server" />
            <asp:TextBox ID="genre2" runat="server" />
            <asp:TextBox ID="genre3" runat="server" />
        </div>
        <div class="search2">
            <asp:Label ID="yearLabel" runat="server" width="50px" bold="true">Year</asp:Label><br />
            <asp:Label ID="label4" runat="server" width="150px">From</asp:Label>
            <asp:Label ID="label5" runat="server" Width="300px">To</asp:Label>
            <asp:TextBox ID="yearFrom" runat="server" />
            <asp:TextBox ID="yearTo" runat="server" />
            <br />
            <br />
            <asp:Label ID="label6" runat="server" Width="500">Actors</asp:Label>
            <asp:TextBox ID="actor1" runat="server"/>
            <asp:TextBox ID="actor2" runat="server" />
            <br />
            <br />
            <asp:Button ID="searchbt" runat="server" Text="Search" OnClick="searchbt_Click" />
        </div>
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" EnableViewState="true" ConnectionString="<%$ ConnectionStrings:MovieDBConnection %>" SelectCommand="SELECT filmName, year, genre, runTime, boxSales, idmb, rotten, (SELECT AVG(rating) AS Expr1 FROM rating AS r WHERE (f.filmName = filmName)) AS AvgRating FROM film AS f"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="filmName" DataSourceID="SqlDataSource1" Width="712px" BackColor="#999966" BorderColor="Black" BorderWidth="3px" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#627663" />
            <Columns>
                <asp:BoundField DataField="filmName" HeaderText="Title" ReadOnly="True" SortExpression="filmName" />
                <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                <asp:BoundField DataField="runTime" HeaderText="Run Time" SortExpression="runTime" />
                <asp:BoundField DataField="boxSales" HeaderText="Box Sales" SortExpression="boxSales" />
                <asp:BoundField DataField="idmb" HeaderText="IMDB" SortExpression="idmb" />
                <asp:BoundField DataField="rotten" HeaderText="Rotten" SortExpression="rotten" />
                <asp:BoundField DataField="AvgRating" HeaderText="Avg Rating" ReadOnly="True" SortExpression="AvgRating" />
            </Columns>
            </asp:GridView>

       
    </div>
</asp:Content>
