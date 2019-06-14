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

            <table>
                <tr>
                    <th colspan="3">Add Product</th>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label CssClass="lbl" ID="Label2" runat="server" Text="Company Name"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList class="txt" ID="ddlcompanyinfo" runat="server"></asp:DropDownList>
                    </td>
                    <td></td>
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
                        <asp:Label CssClass="lbl" ID="Label3" runat="server" Text="Rate (Per 1 Product)"></asp:Label>
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
                        <textarea class="ta" runat="server" id="tapdesc" cols="20" rows="2"></textarea>
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
                        <asp:Button CssClass="btn" ID="btnaddproduct" runat="server" Text="Add" OnClick="btnaddproduct_Click" />
                        <asp:Button class="btn" ID="btnclear" runat="server" Text="Clear" />
                    </td>
                    <td></td>
                </tr>
            </table>
    </div>
             <div>  
                 <asp:GridView ID="gvproductinfo" runat="server" AutoGenerateColumns="false" AllowingPaging="True" CellPadding="4" OnRowEditing="gvpinfo_RowEditing" onrowdatabound="grproinfo_RowDataBound" OnRowUpdating="gvproinfo_RowUpdating" OnRowCancelingEdit="gvpinfo_RowCancelingEdit" OnRowDeleting="gvproductinfo_RowDeleting">
                     <Columns>
                         <asp:TemplateField HeaderText="Product Id" HeaderStyle-Width="200px">  
                            <ItemTemplate>  
                                <asp:Label ID="pid" runat="server" Text='<%# Eval("pid")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Product Name" HeaderStyle-Width="200px">  
                            <ItemTemplate>  
                                <asp:Label ID="proname" runat="server" Text='<%# Eval("productname")%>'></asp:Label>  
                            </ItemTemplate>  
                            <EditItemTemplate>
                                <asp:TextBox ID="txtproname" runat="server" Text='<%# Eval("productname") %>'></asp:TextBox>
                            </EditItemTemplate>
                         </asp:TemplateField>

                         <asp:TemplateField HeaderText="Company Name" HeaderStyle-Width="200px">  
                            <ItemTemplate>  
                                <asp:Label ID="companyname" runat="server" Text='<%# Eval("companyname")%>'></asp:Label>  
                            </ItemTemplate>  
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlcompanyid" runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Product Rate" HeaderStyle-Width="200px">  
                            <ItemTemplate>  
                                <asp:Label ID="prorate" runat="server" Text='<%# Eval("productprice")%>'></asp:Label>  
                            </ItemTemplate>  
                            <EditItemTemplate>
                                <asp:TextBox ID="txtprorate" runat="server" Text='<%# Eval("productprice") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Image" HeaderStyle-Width="200px">  
                            <ItemTemplate>  
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("productimgpath") %>'  
                                    Height="80px" Width="100px" /> 
                                <asp:Label ID="lblimgpath" runat="server" type="hidden" Text='<%# Eval("productimgpath") %>' />
                            </ItemTemplate>  
                            <EditItemTemplate>  
                                <asp:Image ID="img_user" runat="server" ImageUrl='<%# Eval("productimgpath") %>'  
                                    Height="80px" Width="100px" /><br />  
                                <asp:FileUpload ID="FileUpload1" runat="server" />  
                            </EditItemTemplate>  
                        </asp:TemplateField>  
                        

                        <asp:TemplateField HeaderText="Product Description" HeaderStyle-Width="200px">  
                            <ItemTemplate>  
                                <asp:Label ID="prodesc" runat="server" Text='<%# Eval("productdesc")%>'></asp:Label>  
                            </ItemTemplate>  
                            <EditItemTemplate>
                               <asp:TextBox ID="txtprodesc" runat="server" Multicolumns="true" Text='<%# Eval("productdesc") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="150px">  
                            <ItemTemplate>  
                                <asp:LinkButton ID="LkB1" runat="server" CommandName="Edit">Edit</asp:LinkButton>  
                                <asp:LinkButton ID="LkB11" runat="server" CommandName="Delete">Delete</asp:LinkButton>  
                            </ItemTemplate>  
                            <EditItemTemplate>  
                                <asp:LinkButton ID="LkB2" runat="server" CommandName="Update">Update</asp:LinkButton>  
                                <asp:LinkButton ID="LkB3" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>  
                            </EditItemTemplate>  
                        </asp:TemplateField>
                     </Columns>
                 </asp:GridView> 
                 </div>
   
</asp:Content>
