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
};

function addSelected(tree_element, id, type) {
  var $selection = tree_element.jstree("get_selected");
  var malf_names_list = new Array();
  var malf_ids_list = new Array();
  $selection.each(function(index) {
    malf_names_list.push($(this).text().trim());
    malf_ids_list.push(this.id);
  });
  log('adding the following malformations:');
  log('names: ' + malf_names_list.join(', '));
  log('ids: ' + malf_ids_list);
  $("#malformation_list_" + id).text(malf_names_list.join(', '));
  $("#dossier_bebes_attributes_" + id + "_" + type + "_ids").val(malf_ids_list.join(', '));
};

function setupTree(id, type) {
  var $show_button =       $("input[id=show_" + type + "_" + id + "]");
  var $add_button =        $("input[id=add_"  + type + "_" + id + "]")
  var $container_div =     $("div[id=" + type + "_" + id + "]");
  var $tree_div =              $("div[id=" + type + "_tree_" + id + "]") ;
  addTree($tree_div); //binds tree to its div
  $show_button.click(function() {
    $container_div.toggle()
  });
  $add_button.click(function() {
    addSelected($tree_div, id, type);
  });
};

function addTree(element) {
  $(element).jstree({
    "json_data" : {
      "ajax" : {
        "url" : "/malformations.json",
        "data" : function (node) {
          return { parent_id : node.attr ? node.attr("id") : 0 };
        }
      }
    },
    // "core" : { "initially_open" : [ "root_1" ]},
    // "html_data" : {
    //   "data" : "<li id='root_1'><a href='#'>Root node 1</a><ul><li><a href='#'>Child node</a></li></ul></li><li id='root_2'><a href='#'>Root node 2</a></li>"
    // },
    "plugins" : [ "themes", "json_data", "ui"]
  });
};


function loadExistingTrees(type) {
  $show_buttons = $('input[id*=show_' + type + ']')
  $add_buttons = $('input[id*=add_' + type + ']')
  $container_divs = $('div[id*=' + type + ']')
  $tree_divs = $('div[id*=' + type + '_tree]')
  $tree_divs.each(function () {
    addTree(this);
  });

  // bind open container for tree toggle to show buttons
  $show_buttons.each(function(index) {
    $(this).click(function() {
      $($container_divs[index]).toggle();
    });
  });

  // bind open container for tree toggle to show buttons
  $add_buttons.each(function(index) {
    $(this).click(function() {
      full_id = this.id.split('_');
      id = full_id[2];
      addSelected($($tree_divs[index]), id, type);
    });
  });
};

function add_produit_autocomplete() {
  $(".produit_autocomplete").autocomplete({
    source: '/produits/names.js',
    minLength: 2
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

  $(".produit_autocomplete").autocomplete({
    source: '/produits/names.js',
    minLength: 2
  });
  add_produit_autocomplete();

  //loadExistingTrees("malformation");

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
