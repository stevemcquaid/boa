$("#new_checkout").submit(function(e) {
  if($("#checkout_temp_id_card_number").val() == "") {
    $("#checkout_temp_id_card_number").focus();
    e.preventDefault();
    return false;
        
  } else if($("#checkout_tool_id").val() == "") {
    $("#checkout_tool_id").focus();
    e.preventDefault();
    return false;
  }
});