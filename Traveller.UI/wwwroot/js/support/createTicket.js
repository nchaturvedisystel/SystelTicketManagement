var Support = new Object();







Support.BasepageOnReady = function () {
    Support.LoadAll()
}


Support.LoadAll = function () {
    console.log('Crate page loaded')
}


Support.OpenCreateTicketModal = function () {
    InstructionsEditor = new RichTextEditor("#TemplateInstEditor");
    $('#CreateTicketModal').modal('show');
}