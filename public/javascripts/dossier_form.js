/* DO NOT MODIFY. This file was compiled Wed, 01 Jun 2011 14:48:48 GMT from
 * /home/ada/rails_projects/teratox/app/coffeescripts/dossier_form.coffee
 */

(function() {
  var addDays, addSelected, addTree, add_malformation_autocomplete, add_pathologie_autocomplete, add_produit_autocomplete, assignDivToggle, assign_calcGrosAnt, calc1, calc2, calcGrosAnt, getSA, log, parseDate, reset, setupTree;
  calc1 = function() {
    var dap_string, dappel, ddr, dg_string;
    dg_string = addDays(parseDate($('#dossier_ddr').val()), 14);
    dap_string = addDays(parseDate($('#dossier_ddr').val()), 283);
    ddr = parseDate($('#dossier_ddr').val());
    dappel = parseDate($('#dossier_date_appel').val());
    if ($('#dossier_ddr').val() !== "" && $('#dossier_date_appel').val() !== "") {
      $('#dossier_dg').val(dg_string);
      $('#dossier_dap').val(dap_string);
      return $('#dossier_sa').val(getSA(ddr, dappel));
    }
  };
  calc2 = function() {
    var ddr, dra;
    dra = parseDate($('#dossier_dra').val());
    ddr = parseDate($('#dossier_ddr').val());
    if ($('#dossier_dra').val() !== "" && $('#dossier_ddr').val() !== "") {
      return $('#dossier_terme').val(getSA(ddr, dra));
    }
  };
  getSA = function(startDate, endDate) {
    var days, end, start;
    start = startDate.getTime();
    end = endDate.getTime();
    days = (end - start) / (1000 * 60 * 60 * 24);
    return Math.round(days / 7);
  };
  parseDate = function(strDate) {
    var dateArray, strSep, theDate;
    strSep = "/";
    dateArray = strDate.split(strSep);
    theDate = new Date(dateArray[2], dateArray[1] - 1, dateArray[0]);
    return theDate;
  };
  addDays = function(objDate, days) {
    var arrDate, strSep;
    strSep = "/";
    objDate.setDate(objDate.getDate() + days);
    arrDate = new Array();
    arrDate.push(objDate.getDate(), objDate.getMonth() + 1, objDate.getFullYear());
    return arrDate.join(strSep);
  };
  reset = function() {
    $('#dossier_sa').val("");
    $('#dossier_ddr').val("");
    $('#dossier_dg').val("");
    return $('#dossier_dap').val("");
  };
  log = function(string) {
    $("#log").append("<p>" + string + "</p>");
    return $("#log").attr({
      scrollTop: $("#log").attr("scrollHeight")
    });
  };
  addSelected = function(tree_element, id, type) {
    var $selection, malf_ids_list, malf_names_list;
    $selection = tree_element.jstree("get_selected");
    malf_names_list = new Array();
    malf_ids_list = new Array();
    $selection.each(function() {
      malf_names_list.push($(this).text().trim());
      return malf_ids_list.push(this.id);
    });
    log("adding the following malformations:");
    log("names: " + (malf_names_list.join(', ')));
    log("ids: " + malf_ids_list);
    $("#malformation_list_" + id).text(malf_names_list.join(', '));
    return $("#dossier_bebes_attributes_" + id + "_" + type + "_ids").val(malf_ids_list.join(', '));
  };
  setupTree = function(id, type) {
    var $add_button, $container_div, $show_button, $tree_div;
    $show_button = $("input[id=show_" + type + "_" + id + "]");
    $add_button = $("input[id=add_" + type + "_" + id + "]");
    $container_div = $("div[id=" + type + "_" + id + "]");
    $tree_div = $("div[id=" + type + "_tree_" + id + "]");
    addTree($tree_div);
    $show_button.click(function() {
      return $container_div.toggle();
    });
    return $add_button.click(function() {
      return addSelected($tree_div, id, type);
    });
  };
  addTree = function(type) {
    var $element, json_data;
    $element = $("#" + type);
    json_data = {
      "json_data": {
        "ajax": {
          "url": "/" + type + ".json",
          "data": function(node) {
            return {
              parent_id: node.attr ? node.attr("id") : 0
            };
          }
        }
      },
      "plugins": ["themes", "json_data", "ui"]
    };
    return $element.bind("loaded.jstree", function(event, data) {
      return console.log("tree#" + ($(this).attr('id')) + " is loaded");
    }).jstree(json_data);
  };
  add_produit_autocomplete = function() {
    return $(".produit_autocomplete").autocomplete({
      source: '/produits/names.js',
      minLength: 2
    });
  };
  add_malformation_autocomplete = function() {
    return $(".malformation_autocomplete").autocomplete({
      source: '/malformations/libelles.js',
      minLength: 2
    });
  };
  add_pathologie_autocomplete = function() {
    return $(".pathologie_autocomplete").autocomplete({
      source: '/pathologies/libelles.js',
      minLength: 2
    });
  };
  assignDivToggle = function(element, message) {
    return (function(element, message) {
      element.toggle();
      return console.log(message);
    })(element, message);
  };
  calcGrosAnt = function() {
    var sum;
    sum = 0;
    $.each(['fcs', 'geu', 'miu', 'ivg', 'img', 'nai'], function(index, val) {
      var $atcd;
      $atcd = $("#dossier_" + val);
      return sum += new Number($atcd.val());
    });
    return $('th#grsant').text(sum);
  };
  assign_calcGrosAnt = function() {
    return $('table.grsant input').bind('change', function(event) {
      return calcGrosAnt();
    });
  };
  jQuery(function() {
    $.each(['malformations', 'pathologies'], function(index, val) {
      var $button;
      addTree(val);
      $button = $("#show_" + val + "_tree");
      return $button.bind('click', function(event) {
        return assignDivToggle($("#" + val), "clicked button#" + ($button.attr('id')));
      });
    });
    $("#tabs").tabs();
    $("#dossier_ddr").datepicker();
    $("#dossier_dra").datepicker();
    $("#dossier_date_appel").datepicker();
    $("#dossier_date_naissance").datepicker({
      minDate: '-50y',
      maxDate: '-10y'
    });
    $("#dossier_correspondant_name").autocomplete({
      source: '/correspondants/names.js',
      minLength: 2
    });
    $(".produit_autocomplete").autocomplete({
      source: '/produits/names.js',
      minLength: 2
    });
    add_produit_autocomplete();
    add_malformation_autocomplete();
    add_pathologie_autocomplete();
    calcGrosAnt();
    assign_calcGrosAnt();
    $('#calc').bind('click', function(event) {
      return calc1();
    });
    $('#reset').bind('click', function(event) {
      return reset();
    });
    return $('#calc2').bind('click', function(event) {
      return calc2();
    });
  });
}).call(this);
