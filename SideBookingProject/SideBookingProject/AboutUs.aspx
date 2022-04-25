<%@ Page Title="" Language="C#" MasterPageFile="~/SideBookingMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="BusBookingProject.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:6%">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    <h3>О нас</h3>
                </div>
            </div>
            <div class="panel-body">
                <p style="font-size:large">
                    Данный сайт был создан для того чтобы автоматизировать процесс составления расписания
                    и облегчить работу диспетчера железнодорожнего тупика. С помощью этого сайта диспетчер 
                    может добавлять компании которые владеют тупиками и добавлять время для бронирования.
                    Пользователь может зайти и найти подходящий вариант для бронированния.

                </p>
            </div>
        </div>
    </div>
</asp:Content>
