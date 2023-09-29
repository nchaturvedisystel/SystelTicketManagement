var Ticket = new Object();

Ticket.ticketId = 0
Ticket.title = ""
Ticket.ticketDesc = ""
Ticket.ticketType = ""
Ticket.category = ""
Ticket.tagList = ""
Ticket.assignedTo = ""
Ticket.ticketStatus = ""
Ticket.ticketPriority = ""
Ticket.affectsCustomer = ""
Ticket.appVersion = ""
Ticket.dueDate = ""
Ticket.estimatedDuration = ""
Ticket.actualDuration = ""
Ticket.targetDate = ""
Ticket.resolutionDate = ""
Ticket.isActive = 0
Ticket.isDeleted = 0
Ticket.ticketOwner = ""
Ticket.projectId = 0
Ticket.companyId = 0
Ticket.companyName = ""
Ticket.projectName = ""
Ticket.actionUser = 0

// var TicketObject = {
//   ticketId: 0,
//   title: "string",
//   ticketDesc: "string",
//   ticketType: "string",
//   category: "string",
//   tagList: "string",
//   assignedTo: "string",
//   ticketStatus: "string",
//   ticketPriority: "string",
//   affectsCustomer: "string",
//   appVersion: "string",
//   dueDate: "2023-09-29T10:35:19.724Z",
//   estimatedDuration: "string",
//   actualDuration: "string",
//   targetDate: "2023-09-29T10:35:19.724Z",
//   resolutionDate: "2023-09-29T10:35:19.724Z",
//   isActive: 0,
//   isDeleted: 0,
//   ticketOwner: "string",
//   projectId: 0,
//   companyId: 0,
//   companyName: "string",
//   projectName: "string",
//   actionUser: 0
// }







Ticket.BasepageOnReady = function () {
    Ticket.LoadAll()
}


Ticket.LoadAll = function () {
    console.log('Crate page loaded')
    Ticket.actionUser = User.userId
    Ajax.AuthPost("ticket/ManageTicket", Ticket, Ticket_OnSuccessCallBack, Ticket_OnErrorCallBack);
}


Ticket.OpenCreateTicketModal = function () {
    InstructionsEditor = new RichTextEditor("#TemplateInstEditor");
    $('#CreateTicketModal').modal('show');
}

function Ticket_OnSuccessCallBack(data) {
    console.log(data);
}

function Ticket_OnErrorCallBack(data) {
    console.error(data)
}




            