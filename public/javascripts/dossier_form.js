function calc1() {
  dg_string = addDays(parseDate($('#dossier_ddr').val()), 14);
  dap_string = addDays(parseDate($('#dossier_ddr').val()), 283);
  ddr = parseDate($('#dossier_ddr').val());
  dappel = parseDate($('#dossier_date_appel').val());

  if ($('#dossier_ddr').val() != "" && $('#dossier_date_appel').val() != ""){
    $('#dossier_dg').val(dg_string);
    $('#dossier_dap').val(dap_string);
    $('#dossier_sa').val(getSA(ddr, dappel));
  }
}

function calc2() {
  dra = parseDate($('#dossier_dra').val());
  ddr = parseDate($('#dossier_ddr').val());

  if ($('#dossier_dra').val() != "" && $('#dossier_ddr').val() != ""){
    $('#dossier_terme').val(getSA(ddr, dra));
   }
};

function getSA(startDate, endDate) {
  start = startDate.getTime();
  end = endDate.getTime();
  days = (end - start) / (1000 * 60 * 60 * 24);
  weeks = Math.round(days/7);
  return weeks;
};

function parseDate(strDate) {
  strSep = "/"
  dateArray = strDate.split(strSep);
  date = new Date(dateArray[2], dateArray[1]-1, dateArray[0]);
  return date;
};

function addDays(objDate, days) {
  strSep = "/"
  objDate.setDate(objDate.getDate() + days);
  arrDate = new Array();
  arrDate.push(objDate.getDate(), objDate.getMonth()+1, objDate.getFullYear());
  return arrDate.join(strSep);
};

function reset() {
  $('#dossier_sa').val("");
  $('#dossier_ddr').val("");
  $('#dossier_dg').val("");
  $('#dossier_dap').val("");
};

function divForTree(id, type) {
  target_id = 'input[id$=' + id + '_' + type + ']'
  target_el = $(target_id)
  html = "<div id='" + type + "_tree_" + id + "'></div>"
  target_el.closest('.fields').append(html);
};

function openTree(id, type) {
  // jsTree
  target = "#" + type + "_tree_" + id
  //console.log("target = " + target)
  $(target).jstree({
    "core" : { "initially_open" : [ "root_1" ]},
    "html_data" : {
      "data" : "<li id='root_1'><a href='#'>Root node 1</a><ul><li><a href='#'>Child node</a></li></ul></li><li id='root_2'><a href='#'>Root node 2</a></li>"
    },
    "plugins" : [ "themes", "html_data", "ui"]
  });
};

function bindOpenTree(id, type) {
  //console.log("id = " + id);
  //console.log("type = " + type);
  target_id = 'input[id$=' + id + '_' + type + ']'
  target_el = $(target_id);
  target_el.click(function() {
    openTree(id, type)
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


