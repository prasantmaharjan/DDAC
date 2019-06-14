<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyInfo.aspx.cs" Inherits="DDAC.View.Admin.CompanyInfo" %>
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

            <table>
                <tr>
                    <th colspan="3">Add Company Information</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label class="lbl" ID="Label1" runat="server" Text="Company Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="txt" ID="txtcname" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label CssClass="lbl" ID="Label3" runat="server" Text="Company Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="txt" ID="txtcemail" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="lbl" ID="Label4" runat="server" Text="Contact No"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="txt" ID="txtcompanycontactno" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td>
                        <asp:Button CssClass="btn" ID="btnaddcompanyinfo" runat="server" Text="Add" OnClick="btnaddcompanyinfo_Click"/>
                        <asp:Button class="btn" ID="btnclear" runat="server" Text="Clear" />
                    </td>
                    <td></td>
                </tr>
            </table>
    </div>

    <div>
        <asp:GridView ID="gvcompanyinfo" runat="server" AutoGenerateColumns="false" AllowPaging="true" DataKeyNames="cinfoid" CellPadding="4" OnRowEditing="gvcompanyinfo_RowEditing" OnRowCancelingEdit="gvcompanyinfo_RowCancelingEdit" OnRowUpdating="gvcompanyinfo_RowUpdating" OnRowDeleting="gvcompanyinfo_RowDeleting">
            <columns>
                
                <asp:TemplateField HeaderText="Company Info ID">
                    <ItemTemplate>
                        <asp:Label ID="lblcid" runat="server" Text='<%# Eval("cinfoid") %>'>

                        </asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtcompanyid" runat="server" readonly Text='<%# Eval("cinfoid") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Company Name">
                    <ItemTemplate>
                        <asp:Label ID="lblcompanyname" runat="server" Text='<%# Eval("companyname") %>'>

                        </asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtcompanyname" runat="server" Text='<%# Eval("companyname") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblcemail" runat="server" Text='<%# Eval("companyemail") %>'>

                        </asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtcemail" runat="server" Text='<%# Eval("companyemail") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact No">
                    <ItemTemplate>
                        <asp:Label ID="lblcontactno" runat="server" Text='<%# Eval("companycontactno") %>'>

                        </asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtcontactno" runat="server" Text='<%# Eval("companycontactno") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Company Name">
                    <ItemTemplate>
                        <asp:LinkButton ID="btn1" runat="server" CommandName="Edit" Text="Edit" />  
                        <asp:LinkButton ID="btn2" runat="server" CommandName="Delete" Text="Delete"/>
                    </ItemTemplate>

                    <EditItemTemplate>
                       <asp:LinkButton ID="btn3" runat="server" CommandName="Update" Text="Update" />  
                        <asp:LinkButton ID="btn4" runat="server" CommandName="Cancel" Text="Cancel"/>
                    </EditItemTemplate>
                </asp:TemplateField>
            </columns>
        </asp:GridView>
    </div>
         </asp:Content>
