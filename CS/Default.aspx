<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .pac-container {
            z-index: 100000;
        }
    </style>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_QD2_rlwEFGhCK0oj2n6cixsvX0D3zgk &sensor=false&libraries=places"></script>
    <script type="text/javascript">
        function OnInit(s, e) {
            var places = new google.maps.places.Autocomplete(s.GetInputElement());
            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                var address = place.formatted_address;
                var mesg = "Address: " + address;
                label.SetText(mesg);
            });
        }

        function tb2_OnInit(s, e) {
            var places = new google.maps.places.Autocomplete(s.GetInputElement());
            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                var address = place.formatted_address;
                var mesg = "Address: " + address;
                label2.SetText(mesg);
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <dx:ASPxTextBox ID="tb" runat="server" Width="170px" ClientInstanceName="tb">
            <ClientSideEvents Init="OnInit" />
        </dx:ASPxTextBox>

        <dx:ASPxLabel ID="label1" runat="server" Text="" ClientInstanceName="label">
        </dx:ASPxLabel>
        <br />
        <dx:ASPxButton ID="btShowPopup" runat="server" AutoPostBack="False" Text="Show Popup">
            <ClientSideEvents Click="function(s, e){ popup.Show(); }" />
        </dx:ASPxButton>

        <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup"
            HeaderText="Enter a location" CloseAction="CloseButton">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxTextBox ID="tb2" runat="server" Width="170px" NullText="Here">
                        <ClientSideEvents Init="tb2_OnInit" />
                    </dx:ASPxTextBox>
                    <dx:ASPxLabel ID="label2" runat="server" Text="" ClientInstanceName="label2">
                    </dx:ASPxLabel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

    </form>
</body>
</html>
