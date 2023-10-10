TicketDetails = new Object()

TicketDetails.ticketId = 0;


TicketDetails.onReady = function () {
    TicketDetails.LoadAll()
}

TicketDetails.LoadAll = function () {
    Ajax.AuthPost("ticket/TicketDetails", TicketDetails, TicketDetails_OnSuccessCallBack, TicketDetails_OnErrorCallBack);
}

function TicketDetails_OnSuccessCallBack(data) {

    //var cmtElement = document.getElementById('cmt');
    //cmtElement.style.display = 'block';
    
  
    let ticketDetail = data.tickets[0]
    console.log(ticketDetail)
    document.getElementById('ticketId').innerHTML = ticketDetail.ticketId;
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
    //document.getElementById('ownedBy').innerHTML = ticketDetail.ticketOwner;
    TicketDetails.AddDescription();
    
   
}

TicketDetails.DateFormat = function (dateString) {
    const indexOfT = dateString.indexOf('T');
    const dateWithoutTime = dateString.substring(0, indexOfT);
    return dateWithoutTime;
}

TicketDetails.AddDescription = function () {
    
    var newTicketDetails = {};
    //newTicketDetails.TicketDesc = TicketDetails.InstructionsEditor.getPlainText();
    //console.log(newTicketDetails.TicketDesc);

    var commentText = document.getElementById("comment").value;
    var commentsDiv = document.getElementById("comments");

    if (commentText.trim() !== "") {
        var commentElement = document.createElement("div");
        commentElement.className = "col-md-6 comments-container border p-3 m-2";
        commentElement.style.backgroundColor = "#eee";
        commentElement.appendChild(document.createTextNode(commentText));
        commentsDiv.insertBefore(commentElement, commentsDiv.firstChild);

        
        document.getElementById("comment").value = "";
    }
    newTicketDetails.ticketComments = commentText;
    newTicketDetails.ticketId = TicketDetails.ticketId;
    Ajax.AuthPost("Description/TicketDescription", newTicketDetails, TicketDescription_OnSuccessCallBack, TicketDescription_OnErrorCallBack);
    
}


function TicketDescription_OnSuccessCallBack(data) {

    var descriptions = data.tickets;
    var comments = document.getElementById('comments');
    //console.log(descriptions[1].ticketComments) 

    for (let i = descriptions.length -1 ; i > 0; i--) {
       
        var newDiv = document.createElement('div');
        newDiv.className = "col-md-6 comments-container border p-3 m-2";
        let description = descriptions[i].ticketComments; 
        newDiv.innerHTML = description;
        comments.appendChild(newDiv);
    }

}
function TicketDescription_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

function TicketDetails_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}




