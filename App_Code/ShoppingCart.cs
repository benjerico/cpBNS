using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{
    private SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["BenNotStallman"].ConnectionString);

    private ArrayList productID = new ArrayList();
    private ArrayList productQuantity = new ArrayList();
    private ArrayList productTable = new ArrayList();

    public bool addItem(string prodID, string table)
    {
        foreach (string item in productID)
        {
            if (item == prodID)
            {
                return false;
            }
        }
        productID.Add(prodID);
        productQuantity.Add(1);
        productTable.Add(table);

        return true;
    }

    public string showCart()
    {
        double total = 0;
        string retValue = "<asp:Table ID='ProductGrid' runat='server' width='100%'>";
        retValue += "<tr><th>Product</th><th>Quantity</th><th>Price Each</th><th>Total for Item</th></tr>";
        for (int i = 0; i < productID.Count; i++)
        {
            string sqlString = "SELECT productNum, productName, price "
                + " FROM product "
                + " WHERE productNum = " + productID[i] + ";";
            using (SqlCommand prodCommand = new SqlCommand(sqlString, dbConnection))
            {
                using (SqlDataReader prodRecords = prodCommand.ExecuteReader())
                {
                    if (prodRecords.Read())
                    {
                        retValue += "<tr><td>" + prodRecords["productName"] + "</td>"
                            + "<td>" + productQuantity[i] + "</td>"
                            + "<td>" + prodRecords["price"] + "</td>";
                        retValue += "</tr>";

                        total += Convert.ToDouble(prodRecords["price"]) * Convert.ToInt16(productQuantity[i]);
                    }
                }
            }
        }
        retValue += "<tr><td colspan='2'><string>Your shopping cart contains "
            + productQuantity.Count + " product(s)."
            + "</strong></td>"
            + "<td>Total: " + String.Format("{0:c}", total) + "</td>"
            + "</tr>";
        retValue += "</asp:Table>";
        return retValue;
    }

    public ShoppingCart()
    {
        try
        {
            dbConnection.Open();
        }
        catch (Exception)
        {
            throw;
        }
    }

    ~ShoppingCart()
    {
        dbConnection.Close();
    }
}