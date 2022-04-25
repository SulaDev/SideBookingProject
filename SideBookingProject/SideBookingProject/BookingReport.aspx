<%@ Page Title="" Language="C#" MasterPageFile="~/SideBookingMaster.Master" AutoEventWireup="true" CodeBehind="BookingReport.aspx.cs" Inherits="BusBookingProject.BookingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:6%">
                   <asp:GridView ID="gdTicketReport" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="true" PageSize="20" CssClass=""
                    Width="100%" Font-Size="12" OnRowCommand="gdTicketReport_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Номер" DataField="PNRNo" />
                        <asp:BoundField HeaderText="Количество забронированных линий" DataField="TotalTickets" />
                        <asp:BoundField HeaderText="Стоимость" DataField="TotalAmount" />
                        <asp:TemplateField HeaderText="Скачать чек">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtndownloadTicket" runat="server" CommandName="Download Ticket" CommandArgument='<%# Container.DataItemIndex %>'>Скачать чек</asp:LinkButton>
                                <asp:HiddenField ID="hdnPNRNo" runat="server" Value='<%# Eval("PNRNo") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

              <div id="ticket" runat="server" visible="false">
                <h1 style="font-weight: bold">Online Side Booking</h1>
                <br />
                <br />

                <h2 style="font-weight: bold">Детали бронирования</h2>
                <div class="table-bordered">
                    <table class="table-striped" id="tbtPNR" runat="server" style="width: 100%; color: green; font-size: large">
                        <tr>
                            <td style="font-weight: bold">Номер бронирования</td>
                            <td>
                                <asp:Label ID="lblTransactionNo" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Количестов линий</td>
                            <td>
                                <asp:Label ID="lblTotalTickets" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Общая сумма</td>
                            <td>
                                <asp:Label ID="lblTotalAmount" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Компания</td>
                            <td>
                                <asp:Label ID="lblBusName" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <h2 style="font-weight: bold">Passenger's Details</h2>
                <asp:GridView ID="gdPaxDetails" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="true" PageSize="25" CssClass="table table-hover table-bordered" Style="margin-top: 5%" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Номер">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Name" DataField="Fname" />
                        <asp:BoundField HeaderText="Surname" DataField="Lname" />
                        <asp:BoundField HeaderText="Contact" DataField="Contact" />
                        <asp:BoundField HeaderText="Line number" DataField="SeatNo" />
                         <asp:BoundField HeaderText="Date" DataField="TravelDate" />
                         <asp:BoundField HeaderText="Adress" DataField="Origin" />
     
                        <asp:BoundField HeaderText="Линия" DataField="PlaceName" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
               
            </div>
    </div>
</asp:Content>
