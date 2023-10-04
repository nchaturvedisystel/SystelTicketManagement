var Ticket = new Object();
Ticket.TicketId = 0;
Ticket.Title = "";
Ticket.TicketDesc = "";
Ticket.TicketType = "";
Ticket.Category = "";
Ticket.TagList = "";
Ticket.AssignedTo = "";
Ticket.TicketStatus = "";
Ticket.TicketPriority = "";
Ticket.AffectsCustomer = "";
Ticket.AppVersion = "";
Ticket.DueDate = new Date();
Ticket.EstimatedDuration = "";
Ticket.ActualDuration = "";
Ticket.TargetDate = new Date();
Ticket.ResolutionDate = new Date();
Ticket.IsActive = 0;
Ticket.IsDeleted = 0;
Ticket.TicketOwner = "";
Ticket.ProjectId = 0;
Ticket.CompanyId = 0;
Ticket.CompanyName = "";
Ticket.ProjectName = "";
Ticket.ActionUser = 0;
Ticket.InstructionsEditorLoaded = 0;
Ticket.InstructionsEditor;


Ticket.BasepageOnReady = function () {
    Ticket.LoadAll();
}





Ticket.LoadAll = function () {
    Ticket.ClearCRUDform();
    console.log('Crate page loaded');
    Ticket.ActionUser = User.UserId;
    Ajax.AuthPost("ticket/ManageTicket", Ticket, Ticket_OnSuccessCallBack, Ticket_OnErrorCallBack);
}


Ticket.OpenCreateTicketModal = function () {
    if (Ticket.InstructionsEditorLoaded == 0) {
        Ticket.InstructionsEditor = new RichTextEditor("#TemplateInstEditor");
        Ticket.InstructionsEditorLoaded = 1;
    }
    $('#CreateTicketModal').modal('show');

    //SetTargetDate = Today+3Days    
    var defaultTargetDate = new Date();
    defaultTargetDate = defaultTargetDate.addDays(3);

    var day = ("0" + defaultTargetDate.getDate()).slice(-2);
    var month = ("0" + (defaultTargetDate.getMonth() + 1)).slice(-2);
    var defaultTargetDate = defaultTargetDate.getFullYear() + "-" + (month) + "-" + (day);

    $('#targetDate').val(defaultTargetDate);
}

Date.prototype.addDays = function (days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

function Ticket_OnSuccessCallBack(data) {
    $('#CreateTicketModal').modal('hide');
    let ticketData = data.tickets
    var body = document.getElementById('TemplateListBody')
    body.innerHTML = "";
    console.log(ticketData);
    for (var i = 0; i < ticketData.length; i++) {
        var RowHtml = ('<tr>'
            + '                <td class="dtr-control sorting_1" style="border-left: 5px solid #' + Util.WCColors[i] + ';">' + ticketData[i].ticketId + '</td>'
            + '                <td>' + ticketData[i].projectId + '</td>'
            + '                <td>' + ticketData[i].title + '</td>'
            + '                <td>' + ticketData[i].targetDate + '</td>'
            + '                <td>' + ticketData[i].createdOn + '</td>'
            + '                <td>' + ticketData[i].modifiedOn + '</td>'
            + '                <td class="text-center">'
            + '                    <div class="btn-group dots_dropdown">'
            + '                        <button type="button" class="dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">'
            + '                            <i class="fas fa-ellipsis-v"></i>'
            + '                        </button>'
            + '                        <div class="dropdown-menu dropdown-menu-right shadow-lg">'
            + '                            <button class="dropdown-item" type="button" onclick="Ticket.Update(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')">'
            + '                                <i class="fa fa-edit"></i> Edit'
            + '                            </button>'
            + '                            <button class="dropdown-item" type="button" onclick="UserMaster.Delete(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')">'
            + '                                <i class="far fa-trash-alt"></i> Delete'
            + '                            </button>'
            + '                            <button class="dropdown-item" type="button" onclick="UserWorkCenter.AssignWorkcenter(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')" >'
            + '                                <i class="fa fa-sign-in-alt"></i> Assign Workcenter'
            + '                            </button>'
            + '                            <button class="dropdown-item" type="button" onclick="UserRole.AssignRole(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')" >'
            + '                                <i class="fa fa-plus"></i> Assign Role'
            + '                            </button>'
            + '                        </div>'
            + '                    </div>'
            + '                </td> '
            + '            </tr>'
            + '');


        body.innerHTML = body.innerHTML + RowHtml;
    }
}


function Ticket_OnErrorCallBack(data) {
    console.error(data)
}
Ticket.CreateNew = function () {

    var newTicket = {};
    newTicket.TicketId = 0;
    newTicket.Title = document.getElementById("title").value;
    newTicket.TicketDesc = Ticket.InstructionsEditor.getPlainText()
    newTicket.TicketType = document.getElementById("ticketType").value;
    newTicket.Category = document.getElementById("category").value;
    newTicket.TagList = document.getElementById("tags").value;
    newTicket.TicketPriority = document.getElementById("priority").value;
    newTicket.AffectsCustomer = document.getElementById("affectsCustomer").value;
    newTicket.TargetDate = new Date(document.getElementById("targetDate").value);
    newTicket.ProjectId = document.getElementById("project").value;
    newTicket.ActionUser = User.UserId;
    newTicket.CompanyId = Ajax.CompanyId;
    
    // Perform validation
    var ValidationMsg = " Please provide ";
    ValidationMsg += (newTicket.Title.trim() === '') ? " Title," : '';
    ValidationMsg += (newTicket.Category.trim() === '') ? " Category," : '';
    ValidationMsg += (newTicket.TicketPriority.trim() === '') ? " Priority," : '';
    ValidationMsg += (newTicket.TicketType.trim() === '') ? " Type," : '';
    ValidationMsg += (newTicket.TagList.trim() === '') ? " Tag," : '';

    if (ValidationMsg.trim() != "Please provide") {
        alert(ValidationMsg);
    }
    else {
        Ajax.AuthPost("ticket/ManageTicket", newTicket, Ticket_OnSuccessCallBack, Ticket_OnErrorCallBack);
    }
}

Ticket.ClearCRUDform = function () {
   
}
