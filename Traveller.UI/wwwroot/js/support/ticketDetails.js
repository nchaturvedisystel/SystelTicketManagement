
TicketDetails = new Object()

TicketDetails.ticketId = 0;
TicketDetails.flag = true;
TicketDetails.UserId = 0;

TicketDetails.InstructionsEditorLoaded = 0;
TicketDetails.InstructionsEditor;


TicketDetails.onReady = function () {
    TicketDetails.LoadTicketDetail();
    TicketDetails.InitiateRTE("TemplateInstEditor");
}


//#region Load Ticket Details
TicketDetails.LoadTicketDetail = function () {
    var ticket = new Object();
    ticket.ticketId = TicketDetails.ticketId;
    Ajax.AuthPost("ticket/TicketDetails", ticket, LoadTicketDetail_OnSuccessCallBack, LoadTicketDetail_OnErrorCallBack);
}

function LoadTicketDetail_OnSuccessCallBack(data) {
    let ticketDetail = data.tickets[0];
    //document.getElementById('ticketId').innerHTML = "#" + ticketDetail.ticketId;
    //document.getElementById('projectName').innerHTML = ticketDetail.projectName;
    //document.getElementById('ticketType').innerHTML = ticketDetail.ticketType;
    //document.getElementById('CompanyName').innerHTML = ticketDetail.companyName;
    //document.getElementById('Title').innerHTML = ticketDetail.title;
    //document.getElementById('TDese').innerHTML = ticketDetail.ticketDesc;
    //document.getElementById('TicketStatus').innerHTML = ticketDetail.ticketStatus;
    //document.getElementById('ResolutionDate').innerHTML = TicketDetails.DateFormat(ticketDetail.resolutionDate);
    //document.getElementById('TargetDate').innerHTML = TicketDetails.DateFormat(ticketDetail.targetDate);
    //document.getElementById('CreatedOn').innerHTML = TicketDetails.DateFormat(ticketDetail.createdOn);
    //document.getElementById('ModifiedOn').innerHTML = TicketDetails.DateFormat(ticketDetail.modifiedOn);
    //document.getElementById('AssignedTo').innerHTML = ticketDetail.assignedToName;
    //document.getElementById('ownedBy').innerHTML = ticketDetail.ownedBy;



    document.getElementById("headerTicketStatus").innerHTML = ticketDetail.ticketStatus;
    document.getElementById("headerTicketTitle").innerHTML = ticketDetail.title;
    document.getElementById("headerTicketId").innerHTML = "#" + ticketDetail.ticketId;

    document.getElementById("detailTicketStatus").innerHTML = ticketDetail.ticketStatus;
    document.getElementById("detailTicketPriority").innerHTML = ticketDetail.ticketPriority;
    document.getElementById("detailTicketType").innerHTML = ticketDetail.ticketType;
    document.getElementById("detailAssignedTo").innerHTML = ticketDetail.assignedTo;
    document.getElementById("detailTicketOwnedBy").innerHTML = ticketDetail.ownedBy;
    document.getElementById("detailTicketTag").innerHTML = ticketDetail.tagList;
    document.getElementById("detailTicketDesc").innerHTML = ticketDetail.ticketDesc;
    document.getElementById("detailTicketDueDate").innerHTML = TicketDetails.DateFormat(ticketDetail.dueDate);
    document.getElementById("detailTicketTargetDate").innerHTML = TicketDetails.DateFormat(ticketDetail.targetDate);
    document.getElementById("detailTicketResolutionDate").innerHTML = TicketDetails.DateFormat(ticketDetail.resolutionDate);
    document.getElementById("detailTicketUpdatedBy").innerHTML = ticketDetail.modifiedBy;
    document.getElementById("detailTicketUpdatedOn").innerHTML = TicketDetails.DateFormat(ticketDetail.modifiedOn);
    document.getElementById("detailTicketCreatedBy").innerHTML = ticketDetail.createdBy;
    document.getElementById("detailTicketCreatedOn").innerHTML = TicketDetails.DateFormat(ticketDetail.createdOn);
    document.getElementById("detailTicketEstimatedDuration").innerHTML = ticketDetail.estimatedDuration;
    document.getElementById("detailTicketActualDuration").innerHTML = ticketDetail.actualDuration;

    TicketDetails.UserId = User.UserId;
    Ajax.AuthPost("Description/TicketDescription", ticketDetail, AddTicketComments_OnSuccessCallBack, AddTicketComments_OnErrorCallBack);
}

function LoadTicketDetail_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}
//#endregion

//#region Common
TicketDetails.DateFormat = function (dateString) {
    const indexOfT = dateString.indexOf('T');
    const dateWithoutTime = dateString.substring(0, indexOfT);
    return dateWithoutTime;
}
TicketDetails.InitiateRTE = function (id) {
    if (document.getElementById(id)) {
        var editorId = ("#" + id);
        TicketDetails.InstructionsEditor = new RichTextEditor(editorId);
    }
    else {
        setTimeout(function () {
            TicketDetails.InitiateRTE(id);
        }, 1000);
    }
}
//#endregion

//#region  Ticket Comments and Updates
TicketDetails.InsertTicketComments = function () {
    var newTicketDetails = {};
    newTicketDetails.ticketsComments = TicketDetails.InstructionsEditor.getPlainText();
    newTicketDetails.ticketId = TicketDetails.ticketId;
    newTicketDetails.createdBy = (TicketDetails.UserId).toString();
    Ajax.AuthPost("Description/TicketDescription", newTicketDetails, InsertTicketComments_OnSuccessCallBack, InsertTicketComments_OnErrorCallBack);
   
}

function InsertTicketComments_OnSuccessCallBack(data) {
    console.log(data);
}

function InsertTicketComments_OnErrorCallBack(error) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}


function AddTicketComments_OnSuccessCallBack(data) {
    var descriptions = data.tickets;
    var ticketDetailActivity = document.getElementById('ticketDetailActivity');
    ticketDetailActivity.innerHTML = "";
    for (let i = descriptions.length - 1; i > 0; i--) {
        var activityHTML = (''
            + '<div class="card mb-3">'
            + '<div class="card-header" >'
            + '            <div><b>nchaturvedi</b> has given up on the ticket</div>'
            + '            <small class="text-muted">' + TicketDetails.DateFormat(descriptions[i].modifiedOn) +'</small>'
            + '        </div>'
            + '<div class="card-body">' + descriptions[i].ticketComments+'</div>'
            + '</div> '
        );

        ticketDetailActivity.innerHTML = (ticketDetailActivity.innerHTML + activityHTML);
    }

}
function AddTicketComments_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}
//#endregion





