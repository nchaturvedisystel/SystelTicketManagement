
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
    document.getElementById('ticketId').innerHTML = "#" + ticketDetail.ticketId;
    document.getElementById('projectName').innerHTML = ticketDetail.projectName;
    document.getElementById('ticketType').innerHTML = ticketDetail.ticketType;
    document.getElementById('CompanyName').innerHTML = ticketDetail.companyName;
    document.getElementById('Title').innerHTML = ticketDetail.title;
    document.getElementById('TDese').innerHTML = ticketDetail.ticketDesc;
    document.getElementById('TicketStatus').innerHTML = ticketDetail.ticketStatus;
    document.getElementById('ResolutionDate').innerHTML = TicketDetails.DateFormat(ticketDetail.resolutionDate);
    document.getElementById('TargetDate').innerHTML = TicketDetails.DateFormat(ticketDetail.targetDate);
    document.getElementById('CreatedOn').innerHTML = TicketDetails.DateFormat(ticketDetail.createdOn);
    document.getElementById('ModifiedOn').innerHTML = TicketDetails.DateFormat(ticketDetail.modifiedOn);
    document.getElementById('AssignedTo').innerHTML = ticketDetail.assignedToName;
    document.getElementById('ownedBy').innerHTML = ticketDetail.ownedBy;
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
TicketDetails.AddTicketComments = function () {
    var newTicketDetails = {};
    var commentText = newTicketDetails.InstructionsEditor.getPlainText();
    if (commentText != "") {
        var commentsDiv = document.getElementById("comments");
        var commentElement = document.createElement("div");
        commentElement.className = "col-md-6 comments-container border p-3 m-2";
        commentElement.style.backgroundColor = "#eee";
        commentElement.appendChild(document.createTextNode(commentText));
        commentsDiv.insertBefore(commentElement, commentsDiv.firstChild);
        document.getElementById("comment").value = "";
        newTicketDetails.ticketComments = commentText;
    }
    newTicketDetails.ticketId = TicketDetails.ticketId;
    newTicketDetails.createdBy = (TicketDetails.UserId).toString();
    console.log('triggered')
    //Ajax.AuthPost("Description/TicketDescription", newTicketDetails, AddTicketComments_OnSuccessCallBack, AddTicketComments_OnErrorCallBack);

}


function AddTicketComments_OnSuccessCallBack(data) {
    var descriptions = data.tickets;
    var comments = document.getElementById('comments');
    for (let i = descriptions.length - 1; i > 0; i--) {
        var newDiv = document.createElement('div');
        newDiv.className = "col-md-12 comments-container border p-3 d-flex flex-column mb-0";
        newDiv.style.backgroundColor = "#eee";

        let description = descriptions[i].ticketComments;
        newDiv.innerHTML = description;
        comments.appendChild(newDiv);

        //console.log(descriptions[i].modifiedBy);
        var innerDiv = document.createElement("div");
        innerDiv.className = "col-md-12 p-0 inner-div-class mb-3";
        innerDiv.style.backgroundColor = "#eee";
        innerDiv.innerHTML = TicketDetails.DateFormat(descriptions[i].modifiedOn);
        comments.appendChild(innerDiv);
    }

}
function AddTicketComments_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}
//#endregion





