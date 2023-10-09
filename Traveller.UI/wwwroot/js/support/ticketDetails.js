TicketDetails = new Object()

TicketDetails.ticketId = 0


TicketDetails.onReady = function () {
    TicketDetails.LoadAll()
}

TicketDetails.LoadAll = function () {
    Ajax.AuthPost("ticket/TicketDetails", TicketDetails, TicketDetails_OnSuccessCallBack, TicketDetails_OnErrorCallBack);

}

function TicketDetails_OnSuccessCallBack(data) {

    let ticketDetail = data.tickets[0]
    console.log(ticketDetail)
    document.getElementById('ticketId').innerHTML = ticketDetail.ticketId;
    document.getElementById('projectName').innerHTML = ticketDetail.projectName;
    document.getElementById('ticketType').innerHTML = ticketDetail.ticketType;
    document.getElementById('CompanyName').innerHTML = ticketDetail.companyName;
    document.getElementById('Title').innerHTML = ticketDetail.title;
    document.getElementById('TDese').innerHTML = ticketDetail.ticketDesc;
    document.getElementById('Towner').innerHTML = ticketDetail.ticketOwner;
    document.getElementById('AssignedTo').innerHTML = ticketDetail.assignedTo;
    document.getElementById('TicketStatus').innerHTML = ticketDetail.ticketStatus;
    document.getElementById('TargetDate').innerHTML = ticketDetail.targetDate;
    
    



}

function TicketDetails_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

