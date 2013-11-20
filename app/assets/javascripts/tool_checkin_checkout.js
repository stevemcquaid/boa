$(document).ready(function() {
    $("#new_checkout").submit(function(e) {
        if($("#checkout_card_number").val() == "") {
          $("#checkout_card_number").focus();
          e.preventDefault();
          return false;
              
        } else if($("#checkout_tool_id").val() == "") {
          $("#checkout_tool_id").focus();
          e.preventDefault();
          return false;
        }
    });
});