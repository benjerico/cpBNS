<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BNS</title>
    <link rel="Stylesheet" href="default.css" type="text/css" />
    <style>
    
    #content h2
    {
        margin-left: 30px;
        margin-top: 10px;
    }
    
    #contactUs
    {
        margin: 5px;
        padding: 10px;
        float:left;
    }
    
    #submitImage
    {
       margin-left: 20px;
    }
    
    #cancelImage
    {
        margin-left: 20px;
    }
    
    </style>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div class="logo">
                <img class="banner" src="headerLogo.png" alt="Banner Logo" />
            </div>
        </div>
        <div id="nav">
            <ul class="navList">
                <li><a href="/home/" class="navigation">Home</a></li>
                <li><a href="/shop/" class="navigation">Shop</a></li>
                <li><a href="AboutUs.htm" class="active">About Us</a></li>
                <li><a href="Contact.aspx" class="">Contact</a></li>
            </ul>
        </div>
        <div id="content">
            <h2>Contact Us</h2>
            <form ID="contactUsForm" runat="server">
                <asp:Panel ID="contactUs" runat="server">
                    <p>
                        First Name:
                        <asp:TextBox ID="firstName" runat="server" Width="255px" /><br />
                        <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ErrorMessage="**" ControlToValidate="firstName">**</asp:RequiredFieldValidator><br />
                        Last Name: 
                        <asp:TextBox ID="lastName" runat="server" Width="255px" /><br />
                        <asp:RequiredFieldValidator ID="lastNameValidator" runat="server" ErrorMessage="**" ControlToValidate="firstName">**</asp:RequiredFieldValidator><br />
                        Your Email:
                        <asp:TextBox ID="senderEmail" runat="server" Width="255px" /><br />
                        <asp:RegularExpressionValidator ID="fromValidator" runat="server" ErrorMessage="Richard Stallmen doesn't like your email" ControlToValidate="senderEmail" ValidationExpression="^([\w_\d]{1,35})((\.?[+]?[\w_\d]{1,10})?){3}?\@[\d\w-_]{1,20}\..{2,5}$">*Richard Stallmen Doesn't like your email.*</asp:RegularExpressionValidator><br />
                        Message to the Boys:<br />
                        <asp:TextBox ID="message" runat="server" Width="300px" TextMode="MultiLine" Height="100" /><br />
                        <asp:RequiredFieldValidator ID="messageValidator" runat="server" ErrorMessage="Please leave us a message. We really want to hear from you" ControlToValidate="message">Please leave us a message. We really want to hear from you</asp:RequiredFieldValidator>
                    </p>

                    <div id="submitBar">
                        <asp:ImageButton ID="submitImage" runat="server" ImageUrl="~/b1.gif" />

                    </div>
                </asp:Panel>
                <asp:Literal ID="sentEmail" runat="server" Visible="False"></asp:Literal>
            </form>
                <p class="textNext">
                Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?
                </p>
                
            
        </div>
    </div>
</body>
</html>
