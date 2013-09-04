//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree ./admin
//= require ckeditor/init

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parent().hide();
}


function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    content = content.replace(regexp, new_id);
    $(content).insertBefore($(link));
}
