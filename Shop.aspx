<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Shop.aspx.cs" Inherits="Shop" %>
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
                <img class="banner" src="images/headerLogo.png" alt="Banner Logo" />
            </div>
        </div>
            <uc:navigation ID="Navigation" runat="server" />
        <div id="content">
            <form id="dataForm" runat="server">
                <p>
                    <asp:TextBox ID="searchTerm" runat="server" ></asp:TextBox>
                    <asp:Button ID="searchButton" runat="server" text="Search" OnClick="searchButton_OnClick" />
                    &nbsp;&nbsp;&nbsp;(By default, this will match all results based on your terms.)
                    <br />
                    <asp:Label ID="statusLabel" runat="server" />
                    <br />
                </p>
                <asp:SqlDataSource ID="BenNotStallman" runat="server" />
                <div id="dataGrid" runat="server">
                    <asp:GridView class="productsGrid" ID="ProductsGrid" runat="server" CellPadding="10" EnableModelValidation="True" Autogeneratecolumns="false"
                            ForeColor="#333333" GridLines="None" AllowSorting="True" DataSourceID="" OnSorting="ProductsGrid_Sorting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <%--<asp:boundfield datafield="productNum" headertext="Product Number" SortExpression="productNum" />--%>
                            <asp:TemplateField SortExpression="productNum" headertext="Product Number" >
                                <ItemTemplate>
                                    <asp:HyperLink ID="nameLink" NavigateUrl='<%# "~/Description.aspx?pid=" + Eval("productNum")%>' Text='<%# Eval("productNum") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
                            <asp:boundfield DataField="Color" HeaderText="Color" SortExpression="color" />
                            <asp:boundfield DataField="price" HeaderText="Price" SortExpression="price" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#7c9dcc" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </div>
            </form>
        </div>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>
</html>
