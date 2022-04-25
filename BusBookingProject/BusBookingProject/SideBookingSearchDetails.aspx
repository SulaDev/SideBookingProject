<%@ Page Title="" Language="C#" MasterPageFile="~/SideBookingMaster.Master" AutoEventWireup="true" CodeBehind="SideBookingSearchDetails.aspx.cs" Inherits="BusBookingProject.BusBookingSearchDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:8%">
        <asp:HyperLink ID="hlinkSearch" runat="server" NavigateUrl="~/Home.aspx" style="width:10%;align-content:center" class="btn btn-info btn-block">Search Again</asp:HyperLink>
        <asp:GridView ID="gvBusDetails" EmptyDataText="No Record Found...." runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered" OnRowDataBound="gvBusDetails_RowDataBound">
                    <Columns>
                       <asp:TemplateField HeaderText="Компания">
                           <ItemTemplate>
                               <asp:Label ID="lblBusName" runat="server" Text='<%# Eval("BusName") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Время начала">
                           <ItemTemplate>
                               <asp:Label ID="lbldeparture" runat="server" Text='<%# Eval("DepartureTime") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Время конца">
                           <ItemTemplate>
                               <asp:Label ID="lblArrival" runat="server" Text='<%# Eval("ArivalTime") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Количество линий">
                           <ItemTemplate>
                               <asp:Label ID="lblAvailableSeats" runat="server" Text='<%# Eval("AvailableSeats") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Стоимость">
                           <ItemTemplate>
                               <asp:Label ID="lblFare" runat="server" Text='<%# Eval("Fare") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Добавить">
                            <ItemTemplate>
                                <asp:HyperLink ID="hplnkSelect" runat="server" ToolTip="Select Bus">Выбрать тупик</asp:HyperLink>
                                <asp:HiddenField ID="hdnBusID" runat="server" Value='<%# Eval("BusId") %>' />
                                 <asp:HiddenField ID="hdnSeatRow" runat="server" Value='<%# Eval("SeatRow") %>' />
                                 <asp:HiddenField ID="hdnSeatColumn" runat="server" Value='<%# Eval("SeatColumn") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
    </div>
</asp:Content>
