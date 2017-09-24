$(function() {
    $('.enlarge-pic').click(function (e) {
        e.preventDefault();
        $('#PicModalTitle').text($(this).data('key'));
        $('#PicModalImg').attr('src', $(this).data('url'));
        $('#PicModal').modal();
    });
});