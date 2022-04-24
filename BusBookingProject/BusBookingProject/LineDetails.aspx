﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SideBookingMaster.Master" AutoEventWireup="true" CodeBehind="LineDetails.aspx.cs" Inherits="BusBookingProject.SeatDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="js/jquery-latest.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <style>
        #holder {
            height: 500px;
            width: 500px;
            background-color:white;
            border: 1px solid #A4A4A4;
            margin-left: 10px;
        }

        #place {
            position: relative;
            margin: 20px;
        }

            #place a {
                font-size: 0.6em;
                color: white;
            }

            #place li {
                list-style: none outside none;
                position: absolute;
            }

                #place li:hover {
                    background-color: yellow;
                }

            #place .seat {
                background: url("img/newAvailableSeat.png") no-repeat scroll 0 0 transparent;
                height: 33px;
                width: 33px;
                display: block;
            }

            #place .selectedSeat {
                background-image: url("img/bookedseats.png");
            }

            #place .selectingSeat {
                background-image: url("img/newSelectedSeat.png");
            }

            #place .ladiesSeat {
                background-image: url("img/ladiesSeat.png");
            }

            #place .notAvailableSeats {
                background-image: url("img/notAvailableSeat.png");
            }

            #place .BlockedSeats {
                background-image: url("img/BlockedSeat.png");
            }

            #place .AvailableSeats {
                background-image: url("img/newAvailableSeat.png");
            }

            #place .row-3, #place .row-4 {
                margin-top: 10px;
            }

        #seatDescription li {
            vertical-align: middle;
            list-style: none outside none;
            padding-left: 35px;
            height: 35px;
            float: left;
        }

        .details {
            display: none;
            visibility: hidden;
            background-color: #eeeeee;
            font-family: Verdana;
        }

        .inlineList {
            display: flexbox;
            flex-direction: row;
            /* Below sets up your display method: flex-start|flex-end|space-between|space-around */
            justify-content: flex-start;
            /* Below removes bullets and cleans white-space */
            list-style: none;
            padding: 0;
            /* Bonus: forces no word-wrap */
            white-space: nowrap;
        }

        .LiStstyle {
            Width: 50px;
            Height: 50px;
        }

        .emptySeat {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:8%">
         <div class="panel-heading">
                    <div class="col-lg-8">
                        <h4 style="color: black;">Выберите линию для бронирования</h4>
                    </div>
                    <div class="col-lg-2"><a href="#" style="padding: 5px;" class="btn btn-success" id="hrefBackUrl" runat="server" title="Назад к поиску"><i class="fa fa-backward"></i>&nbsp;Назад к поиску</a></div>
                </div>
                <br />
                <div class="panel-body">
                    <div class="col-lg-8">
                        <table runat="server">
                            <tr>
                                <td style="color:black;font-size:large"></td>
                                <td style="margin-left:5%">
                                    <div id="holder" style="border:none;color:white;overflow:auto">
                                        <ul id="place" style="margin-top:30%">
                                        </ul>
                                    </div>
                                </td>
                                <td style="color:black;font-size:large"></td>
                            </tr>
                        </table>

                        <div style="margin-top: 10px;overflow:auto">
                            <ul id="seatDescription">
                                <li style="background: url('img/newAvailableSeat.png') no-repeat scroll 0 0 transparent; width: 25%; height: 30%; color: white">Доступные </li>
                                <li style="background: url('img/bookedseats.png') no-repeat scroll 0 0 transparent; width: 25%; height: 30%; color: white">Занятые</li>
                                <li style="background: url('img/newSelectedSeat.png') no-repeat scroll 0 0 transparent; width: 25%; height: 30%; color: white">Выбранные </li>
                            </ul>
                        </div>
                        <div style="clear: both; width: 100%; margin-top: 70px;">
                            <input type="button" id="btnShowNew" value="  " />
                            <input type="button" id="btnShow" value=" " />
                        </div>
                    </div>
                    <div class="col-lg-4" style="overflow:auto">
                        <div class="panel panel-danger">
                            <div class="panel panel-heading">
                                
                                    <h2>Детали Бронирования</h2>
                                
                            </div>
                            <div class="panel-body">
                           
                        <asp:Label ID="lblForm" runat="server" Font-Bold="true"></asp:Label>
                                
                        <asp:Label ID="lblTo" runat="server" Font-Bold="true" /><br />
                               
                        <asp:Label ID="lbldate" runat="server" Font-Bold="true"></asp:Label><br />
                                <br />
                                <div class="col-lg-12">
                                    <table class="table-bordered">
                                        <tr>
                                            <td>Номер Выбранной линии</td>
                                            <td>
                                                <%-- <label id="lblSelectedSeat"></label>--%>
                                                <asp:Label ID="lblSelectedSeat" runat="server" ClientIDMode="Static" Font-Bold="true"></asp:Label></td>
                                            <asp:HiddenField ID="hdnSeatNo" runat="server" ClientIDMode="Static" />
                                            <asp:HiddenField ID="hdnSeatCount" runat="server" ClientIDMode="Static" />
                                            <asp:HiddenField ID="hdnSeatTypeID" runat="server" ClientIDMode="Static" />
                                            <asp:HiddenField ID="hdnFare" runat="server" ClientIDMode="Static" />
                                            <asp:HiddenField ID="hdnTotalFare" runat="server" ClientIDMode="Static" />
                                        </tr>
                                         <tr>
                                            <td>Стоимость за линию</td>
                                            <td><span><i class="fa fa-rupee"></i></span>
                                                <asp:Label ID="lblPerSeat" runat="server" ClientIDMode="Static" Font-Bold="true" Text="0.00" />
                                                </td>
                                                <%-- <label id="lbltotal">0.00</label></td>--%>
                                        </tr>
                                        <tr>
                                            <td>Общая стоимость</td>
                                            <td><span><i class="fa fa-rupee"></i></span>
                                                <asp:Label ID="lbltotal" runat="server" ClientIDMode="Static" Font-Bold="true" Text="0.00" />
                                                </td>
                                                <%-- <label id="lbltotal">0.00</label></td>--%>
                                        </tr>
                                    </table>
                                </div>
                                <div style="margin-top: 5%" class="col-lg-12">
                                    <asp:Label ID="lblBoardingPoint" runat="server" Font-Bold="true" Text="Время бронирования"></asp:Label>
                                    <asp:DropDownList ID="ddlBoardingpoints" runat="server" ClientIDMode="Static" Style="width: 100%"></asp:DropDownList><br />
                                    <br />
                                    <asp:Label ID="lblDroppingPoints" runat="server" Font-Bold="true" Text="Dropping Points" Style="display: none"></asp:Label>
                                    <asp:DropDownList ID="ddlDroppingpoints" runat="server" Style="display: none; width: 70%">
                                        <asp:ListItem Value="0" Text="Выберите время"></asp:ListItem>
                                    </asp:DropDownList><br />
                                    <br />
                                    <asp:Button ID="btnPayment" runat="server" Text="Оплатить" CssClass="btn btn-danger" OnClick="btnPayment_Click" ClientIDMode="Static" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        <script type="text/JavaScript">
            $(document).ready(function () {
                $('#btnPayment').click(function () {
                    var boarding = $('#ddlBoardingpoints').val();
                    var seatDetails = $('#lblSelectedSeat').text();
                    if (seatDetails == '') {
                        alert("Please select seats");
                        return false;
                    }
                    else if (boarding == 0) {
                        alert("Please select boarding points");
                        return false;
                    }
                    else {
                        debugger;
                        var newseatDetails = '<%= Session["SeatNo"] %>'
                       if (newseatDetails.value != '' || newseatDetails.value != null) {
                           var splitSetails = newseatDetails.split(",");
                           var splitSeatarray = new Array();
                           for (var i = 0; i < splitSetails.length; i++) {
                               splitSeatarray.push(splitSetails[i]);
                           }
                           var seat = $('#lblSelectedSeat').text();
                           var Seats = seat.split(",");
                           var newSeatArray = new Array();
                           for (var i = 0; i < Seats.length; i++) {
                               newSeatArray.push(Seats[i]);
                           }
                           if (newseatDetails != '') {
                               if (splitSeatarray.length != newSeatArray.length) {
                                   alert("Please select" + " " + splitSeatarray.length + " " + "Seats");
                                   return false;
                               }
                           }
                           else {
                               return true;
                           }
                       }
                   }
                });
            });
       $(document).ready(function () {
           $('#btnReturn').click(function () {
               var boarding = $('#ddlBoardingpoints').val();
               var seatDetails = $('#lblSelectedSeat').text();
               if (seatDetails == '') {
                   alert("Please select seats");
                   return false;
               }
               else if (boarding == 0) {
                   alert("Please select boarding points");
                   return false;
               }

           });
       });
       function getSeatLayout(row, column, bookSeat,fare) {
           var bookedSeatNo = bookSeat.split(",");
           var newFare = parseFloat(fare);
           debugger;
           var settings = {
               rows: row,
               cols: column,
               rowCssPrefix: 'row-',
               colCssPrefix: 'col-',

               seatWidth: 35,
               seatHeight: 35,
               seatCss: 'seat',
               selectedSeatCss: 'selectedSeat',
               selectingSeatCss: 'selectingSeat',
           };

           var init = function (reservedSeat,fareDetails) {
               var str = [], seatNo, className, totalAmount;
               totalAmount = fareDetails;
               for (i = 0; i < settings.rows; i++) {
                   for (j = 0; j < settings.cols; j++) {
                       seatNo = (i + j * settings.rows + 1);
                       className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
                       if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {
                           className += ' ' + settings.selectedSeatCss;
                       }
                       str.push('<li class="' + className + '"' +
                                 'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
                                 '<a title="SeatNo:' + seatNo + ' Fare:' + totalAmount + '"  Seat="' + seatNo + '" TotalFare="' + totalAmount + '">' + seatNo + '</a>' +
                                 '</li>');
                   }
               }
               $('#place').html(str.join(''));
           };
           //case I: Show from starting
           //init();

           //Case II: If already booked
           debugger;
           var bookedSeats = new Array();
           for (var i = 0; i < bookedSeatNo.length; i++)
           {
               bookedSeats.push(parseInt(bookedSeatNo[i]));
           }
          // var bookedSeats = [5, 10, 25];
           init(bookedSeats, newFare);
           //case I: Show from starting
           //init();

           //Case II: If already booked
          
           //bookSeat;
           //

           $('.' + settings.seatCss).click(function () {
               if ($(this).hasClass(settings.selectedSeatCss)) {
                   alert('This seat is already reserved');
               }
               else {
                   $(this).toggleClass(settings.selectingSeatCss);
                   var str = [];
                   var totalAmount = [];
                   var amount = 0;
                   $.each($('#place li.' + settings.selectingSeatCss + ' a'), function (index, value) {
                       
                       str.push($(this).attr('Seat'));
                       totalAmount.push($(this).attr('TotalFare'));
                   });
                   if (str.length > 3) {
                       $(this).removeClass(settings.selectingSeatCss);
                       alert('You can not select more than three seats per booking');
                   }
                   else {
                       
                       var i = totalAmount.length;
                       amount = parseFloat(i * totalAmount[0]);
                       if (totalAmount == '')
                       {
                           $("#lbltotal").text("0.00");
                           $('#lblPerSeat').text("0.00");
                       }
                       else {
                           $("#lbltotal").text(amount);
                           $('#lblPerSeat').text(totalAmount.join(','));
                           $('#hdnFare').val($('#lblPerSeat').text());

                       }
                       $('#lblSelectedSeat').text(str.join(','));
                       $('#hdnSeatNo').val($('#lblSelectedSeat').text());
                   }
               }
           });
    }
    //$('#btnShow').click(function () {
    //    var str = [];
    //    $.each($('#place li.' + settings.selectedSeatCss + ' a, #place li.' + settings.selectingSeatCss + ' a'), function (index, value) {
    //        str.push($(this).attr('title'));
    //    });
    //    alert(str.join(','));
    //})

    //$('#btnShowNew').click(function () {
    //    var str = [], item;
    //    $.each($('#place li.' + settings.selectingSeatCss + ' a'), function (index, value) {
    //        item = $(this).attr('title');
    //        str.push(item);
    //    });
    //    alert(str.join(','));
    //})

        </script>
    </div>
</asp:Content>
