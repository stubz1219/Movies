<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Movies.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="Search.css" />
    <link type="text/css" rel="stylesheet" href="Admin.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server" >
    
        <asp:Label ID="message" runat="server" ForeColor="Red">Login Successfull</asp:Label><br />
                <h1>Insert New Move Into Database</h1>
        <div class="movieEntry">
            <asp:Label ID="label1" runat="server" Width="230px">Movie Title</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label2" runat="server" Width="80px">Year</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label3" runat="server" width="120px">RunTime</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label4" runat="server" Width="150px">Genre</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_Title" runat="server" Width="230px" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_year" runat="server" Width="80px" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_runtime" runat="server" Width="120px" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_genre" runat="server" Width="150px"/>&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="label5" runat="server" Width="180px">Director</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label6" runat="server" Width="180px">Box Office Sales</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label7" runat="server" Width="60px">IMDB</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label8" runat="server" Width="60px">Rotten</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label19" runat="server" Width="60px">User</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_director" runat="server" Width="180px"/>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_sales" runat="server" Width="180px" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_idmb" runat="server" Width="60px"/>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_rotten" runat="server" Width="60px"/>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_user" runat="server" Width="60px"/>&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
            <asp:Button ID="movieSubmit" runat="server" Text="Update Database" OnClick="movieSubmit_Click" />
        </div>
            <h2>Create New User</h2>
        <div class="userEntry">
            <asp:Label ID="label20" runat="server" Width="250px" >User Name</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label21" runat="server" Width="250px">Password</asp:Label>
            <asp:TextBox ID="tb_username" runat="server" Width="250px"/>&nbsp;&nbsp;
            <asp:TextBox ID="tb_password" runat="server" width="250px"/> <br /> <br />
            <asp:Button ID="addUser" runat="server" Text="Add User" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="filmName" DataSourceID="SqlDataSource1" AllowSorting="True" Width="712px" BackColor="#999966" BorderColor="Black" BorderWidth="3px" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#627663" />
                <Columns>
                    <asp:BoundField DataField="filmName" HeaderText="Title" ReadOnly="True" SortExpression="filmName" />
                    <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                    <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                    <asp:BoundField DataField="runTime" HeaderText="Run TIme" SortExpression="runTime" />
                    <asp:BoundField DataField="boxSales" DataFormatString="{0:C}" HeaderText="Box Sales" SortExpression="boxSales" />
                    <asp:BoundField DataField="idmb" HeaderText="IMDB" SortExpression="idmb" />
                    <asp:BoundField DataField="rotten" HeaderText="Rotten" SortExpression="rotten" />
                    <asp:BoundField DataField="AvgRating" HeaderText="User Rating" ReadOnly="True" SortExpression="AvgRating" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnection %>" SelectCommand="SELECT filmName, year, genre, runTime, boxSales, idmb, rotten, (SELECT AVG(rating) AS Expr1 FROM rating AS r WHERE (f.filmName = filmName)) AS AvgRating FROM film AS f"></asp:SqlDataSource>
        </div>

</asp:Content>
