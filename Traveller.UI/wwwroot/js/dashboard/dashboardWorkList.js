DashboardWorkList = new Object()
DashboardWorkList.TicketId = 0;
DashboardWorkList.Title = "";
DashboardWorkList.TicketDesc = "";
DashboardWorkList.TicketType = "";
DashboardWorkList.Category = "";
DashboardWorkList.TagList = "";
DashboardWorkList.AssignedTo = "";
DashboardWorkList.TicketStatus = "";
DashboardWorkList.TicketPriority = "";
DashboardWorkList.AffectsCustomer = "";
DashboardWorkList.AppVersion = "";
DashboardWorkList.DueDate = new Date();
DashboardWorkList.EstimatedDuration = "";
DashboardWorkList.ActualDuration = "";
DashboardWorkList.TargetDate = new Date();
DashboardWorkList.ResolutionDate = new Date();
DashboardWorkList.IsActive = 0;
DashboardWorkList.IsDeleted = 0;
DashboardWorkList.TicketOwner = "";
DashboardWorkList.ProjectId = 0;
DashboardWorkList.CompanyId = 0;
DashboardWorkList.CompanyName = "";
DashboardWorkList.ProjectName = "";
DashboardWorkList.ActionUser = 0;
DashboardWorkList.InstructionsEditorLoaded = 0;
DashboardWorkList.InstructionsEditor;
DashboardWorkList.AssignedToName = "";
DashboardWorkList.TicketResolverListObj = {};

DashboardWorkList.CreateDashboardWorkListOnReady = function () {
    loggedInUser = JSON.parse(localStorage.getItem('loggedInUser'));
    Ajax.CompanyId = parseInt(loggedInUser.companyId);
    DashboardWorkList.LoadAll();
}

DashboardWorkList.LoadAll = function () {
    var newDashboardWorkList = {};
    DashboardWorkList.ClearCRUDform();
    console.log('Crate page loaded');
    newDashboardWorkList.ActionUser = User.UserId;
    newDashboardWorkList.CompanyId = Ajax.CompanyId;
    Ajax.AuthPost("menus/GetClientWorkList", newDashboardWorkList, DashboardWorkList_OnSuccessCallBack, DashboardWorkList_OnErrorCallBack);
    var TicketResolverList = {};
    TicketResolverList.ActionUser = User.UserId;
    Ajax.AuthPost("menus/GetTicketResolverList", TicketResolverList, TicketResolverList_OnSuccessCallBack, TicketResolverList_OnErrorCallBack);
}

function DashboardWorkList_OnSuccessCallBack(data) {
    //$('#CreateTicketModal').modal('hide');

    var ClientWorkInProgressData = data.workInProgress;
    var ClientAssignedToMeData = data.assignedToMe;
    var ClientOpenTicketsData = data.openTickets;
    var ClientClosedTicketsData = data.closedTickets;
    var ClientAssignedToOthersData = data.assignedToOthers;

    var ClientWorkInProgressListBody = document.getElementById('ClientWorkInProgressListBody');
    var ClientAssignedToMeListBody = document.getElementById('ClientAssignedToMeListBody');
    var ClientOpenTicketsListBody = document.getElementById('ClientOpenTicketsListBody');
    var ClientClosedTicketsListBody = document.getElementById('ClientClosedTicketsListBody');
    var ClientAssignedToOthersListBody = document.getElementById('ClientAssignedToOthersListBody');

    ClientWorkInProgressListBody.innerHTML = "";
    ClientAssignedToMeListBody.innerHTML = "";
    ClientOpenTicketsListBody.innerHTML = "";
    ClientClosedTicketsListBody.innerHTML = "";
    ClientAssignedToOthersListBody.innerHTML = "";

    DashboardWorkList.BindClientUserTicketList(ClientWorkInProgressListBody, ClientWorkInProgressData);
    DashboardWorkList.BindClientUserTicketList(ClientAssignedToMeListBody, ClientAssignedToMeData);
    DashboardWorkList.BindClientUserTicketList(ClientOpenTicketsListBody, ClientOpenTicketsData);
    DashboardWorkList.BindClientUserTicketList(ClientClosedTicketsListBody, ClientClosedTicketsData);
    DashboardWorkList.BindClientUserTicketList(ClientAssignedToOthersListBody, ClientAssignedToOthersData);
}

DashboardWorkList.BindClientUserTicketList = function (tbody, ticketData) {
    for (var i = 0; i < ticketData.length; i++) {
        var RowHtml = ('<tr>'
            + '                <td class="dtr-control sorting_1" style="border-left: 5px solid #' + Util.WCColors[i] + ';">' + ticketData[i].ticketId + '</td>'
            + '                <td>' + ticketData[i].companyName + '</td>'
            + '                <td>' + ticketData[i].projectName + '</td>'
            + '                <td id="AssignTo_' + ticketData[i].ticketId + '">'
            + '                <div onClick="DashboardWorkList.AssignWorkItem(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')">' + ticketData[i].assignedToName + '</div>' 
            + '                 </td>'
           // + '                 <div onClick="DashboardWorkList.AssignWorkItem(' + ticketData[i].ticketId + ',' + ticketData[i].modifiedBy + ',' + ticketData[i].assignedTo + ')"> ' + ticketData[i].assignedToName + '</div>'
            + '                <td>' + (new Date(ticketData[i].createdOn).toLocaleDateString("en-US")) + '</td>'
            + '                <td>' + ticketData[i].ticketStatus + '</td>'
            + '                <td>' + (new Date(ticketData[i].targetDate).toLocaleDateString("en-US")) + '</td>'
            + '                <td class="text-center">'
            + '                    <div class="btn-group dots_dropdown">'
            + '                        <button type="button" class="dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">'
            + '                            <i class="fas fa-ellipsis-v"></i>'
            + '                        </button>'
            + '                        <div class="dropdown-menu dropdown-menu-right shadow-lg">'
            //+ '                            <button class="dropdown-item" type="button" onclick="Ticket.Update(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')">'
            //+ '                                <i class="fa fa-edit"></i> Edit'
            //+ '                            </button>'

            //+ '                            <button class="dropdown-item" type="button" onclick="UserMaster.Delete(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')">'
            //+ '                                <i class="far fa-trash-alt"></i> Delete'
            //+ '                            </button>'
            + '                            <button class="dropdown-item" type="button" onclick="DashboardWorkList.View(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')">'
            + '                                <i class="far fa fa-eye"></i> View'
            + '                            </button>'
            + '                        </div>'
            + '                    </div>'
            + '                </td> '
            + '            </tr>'
            + '');
        tbody.innerHTML = tbody.innerHTML + RowHtml;
    }
    if (tbody == ClientAssignedToOthersListBody) {

    }
}

function DashboardWorkList_OnErrorCallBack(data) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

DashboardWorkList.AssignWorkItem = function (data) {
    let ticketdetails = JSON.parse(decodeURIComponent(data))
    console.log(ticketdetails)
    var body = document.getElementById(`AssignTo_${ticketdetails.ticketId}`)
    body.innerHTML = ''

   // userList = [1, 2, 3, 4]
    let ticketResolverList = DashboardWorkList.TicketResolverListObj;
    var dropdownHTML = '<select class="form-control rounded-pill btn-sm assignDropdownList_' + ticketdetails.ticketId + '" onchange="DashboardWorkList.onchange(' + ticketdetails.ticketId + ', this)">';
    var defaultOption = '<option value="0">Please Select...</option>'
    dropdownHTML += defaultOption
    for (let i = 0; i < ticketResolverList.tickets.length; i++) {
        dropdownHTML += `<option value="${ticketResolverList.tickets[i].userId}">${ticketResolverList.tickets[i].name}</option>`;
    }
    dropdownHTML += '</select>';

    body.innerHTML = dropdownHTML
}

DashboardWorkList.onchange = function (data) {
    var body = document.getElementsByClassName(`assignDropdownList_${data}`)[0].value
    console.log(data, body)
    var updateAssignedTo = {};
    updateAssignedTo.ticketId = data;
    updateAssignedTo.assignedToId = body;
    updateAssignedTo.ActionUser = User.UserId;
    Ajax.AuthPost("menus/GetTicketResolverList", updateAssignedTo, UpdatedTicketResolverList_OnSuccessCallBack, UpdatedTicketResolverList_OnErrorCallBack);
    DashboardWorkList.LoadAll();
}

function UpdatedTicketResolverList_OnSuccessCallBack(data) {

}
function UpdatedTicketResolverList_OnErrorCallBack(error) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

function TicketResolverList_OnSuccessCallBack(data) {
    //console.log(data.tickets.length);
    DashboardWorkList.TicketResolverListObj = data;
    //for (let i = 0; i < data.tickets.length; i++) {
    //    console.log(data.tickets[i].name);
    //}
   // console.log(DashboardWorkList.TicketResolverListObj.tickets);
}
function TicketResolverList_OnErrorCallBack(error) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

function DashboardWorkList_OnErrorCallBack(error) {
    Util.DisplayAutoCloseErrorPopUp("Error Occurred..", 1500);
}

//DashboardWorkList.CreateNew = function () {

//    var newDashboardWorkList = {};
//    newDashboardWorkList.TicketId = 0;
//    newDashboardWorkList.Title = document.getElementById("title").value;
//    newDashboardWorkList.TicketDesc = Ticket.InstructionsEditor.getPlainText()
//    newDashboardWorkList.TicketType = document.getElementById("ticketType").value;
//    newDashboardWorkList.Category = document.getElementById("category").value;
//    newDashboardWorkList.TagList = document.getElementById("tags").value;
//    newDashboardWorkList.TicketPriority = document.getElementById("priority").value;
//    newDashboardWorkList.AffectsCustomer = document.getElementById("affectsCustomer").value;
//    newDashboardWorkList.TargetDate = new Date(document.getElementById("targetDate").value);
//    newDashboardWorkList.ProjectId = document.getElementById("project").value;
//    newDashboardWorkList.ActionUser = User.UserId;
//    newDashboardWorkList.CompanyId = Ajax.CompanyId;
//    console.log(newDashboardWorkList.TargetDate);
//    Ajax.AuthPost("ticket/ManageTicket", newTicket, Ticket_OnSuccessCallBack, Ticket_OnErrorCallBack);

//}

DashboardWorkList.View = function (ticketData) {
    let ticketdetails = JSON.parse(decodeURIComponent(ticketData));
    TicketDetails.ticketId = ticketdetails.ticketId
    Navigation.LoadPage('/html/support/TicketDetails.html', 'TDDB');  
    
}

DashboardWorkList.TicketDetails = function () {

}
DashboardWorkList.ClearCRUDform = function () {

}
















