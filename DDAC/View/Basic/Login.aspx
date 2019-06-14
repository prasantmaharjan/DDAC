<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DDAC.View.Admin.Login" %>
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
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <form>
            <table>
                <tr>
                    <th colspan="2">Login</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label class="lbl" ID="Label1" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox Class="txt" ID="txtusername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label class="lbl" ID="Label2" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox Class="txt" ID="txtpass" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button class="btn" ID="btnlogin" runat="server" Text="Login" />
                        <asp:Button Class="btn" ID="btnsignup" runat="server" Text="Sign Up" OnClick="btnsignup_Click" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>
