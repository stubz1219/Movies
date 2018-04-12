<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Browse.aspx.cs" Inherits="Movies.webpages.Browse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <div class="title">
        <h2>Browse</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnection %>" SelectCommand="SELECT filmName, year, genre, runTime, boxSales, idmb, rotten, (SELECT AVG(rating) AS Expr1 FROM rating AS r WHERE (f.filmName = filmName)) AS AvgRating FROM film AS f"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="filmName" DataSourceID="SqlDataSource1" Width="646px" BackColor="#999966" BorderColor="Black" BorderWidth="3px" HorizontalAlign="Center" AllowSorting="True">
            <AlternatingRowStyle BackColor="#627663" />
            <Columns>
                <asp:BoundField DataField="filmName" HeaderText="filmName" ReadOnly="True" SortExpression="filmName"/>
                <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                <asp:BoundField DataField="runTime" HeaderText="runTime" SortExpression="runTime" />
                <asp:BoundField DataField="boxSales" HeaderText="Sales" SortExpression="boxSales" DataFormatString="{0:c}" />
                <asp:BoundField DataField="idmb" HeaderText="idmb" SortExpression="idmb" />
                <asp:BoundField DataField="rotten" HeaderText="rotten" SortExpression="rotten" />
                <asp:BoundField DataField="AvgRating" HeaderText="AvgRating" ReadOnly="True" SortExpression="AvgRating" />
            </Columns>
        </asp:GridView>
    </div>
    <div>
    </div>
</asp:Content>
