var Support = new Object();
var InstructionsEditor;
Support.BasepageOnReady = function () {
    try {
        InstructionsEditor = new RichTextEditor("#TemplateInstEditor");
        $('#WorkflowInstructionsModal').modal('show');
    }
    catch (ex) {
        alert(ex);
    }
}