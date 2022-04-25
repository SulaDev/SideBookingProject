<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SideDetailsReport.aspx.cs" Inherits="BusBookingProject.Admin.BusDetailsReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:6%">
        <asp:GridView ID="gdBusDetails" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="true" PageSize="20" CssClass="table table-hover table-bordered"
                    Width="100%" Font-Size="12" OnRowDataBound="gdBusDetails_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Номер">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField >
                       <asp:TemplateField HeaderText="ID Компании">
                           <ItemTemplate>
                               <asp:Label ID="lblBusID" runat="server" Text='<%# Eval("BusId") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Номер Брони">
                           <ItemTemplate>
                               <asp:Label ID="lblBusNo" runat="server" Text='<%# Eval("BusNo") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                          <asp:TemplateField HeaderText="Название компании">
                           <ItemTemplate>
                               <asp:Label ID="lblBusName" runat="server" Text='<%# Eval("BusName") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Тип погрузчика">
                           <ItemTemplate>
                               <asp:Label ID="lblBusType" runat="server" Text='<%# Eval("BustType") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Линия">
                           <ItemTemplate>
                               <asp:Label ID="lblSeatCol" runat="server" Text='<%# Eval("SeatColumn") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Номер Ответвления">
                           <ItemTemplate>
                               <asp:Label ID="lblSeatRow" runat="server" Text='<%# Eval("SeatRow") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Адрес">
                           <ItemTemplate>
                               <asp:Label ID="lblOrigin" runat="server" Text='<%# Eval("Origin") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                     
                        <asp:TemplateField HeaderText="Расписание">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlinkUpdate" runat="server" >Изменить информацию</asp:HyperLink>
                                 <asp:HyperLink ID="hlinkAddSchedule" runat="server" >Добавить расписание</asp:HyperLink>
                                <asp:HiddenField ID="hdnPNRNo" runat="server" Value='<%# Eval("BusId") %>' />
                                 <asp:HiddenField ID="hdnRouteID" runat="server" Value='<%# Eval("RouteID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
    </div>
</asp:Content>
