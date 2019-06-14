<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="DDAC.View.Admin.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .txt {
        width:250px;
        height:30px;
        margin:5px;
    }
    .div {
        align-content:center;
    }
    .ta {
        width:250px;
        height:60px;
        margin:5px;
    }
    .btn {
        margin-top :10px;
        margin-bottom:10px;
        margin-left:5px;
        width:100px;
        height:30px;
    }
    .header {
        margin-top :20px;
        margin-bottom:20px;
        
    }
    .auto-style1 {
        height: 30px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div">
        <form>
            <table>
                <tr>
                    <th colspan="3" class="header">
                        Registration
                    </th>
                    
                </tr>
                <tr>
                    <td ><b>Name</b></td>
                    <td>
                        <asp:TextBox class="txt" ID="txtname" runat="server" required/>
                    </td>
                    <td></td>
                </tr>
               <tr>
                    <td><b>Address</b></td>
                    <td>
                        <asp:TextBox class="txt" id="txtaddress" runat="server" required/>                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td><b>Email</b></td>
                    <td>
                        <asp:TextBox class="txt" ID="txtemail" runat="server" required/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td><b>Contact No</b></td>
                    <td>
                        <asp:TextBox class="txt" ID="txtcontactno" runat="server" required/>                   </td>
                    <td></td>
                </tr>
                <tr>
                    <td><b>User Name</b></td>
                    <td>
                        <asp:TextBox  class="txt" ID="txtuname" runat="server" required />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td><b>Password</b></td>
                    <td>
                        <asp:TextBox  class="txt" ID="txtpass" runat="server" TextMode="Password" required />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1"><b>Confirm Password</b></td>
                    <td class="auto-style1">
                        <asp:TextBox class="txt" ID="txtconfirmpass" runat="server" TextMode="Password"  required/>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Button class="btn" ID="btnregister" runat="server" Text="Register" OnClick="btnregister_Click" />
                        &nbsp;&nbsp;
                        <asp:Button class="btn" ID="btnclear" runat="server" Text="Clear" />
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>
