
    TicketDetails = new Object()

TicketDetails.ticketId = 0;
TicketDetails.flag = true;
TicketDetails.UserId = 0;

TicketDetails.InstructionsEditorLoaded = 0;
TicketDetails.InstructionsEditor;

TicketDetails.RichTextComment = function () {
    // if (TicketDetails.InstructionsEditorLoaded == 0) {
    TicketDetails.InstructionsEditor = new RichTextEditor("#TemplateInstEditor");
    //TicketDetails.InstructionsEditorLoaded = 1;
    // }
}

TicketDetails.onReady = function () {
    TicketDetails.LoadAll();
}

TicketDetails.LoadAll = function () {
    Ajax.AuthPost("ticket/TicketDetails", TicketDetails, TicketDetails_OnSuccessCallBack, TicketDetails_OnErrorCallBack);
}

function TicketDetails_OnSuccessCallBack(data) {
    TicketDetails.RichTextComment();
    TicketDetails.flag = true;
    let ticketDetail = data.tickets[0];
    //console.log(ticketDetail)
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
    //TicketDetails.AddDescription();
    TicketDetails.UserId = User.UserId;
    Ajax.AuthPost("Description/TicketDescription", ticketDetail, TicketDescription_OnSuccessCallBack, TicketDescription_OnErrorCallBack);


}

TicketDetails.DateFormat = function (dateString) {
    const indexOfT = dateString.indexOf('T');
    const dateWithoutTime = dateString.substring(0, indexOfT);
    return dateWithoutTime;
}

TicketDetails.AddDescription = function () {
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
    //Ajax.AuthPost("Description/TicketDescription", newTicketDetails, TicketDescription_OnSuccessCallBack, TicketDescription_OnErrorCallBack);

}


function TicketDescription_OnSuccessCallBack(data) {
    if (TicketDetails.flag) {
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
    TicketDetails.flag = false;

}
function TicketDescription_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

function TicketDetails_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}




