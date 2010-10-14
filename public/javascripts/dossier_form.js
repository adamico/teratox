function calc1() {
  var dg_string = addDays(parseDate($('#dossier_ddr').val()), 14);
  var dap_string = addDays(parseDate($('#dossier_ddr').val()), 283);
  var ddr = parseDate($('#dossier_ddr').val());
  var dappel = parseDate($('#dossier_date_appel').val());

  if ($('#dossier_ddr').val() != "" && $('#dossier_date_appel').val() != ""){
    $('#dossier_dg').val(dg_string);
    $('#dossier_dap').val(dap_string);
    $('#dossier_sa').val(getSA(ddr, dappel));
  }
}

function calc2() {
  var dra = parseDate($('#dossier_dra').val());
  var ddr = parseDate($('#dossier_ddr').val());

  if ($('#dossier_dra').val() != "" && $('#dossier_ddr').val() != ""){
    $('#dossier_terme').val(getSA(ddr, dra));
   }
};

function getSA(startDate, endDate) {
  var start = startDate.getTime();
  var end = endDate.getTime();
  var days = (end - start) / (1000 * 60 * 60 * 24);
  var weeks = Math.round(days/7);
  return weeks;
};

function parseDate(strDate) {
  var strSep = "/"
  var dateArray = strDate.split(strSep);
  var theDate = new Date(dateArray[2], dateArray[1]-1, dateArray[0]);
  return theDate;
};

function addDays(objDate, days) {
  var strSep = "/"
  objDate.setDate(objDate.getDate() + days);
  var arrDate = new Array();
  arrDate.push(objDate.getDate(), objDate.getMonth()+1, objDate.getFullYear());
  return arrDate.join(strSep);
};

function reset() {
  $('#dossier_sa').val("");
  $('#dossier_ddr').val("");
  $('#dossier_dg').val("");
  $('#dossier_dap').val("");
};


// jsTree stuff
//

function log(string) {
  $("#log").append('<p>' + string + '</p>');
  $("#log").attr({ scrollTop: $("#log").attr("scrollHeight") });
}

function showTreeSelection() {
  var selection = $()
}

function setupTree(id, type) {
  var add_button_id = 'input[id=add_' + type + '_' + id + ']'
  var add_button_el = $(add_button_id);
  var tree_el = $("div[id=" + type + "_tree_" + id + "]") 
  addTree(tree_el)
  add_button_el.click(function() {
    tree_el.toggle()
  });
};

function addTree(element) {
  $(element).jstree({
    "core" : { "initially_open" : [ "root_1" ]},
    "html_data" : {
      "data" : "<li id='root_1'><a href='#'>Root node 1</a><ul><li><a href='#'>Child node</a></li></ul></li><li id='root_2'><a href='#'>Root node 2</a></li>"
    },
    "plugins" : [ "themes", "html_data", "ui"]
  });
};

$(function() {
  // tabs
  $("#tabs").tabs();
  // datepicker elements
  $("#dossier_ddr").datepicker() ;
  $("#dossier_dra").datepicker() ;
  $("#dossier_date_appel").datepicker() ;
  $("#dossier_date_naissance").datepicker({minDate: '-50y', maxDate: '-10y'});
  // autocomplete elements
  $("#dossier_correspondant_name").autocomplete({
    source: '/correspondants/names.js',
    minLength: 2
  });
  add_autocomplete();

  // grossesse calc
  $('#calc').click(function() {
    calc1();
  });
  $('#reset').click(function() {
    reset();
  });
  $('#calc2').click(function() {
    calc2();
  });
});

