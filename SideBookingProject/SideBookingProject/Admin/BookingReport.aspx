<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BookingReport.aspx.cs" Inherits="BusBookingProject.Admin.BookingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:6%">
        <asp:GridView ID="gdTicketReport" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="true" PageSize="20" CssClass=""
                    Width="100%" Font-Size="12">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Название компании" DataField="SideName" />
                         <asp:BoundField HeaderText="Имя клмента" DataField="PaxName" />
                        <asp:BoundField HeaderText="Email" DataField="Email" />
                         <asp:BoundField HeaderText="Номер телефона" DataField="Contact" />
                         <asp:BoundField HeaderText="Адрес" DataField="Origin" />
                       
                         <asp:BoundField HeaderText="Дата" DataField="TravelDate" />
                         <asp:BoundField HeaderText="Линия" DataField="SeatNo" />
                         <asp:BoundField HeaderText="Стоимость" DataField="Fare" />
                        <asp:BoundField HeaderText="Логин юзера" DataField="BookedBy" />
                    </Columns>
                </asp:GridView>
    </div>
</asp:Content>
