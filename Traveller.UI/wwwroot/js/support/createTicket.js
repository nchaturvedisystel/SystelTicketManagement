var Ticket = new Object();
Ticket.TicketId = 0
Ticket.Title = ""
Ticket.TicketDesc = ""
Ticket.TicketType = ""
Ticket.Category = ""
Ticket.TagList = ""
Ticket.AssignedTo = ""
Ticket.TicketStatus = ""
Ticket.TicketPriority = ""
Ticket.AffectsCustomer = ""
Ticket.AppVersion = ""
Ticket.DueDate = new Date()
Ticket.EstimatedDuration = ""
Ticket.ActualDuration = ""
Ticket.TargetDate = new Date()
Ticket.ResolutionDate = new Date()
Ticket.IsActive = 0
Ticket.IsDeleted = 0
Ticket.TicketOwner = ""
Ticket.ProjectId = 0
Ticket.CompanyId = 0
Ticket.CompanyName = ""
Ticket.ProjectName = ""
Ticket.ActionUser = 0


Ticket.BasepageOnReady = function () {
    Ticket.LoadAll()
}





Ticket.LoadAll = function () {
    console.log('Crate page loaded')
    Ticket.ActionUser = User.UserId
    Ajax.AuthPost("ticket/ManageTicket", Ticket, Ticket_OnSuccessCallBack, Ticket_OnErrorCallBack);
}





Ticket.OpenCreateTicketModal = function () {
    InstructionsEditor = new RichTextEditor("#TemplateInstEditor");
    $('#CreateTicketModal').modal('show');
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
            // + '                <td>' + ticketData[i].ticketStatus + '</td>'
            // + '                <td>' + ticketData[i].ticketOwner + '</td>'
            // + '                <td>' + ticketData[i].assignedTo + '</td>'
            + '                <td>' + ticketData[i].targetDate + '</td>'
            // + '                <td>' + ticketData[i].dueDate + '</td>'
            + '                <td>' + ticketData[i].createdOn + '</td>'
            + '                <td>' + ticketData[i].modifiedOn + '</td>'
            + '                <td class="text-center">'
            + '                    <div class="btn-group dots_dropdown">'
            + '                        <button type="button" class="dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">'
            + '                            <i class="fas fa-ellipsis-v"></i>'
            + '                        </button>'
            + '                        <div class="dropdown-menu dropdown-menu-right shadow-lg">'
            + '                            <button class="dropdown-item" type="button" onclick="UserMaster.Update(\'' + encodeURIComponent(JSON.stringify(ticketData[i])) + '\')">'
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
        retText = InstructionsEditor.getPlainText()
        Ticket.TicketId = 0
        Ticket.Title = document.getElementById("title").value
        Ticket.TicketDesc = retText
        Ticket.TicketType = document.getElementById("ticketType").value
        Ticket.Category = document.getElementById("category").value
        Ticket.TagList = document.getElementById("tags").value
        Ticket.TicketPriority = document.getElementById("priority").value
        Ticket.AffectsCustomer = document.getElementById("affectsCustomer").value
        Ticket.TargetDate = document.getElementById("targetDate").value
        // Ticket.DueDate = document.getElementById("dueDate").value
        // Ticket.EstimatedDuration = document.getElementById("estimatedDuration").value
        // Ticket.ActualDuration = document.getElementById("actualDuration").value  
        // Ticket.ResolutionDate = document.getElementById("resolutionDate").value
        // Ticket.AssignedTo = document.getElementById("assignedTo").value
        // Ticket.TicketOwner = '1'
        // Ticket.TicketStatus = document.getElementById("ticketStatus").value
        Ticket.IsActive = 1
        Ticket.IsDeleted = 0
        Ticket.ProjectId = document.getElementById("project").value
        Ticket.ActionUser = User.UserId
        // console.log(User)
         Ajax.AuthPost("ticket/ManageTicket", Ticket, Ticket_OnSuccessCallBack, Ticket_OnErrorCallBack);



    }



