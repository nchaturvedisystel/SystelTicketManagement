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
}


//DashboardWorkList.OpenCreateTicketModal = function () {
//    if (DashboardWorkList.InstructionsEditorLoaded == 0) {
//        DashboardWorkList.InstructionsEditor = new RichTextEditor("#TemplateInstEditor");
//        DashboardWorkList.InstructionsEditorLoaded = 1;
//    }
//    $('#CreateTicketModal').modal('show');
//}

//Date.prototype.addDays = function (days) {
//    var date = new Date(this.valueOf());
//    date.setDate(date.getDate() + days);
//    return date;
//}

function DashboardWorkList_OnSuccessCallBack(data) {
    //$('#CreateTicketModal').modal('hide');

    var ClientWorkInProgressData = data.workInProgress;
    var ClientAssignedToMeData = data.assignedToMe;
    var ClientOpenTicketsData = data.openTickets;
    var ClientClosedTicketsData = data.closedTickets;

    

    var ClientWorkInProgressListBody = document.getElementById('ClientWorkInProgressListBody');
    var ClientAssignedToMeListBody = document.getElementById('ClientAssignedToMeListBody');
    var ClientOpenTicketsListBody = document.getElementById('ClientOpenTicketsListBody');
    var ClientClosedTicketsListBody = document.getElementById('ClientClosedTicketsListBody');

    ClientWorkInProgressListBody.innerHTML = "";
    ClientAssignedToMeListBody.innerHTML = "";
    ClientOpenTicketsListBody.innerHTML = "";
    ClientClosedTicketsListBody.innerHTML = "";

    DashboardWorkList.BindClientUserTicketList(ClientWorkInProgressListBody, ClientWorkInProgressData);
    DashboardWorkList.BindClientUserTicketList(ClientAssignedToMeListBody, ClientAssignedToMeData);
    DashboardWorkList.BindClientUserTicketList(ClientOpenTicketsListBody, ClientOpenTicketsData);
    DashboardWorkList.BindClientUserTicketList(ClientClosedTicketsListBody, ClientClosedTicketsData);
}

DashboardWorkList.BindClientUserTicketList = function (tbody, ticketData) {
    for (var i = 0; i < ticketData.length; i++) {
        var RowHtml = ('<tr>'
            + '                <td class="dtr-control sorting_1" style="border-left: 5px solid #' + Util.WCColors[i] + ';">' + ticketData[i].ticketId + '</td>'
            + '                <td>' + ticketData[i].companyName + '</td>'
            + '                <td>' + ticketData[i].projectName + '</td>'
            + '                <td>' + ticketData[i].assignedToName + '</td>'
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
}

function DashboardWorkList_OnErrorCallBack(data) {
    console.error(data);
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
    DashboardWorkList = JSON.parse(decodeURIComponent(ticketData));
    
    console.log("view");
}     

    
    

DashboardWorkList.ClearCRUDform = function () {

}
















