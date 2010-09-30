// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
};

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
};

function calc1() {
  //alert('function calc1() started!');
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

// datepicker
$.datepicker.setDefaults($.datepicker.regional['fr']);

$(function() {
  $("#dossier_ddr").datepicker() ;
  $("#dossier_date_appel").datepicker() ;
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

