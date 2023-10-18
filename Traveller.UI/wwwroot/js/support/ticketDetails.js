
TicketDetails = new Object()

TicketDetails.ticketId = 0;
TicketDetails.flag = true;
TicketDetails.UserId = 0;

TicketDetails.InstructionsEditorLoaded = 0;
TicketDetails.InstructionsEditor;

TicketDetails.onReady = function () {
    UserMaster.GetAllUserList();
    TicketDetails.InitiateRTE("TemplateInstEditor");
}


//#region Load Ticket Details
TicketDetails.LoadTicketDetail = function () {
    // $('#CreateTicketModal').modal('hide');
    var ticket = new Object();
    ticket.ticketId = TicketDetails.ticketId;
    Ajax.AuthPost("Ticket/TicketDetails", ticket, LoadTicketDetail_OnSuccessCallBack, LoadTicketDetail_OnErrorCallBack);
    var TicketResolverDropDown = {};
    TicketResolverDropDown.ActionUser = User.UserId;
    Ajax.AuthPost("menus/GetTicketResolverList", TicketResolverDropDown, TicketResolverDropDown_OnSuccessCallBack, LoadTicketDetail_OnErrorCallBack);
}

function LoadTicketDetail_OnSuccessCallBack(data) {
    $('#EditTicketModal').modal('hide');
    let ticketDetail = data.tickets[0];
    document.getElementById("headerTicketStatus").innerHTML = ticketDetail.ticketStatus;
    document.getElementById("headerTicketTitle").innerHTML = ticketDetail.title;
    document.getElementById("headerTicketId").innerHTML = "#" + ticketDetail.ticketId;

    document.getElementById("detailTicketStatus").innerHTML = ticketDetail.ticketStatus;
    document.getElementById("detailTicketPriority").innerHTML = ticketDetail.ticketPriority;
    document.getElementById("detailTicketType").innerHTML = ticketDetail.ticketType;
    document.getElementById("detailAssignedTo").innerHTML = UserMaster.GetUserNameById(ticketDetail.assignedTo);
    document.getElementById("detailTicketOwnedBy").innerHTML = UserMaster.GetUserNameById(ticketDetail.ownedBy);
    document.getElementById("detailTicketTag").innerHTML = ticketDetail.tagList;
    document.getElementById("detailTicketDesc").innerHTML = ticketDetail.ticketDesc;
    document.getElementById("detailTicketDueDate").innerHTML = TicketDetails.DateFormat(ticketDetail.dueDate);
    document.getElementById("detailTicketTargetDate").innerHTML = TicketDetails.DateFormat(ticketDetail.targetDate);
    document.getElementById("detailTicketResolutionDate").innerHTML = TicketDetails.DateFormat(ticketDetail.resolutionDate);
    document.getElementById("detailTicketUpdatedBy").innerHTML = UserMaster.GetUserNameById(ticketDetail.modifiedBy);
    document.getElementById("detailTicketUpdatedOn").innerHTML = TicketDetails.DateFormat(ticketDetail.modifiedOn);
    document.getElementById("detailTicketCreatedBy").innerHTML = UserMaster.GetUserNameById(ticketDetail.createdBy);
    document.getElementById("detailTicketCreatedOn").innerHTML = TicketDetails.DateFormat(ticketDetail.createdOn);
    document.getElementById("detailTicketEstimatedDuration").innerHTML = ticketDetail.estimatedDuration;
    document.getElementById("detailTicketActualDuration").innerHTML = ticketDetail.actualDuration;

    TicketDetails.UserId = User.UserId;
    TicketDetails.LoadTicketActivity(ticketDetail.ticketId);
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
TicketDetails.DateTimeFormat = function (date) {
    date = new Date(date);
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;

    return date.getMonth() + 1 + "/" + date.getDate() + "/" + date.getFullYear() + " " + strTime;
}
TicketDetails.InitiateRTE = function (id) {
    if (document.getElementById(id)) {
        var editorId = ("#" + id);

        TicketDetails.InstructionsEditor = new RichTextEditor(editorId);
        TicketDetails.LoadTicketDetail();
    }
    else {
        setTimeout(function () {
            TicketDetails.InitiateRTE(id);
        }, 1000);
    }
}
//#endregion

//#region  Ticket Comments and Updates
TicketDetails.AddCommentButtonOnClick = function () {
    if (!$('#detailActivityDiv').is(':visible')) {
        $("#detailActivityDiv").slideToggle();
    }
}
TicketDetails.CloseCommentDialougeOnClick = function () {
    if ($('#detailActivityDiv').is(':visible')) {
        $("#detailActivityDiv").slideToggle();
    }
    TicketDetails.ClearActivityForm();
}

TicketDetails.TakeOverButtonOnClick = function () {
    console.log("Take Over Button Working")
    var TicketTakeOver = {};
    TicketTakeOver.AssignedToId = User.UserId;
    TicketTakeOver.ticketId = TicketDetails.ticketId;
    TicketTakeOver.ActionUser = User.UserId;
    Ajax.AuthPost("menus/GetTicketResolverList", TicketTakeOver, TicketTakeOver_OnSuccessCallBack, LoadTicketDetail_OnErrorCallBack);

}

function TicketTakeOver_OnSuccessCallBack(data) {
    var ticketActivity = new Object();
    ticketActivity.ticketComments = `<div><span style=" text-align: left; font-style: italic"><span style="color: rgb(48, 62, 61); font-family: Montserrat, sans-serif; font-size: 10.5px; text-align: center; white-space: nowrap; background-color: rgba(48, 62, 61, 0.03)"><span style="font-weight: bold; background-color: rgb(255, 255, 255); color: rgb(128, 128, 128)">${User.UserName}</span><span>&nbsp;</span></span></span><span style=" white-space: nowrap; color: rgb(48, 62, 61); font-family: Montserrat, sans-serif; font-size: 10.5px; text-align: center; background-color: rgba(48, 62, 61, 0.03)"><span style="font-style: italic; background-color: rgb(255, 255, 255); color: rgb(128, 128, 128)">has taken over this ticket</span></span><br /></div>`

    ticketActivity.ticketId = TicketDetails.ticketId;
    ticketActivity.createdBy = (TicketDetails.UserId).toString();
    Ajax.AuthPost("Ticket/TicketComments", ticketActivity, InsertTicketActivity_OnSuccessCallBack, InsertTicketActivity_OnErrorCallBack);
    TicketDetails.LoadTicketDetail();
}

TicketDetails.LoadTicketActivity = function (ticketId) {
    var ticketActivity = new Object();
    ticketActivity.ticketId = ticketId;
    Ajax.AuthPost("Ticket/TicketComments", ticketActivity, InsertTicketActivity_OnSuccessCallBack, InsertTicketActivity_OnErrorCallBack);
}


TicketDetails.InsertTicketActivity = function () {
    var ticketActivity = new Object();
    ticketActivity.ticketComments = TicketDetails.InstructionsEditor.getHTML();
    ticketActivity.ticketId = TicketDetails.ticketId;
    ticketActivity.createdBy = (TicketDetails.UserId).toString();
    Ajax.AuthPost("Ticket/TicketComments", ticketActivity, InsertTicketActivity_OnSuccessCallBack, InsertTicketActivity_OnErrorCallBack);

}

function InsertTicketActivity_OnSuccessCallBack(data) {
    var ticketActivities = data.ticketActivities;
    var ticketDetailActivity = document.getElementById('ticketDetailActivity');
    ticketDetailActivity.innerHTML = "";
    for (var i = 0; i < ticketActivities.length; i++) {
        var activityHTML = (''
            + '<div class="card mb-3">'
            + '<div class="card-header" >'
            + '            <div><b>' + UserMaster.GetUserNameById(ticketActivities[i].createdBy) + '</b></div>'
            + '            <small class="text-muted">' + TicketDetails.DateTimeFormat(ticketActivities[i].modifiedOn) + '</small>'
            + '        </div>'
            + '<div class="card-body">' + ticketActivities[i].ticketComments + '</div>'
            + '</div> '
        );

        ticketDetailActivity.innerHTML = (ticketDetailActivity.innerHTML + activityHTML);
    }
    TicketDetails.CloseCommentDialougeOnClick();
}
function InsertTicketActivity_OnErrorCallBack(err) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

TicketDetails.ClearActivityForm = function () {
    TicketDetails.InstructionsEditor.setPlainText("");
}
//#endregion

function TicketResolverDropDown_OnSuccessCallBack(data) {
    var resolverList = data.tickets;
    var assignToList = document.getElementById("assignToList");
    var defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.textContent = "Select an option";
    assignToList.appendChild(defaultOption);
    for (var i = 0; i < resolverList.length; i++) {
        if (resolverList[i].userId !== User.UserId) {
            var option = document.createElement("option");
            option.value = resolverList[i].userId;
            option.textContent = resolverList[i].name;
            assignToList.appendChild(option);
        }
    }
}

TicketDetails.AssignToDropdown = function () {
    var assignToDropdown = document.getElementById("assignToDropdown");
    var dropdownDiv = document.getElementById("dropdownDiv");
    if (assignToDropdown.style.display === "none") {
        assignToDropdown.style.display = "block";
    } else {
        assignToDropdown.style.display = "none";
    }
    dropdownDiv.style.display = "none";
}

TicketDetails.handleAssigneeChange = function (selectElement) {

    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var selectedId = selectedOption.value;
    var selectedName = selectedOption.textContent;
    let ticketId = TicketDetails.ticketId;
    var updateAssignedToOther = {};
    updateAssignedToOther.ticketId = ticketId;
    updateAssignedToOther.assignedToId = selectedId;
    updateAssignedToOther.ActionUser = User.UserId;
    Ajax.AuthPost("menus/GetTicketResolverList", updateAssignedToOther, UpdatedTicketResolverList_OnSuccessCallBack, LoadTicketDetail_OnErrorCallBack);
}

function UpdatedTicketResolverList_OnSuccessCallBack(data) {
    let assignToList = document.getElementById('assignToList');
    assignToList.innerHTML = "";
    TicketDetails.LoadTicketDetail();
}

TicketDetails.OpenEditTicketModal = function () {
    $('#EditTicketModal').modal('show');
    console.log(TicketDetails);
    var ticket = new Object();
    ticket.ticketId = TicketDetails.ticketId;
    Ajax.AuthPost("Ticket/TicketDetails", ticket, EditTicketDetail_OnSuccessCallBack, LoadTicketDetail_OnErrorCallBack);
   
}
function EditTicketDetail_OnSuccessCallBack(data) {
    let ticketData = data.tickets[0];
    var projectSelect = document.getElementById("project");
    for (var i = 0; i < projectSelect.options.length; i++) {
        if (projectSelect.options[i].value == ticketData.projectId) {
            projectSelect.options[i].selected = true;
            break;
        }
    }
    document.getElementById("title").value = ticketData.title;
    var categorySelect = document.getElementById("category");
    for (var i = 0; i < categorySelect.options.length; i++) {
        if (categorySelect.options[i].value === ticketData.category) {
            categorySelect.options[i].selected = true;
            break; 
        }
    }
    var prioritySelect = document.getElementById("priority");
    for (var i = 0; i < prioritySelect.options.length; i++) {
        if (prioritySelect.options[i].text === ticketData.ticketPriority) {
            prioritySelect.options[i].selected = true;
            break;
        }
    }
    var ticketTypeySelect = document.getElementById("ticketType");
    for (var i = 0; i < ticketTypeySelect.options.length; i++) {
        if (ticketTypeySelect.options[i].text === ticketData.ticketType) {
            ticketTypeySelect.options[i].selected = true;
            break;
        }
    }
    document.getElementById("targetDate").value = TicketDetails.DateFormat(ticketData.targetDate) ;
    document.getElementById("tags").value = ticketData.tagList;
    document.getElementById("affectsCustomer").checked = ticketData.affectsCustomer === 'on' ? true : false;
    document.getElementById("AddField1").value = ticketData.addField1;
    document.getElementById("AddField2").value = ticketData.addField2;
}
TicketDetails.UpdateTicket = function () {
    var updateTicket = {};
    updateTicket.TicketId = TicketDetails.ticketId;
    updateTicket.Title = document.getElementById("title").value;
    updateTicket.TicketType = document.getElementById("ticketType").value;
    updateTicket.Category = document.getElementById("category").value;
    updateTicket.TagList = document.getElementById("tags").value;
    updateTicket.TicketPriority = document.getElementById("priority").value;
    updateTicket.AffectsCustomer = document.getElementById("affectsCustomer").value;
    updateTicket.TargetDate = new Date(document.getElementById("targetDate").value);
    updateTicket.ProjectId = document.getElementById("project").value;
    updateTicket.ActionUser = User.UserId;
    updateTicket.AddField1 = document.getElementById("AddField1").value;
    updateTicket.AddField2 = document.getElementById("AddField2").value;

    // Perform validation
    var ValidationMsg = " Please provide ";
    ValidationMsg += (updateTicket.Title.trim() === '') ? " Title," : '';
    ValidationMsg += (updateTicket.Category.trim() === '') ? " Category," : '';
    ValidationMsg += (updateTicket.TicketPriority.trim() === '') ? " Priority," : '';
    ValidationMsg += (updateTicket.TicketType.trim() === '') ? " Type," : '';
    ValidationMsg += (updateTicket.TagList.trim() === '') ? " Tag," : '';
    ValidationMsg += (updateTicket.AddField1.trim() === '') ? " AddField1," : '';
    ValidationMsg += (updateTicket.AddField2.trim() === '') ? " AddField2," : '';

    if (ValidationMsg.trim() != "Please provide") {
        alert(ValidationMsg);
    }
    else {
        Ajax.AuthPost("ticket/ManageTicket", updateTicket, LoadTicketDetail_OnSuccessCallBack, LoadTicketDetail_OnErrorCallBack);
    }
}




