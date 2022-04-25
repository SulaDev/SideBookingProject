<%@ Page Title="" Language="C#" MasterPageFile="~/SideBookingMaster.Master" AutoEventWireup="true" CodeBehind="PassengerDetailsInfo.aspx.cs" Inherits="BusBookingProject.PassengerDetailsInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 8%">
        <asp:GridView ID="gdPassengerDetails" runat="server" ShowFooter="true" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField DataField="RowNumber" HeaderText="No" />
                <asp:TemplateField HeaderText="Имя">
                    <ItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Фамилия">
                    <ItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Телефон">
                    <ItemTemplate>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Город">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
             
            </Columns>
        </asp:GridView>

        <asp:Button ID="btnConirmBooking" runat="server" CssClass="btn btn-success" Style="width: auto; margin-top: 2%" Text="Подтвердить бронь"
            OnClick="btnConirmBooking_Click" ClientIDMode="Static" />

        <div class="row" id="paymentMode" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Детали оплаты</h3>
                </div>
                <div class="panel-body">
                    <asp:ValidationSummary ID="vsRegister" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgRegister" />
                    <div id="divMessage" runat="server" />
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCardType" runat="server" Text="Выберите тип карты" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlCardType" runat="server" class="form-control input-sm floatlabel">
                                <asp:ListItem Value="0" Text="--Тип карты--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Credit Card"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Debit Card"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCardType" Display="None" ID="rfvFirstName" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Выберите тип карты." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblBankName" runat="server" Text="Выберите банк" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlBank" runat="server" class="form-control input-sm floatlabel">
                                <asp:ListItem Value="0" Text="--Выберите банк--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Kaspi bank"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Jusan bank"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Alfa Bank"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Sber Bank"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Bank center credit"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlBank" Display="None" ID="rfVMobileNo" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="ВЫберите банк." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" Text="CVV Code" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtCode" runat="server" class="form-control input-sm floatlabel" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCode" Display="None" ID="rfVLastName" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Введите CVV Cоde." /><br />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Номер карты" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtCardNo" runat="server" class="form-control input-sm floatlabel" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCardNo" Display="None" ID="rfvPassword" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Выберите номер карты." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Button ID="btnSave" runat="server" Text="Оплатить" OnClick="btnSave_Click" class="btn btn-info " ValidationGroup="vgRegister" CausesValidation="True" ViewStateMode="Inherit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
