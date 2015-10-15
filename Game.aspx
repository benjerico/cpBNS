<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="uc" TagName="Navigation" Src="navigation.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>BNS</title>
    <link rel="Stylesheet" href="default.css" type="text/css" />
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div class="logo">
                <img class="banner" src="headerLogo.png" alt="Banner Logo" />
            </div>
        </div>
        <div id="nav">
            <uc:navigation ID="Navigation" runat="server" />
        </div>
        <div id="content">
            <form id="gameBoard" runat="server" >
            <br />
                <p>Here's your chance to win a prize from us at <span class="BNSwords">Ben's Not Stallman</span></p>
                <div id="DropDowns">
                    <asp:DropDownList ID="UserFirstNum" runat="server" class="userNumbers">
                        <asp:ListItem Text="Your first number" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="UserSecondNum" runat="server" class="userNumbers">
                        <asp:ListItem Text="Your second number" Value="0"></asp:ListItem> 
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="UserThirdNum" runat="server" class="userNumbers">
                        <asp:ListItem Text="Your third number" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="ShowWinNums" runat="server" Text="Show me the winning numbers!" class="gameButton"/>
                <div id="CompsNums" class="userNumbers">
                    <asp:TextBox ID="CompFirstNum" runat="server"></asp:TextBox>
                    <asp:TextBox ID="CompSecondNum" runat="server"></asp:TextBox>
                    <asp:TextBox ID="CompThirdNum" runat="server"></asp:TextBox>
                </div>
            </form>
        </div>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>

</html>

<%--IDEAS

Rewrite lottery game. Grand prize wins a free product from the shop.
Use drop down lists for number selection to bypass validation and user entry errors.--%>
