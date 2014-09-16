$(document).ready(function(){
    $(".dates").datepicker({dateFormat : 'dd/mm/yy'});
    $("#new_task").click(function () {
        $("#panel_new_task").fadeIn(2000);
    });
    
    $("#save").click(function () {
        var form = $(this).parents("form");
        form.submit();
    });
    
    $(".message_send").click(function () {
        var $form = $(this).parents("form");
        comments = $(this).parents(".comments").find(".comment-render");
        $.post(baseUrl+'/sistema/tarefa/comentario', $form.serialize(), function(resp) {
            comments.fadeIn(2000).append(resp);
        });
        $(".message").val('');
        return false;
    });
    
    $("#delete-task").click(function() {
        $("#confirm-delete").fadeIn('2000');
        return false;
    });
    
});