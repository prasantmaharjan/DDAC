<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="DDAC.View.Admin.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .lbl {
        font-weight:bold;
        font-size:20px;

    }
    .txt {
        margin:5px;
        width:250px;
        height:30px;
    }
    .btn {
        margin-top:10px;
        margin-bottom:10px;
        margin-left:5px;
        width:100px;
        height:30px;
    }
    .ta {
        margin:5px;
        width:250px;
        height:100px;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <form>
            <table>
                <tr>
                    <th colspan="3">Add Product</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label class="lbl" ID="Label1" runat="server" Text="Proudct Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="txt" ID="txtpname" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label CssClass="lbl" ID="Label3" runat="server" Text="Rate (Each Prodct)"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="txt" ID="txtrate" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="lbl" ID="Label4" runat="server" Text="Product Description"></asp:Label>
                    </td>
                    <td>
                        <textarea class="ta" id="tapdesc" cols="20" rows="2"></textarea>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="lbl" ID="Image" runat="server" Text="Product Image"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload class="txt" ID="btnfileup" runat="server" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button CssClass="btn" ID="btnaddproduct" runat="server" Text="Add" />
                        <asp:Button class="btn" ID="btnclear" runat="server" Text="Clear" />
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>
