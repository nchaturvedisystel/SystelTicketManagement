TicketDetails = new Object()

TicketDetails.ticketId = 0


TicketDetails.onReady = function () {
    TicketDetails.LoadAll()
}

TicketDetails.LoadAll = function () {
    Ajax.AuthPost("ticket/TicketDetails", TicketDetails, TicketDetails_OnSuccessCallBack, TicketDetails_OnErrorCallBack);

}

function TicketDetails_OnSuccessCallBack(data) {
    console.log(data)
}

function TicketDetails_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

