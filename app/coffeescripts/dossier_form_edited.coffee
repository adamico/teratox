calc1 = ->
  dg_string = addDays(parseDate($('#dossier_ddr').val()), 14)
  dap_string = addDays(parseDate($('#dossier_ddr').val()), 283)
  ddr = parseDate($('#dossier_ddr').val())
  dappel = parseDate($('#dossier_date_appel').val())

  # ensure fields ddr and date_appel are not empty
  if ($('#dossier_ddr').val() isnt "" and $('#dossier_date_appel').val() isnt "")
    $('#dossier_dg').val(dg_string)
    $('#dossier_dap').val(dap_string)
    $('#dossier_sa').val(getSA(ddr, dappel))

calc2 = ->
  dra = parseDate($('#dossier_dra').val())
  ddr = parseDate($('#dossier_ddr').val())

  # ensure fields dra and ddr are not empty
  if ($('#dossier_dra').val() isnt "" and $('#dossier_ddr').val() isnt "")
    $('#dossier_terme').val(getSA(ddr, dra))

getSA = (startDate, endDate) ->
  start = startDate.getTime()
  end = endDate.getTime()
  days = (end - start) / (1000 * 60 * 60 * 24)
  Math.round(days/7)

parseDate = (strDate) ->
  strSep = "/"
  dateArray = strDate.split(strSep)
  theDate = new Date(dateArray[2], dateArray[1]-1, dateArray[0])
  return theDate

addDays = (objDate, days) ->
  strSep = "/"
  # add days to date object
  objDate.setDate(objDate.getDate() + days)
  # parse string for the modified date object
  arrDate = new Array()
  arrDate.push(objDate.getDate(), objDate.getMonth()+1, objDate.getFullYear())
  arrDate.join(strSep)

# reset sa calculation fields
reset = ->
  $('#dossier_sa').val("")
  $('#dossier_ddr').val("")
  $('#dossier_dg').val("")
  $('#dossier_dap').val("")

# jsTree stuff
#
# logging
log = (string) ->
  $("#log").append("<p>#{string}</p>")
  $("#log").attr({ scrollTop: $("#log").attr("scrollHeight") })

addSelected = (tree_element, id, type) ->
  $selection = tree_element.jstree("get_selected")
  malf_names_list = new Array()
  malf_ids_list = new Array()
  $selection.each ->
    malf_names_list.push($(this).text().trim())
    malf_ids_list.push(this.id)

  log("adding the following malformations:")
  log("names: #{malf_names_list.join(', ')}")
  log("ids: #{malf_ids_list}")

  $("#malformation_list_#{id}").text(malf_names_list.join(', '))
  $("#dossier_bebes_attributes_#{id}_#{type}_ids").val(malf_ids_list.join(', '))

setupTree = (id, type) ->
  $show_button = $("input[id=show_#{type}_#{id}]")
  $add_button = $("input[id=add_#{type}_#{id}]")
  $container_div = $("div[id=#{type}_#{id}]")
  $tree_div = $("div[id=#{type}_tree_#{id}]")
  addTree($tree_div) #binds tree to its div
  $show_button.click -> $container_div.toggle()
  $add_button.click -> addSelected($tree_div, id, type)

addTree = (type) ->
  $element = $("##{type}")
  json_data =
    "json_data" :
      "ajax" :
        "url" : "/#{type}.json"
        "data" : (node) ->
          {parent_id : if node.attr then node.attr("id") else 0}
    "plugins" : ["themes", "json_data", "ui"]

  $element
    .bind "loaded.jstree", (event, data) ->
      console.log("tree##{$(this).attr('id')} is loaded")
    .jstree(json_data)

# autocomplete fields

add_produit_autocomplete = ->
  $(".produit_autocomplete").autocomplete({
    source: '/produits/names.js',
    minLength: 2
  })

add_malformation_autocomplete = ->
  $(".malformation_autocomplete").autocomplete({
    source: '/malformations/libelles.js',
    minLength: 2
  })

add_pathologie_autocomplete = ->
  $(".pathologie_autocomplete").autocomplete({
    source: '/pathologies/libelles.js',
    minLength: 2
  })

assignDivToggle = (element, message) ->
  do (element, message) ->
    element.toggle()
    console.log(message)

calcGrosAnt = ->
  sum = 0
  # sum the values from fcs, geu, miu, ivg, img, nai fields
  $.each(['fcs', 'geu', 'miu', 'ivg', 'img', 'nai'], (index, val) ->
    $atcd = $("#dossier_#{val}")
    sum += new Number($atcd.val())
  )
  # assign the result to th#grsant
  $('th#grsant').text(sum)

assign_calcGrosAnt = ->
  $('table.grsant input').bind 'change', (event) -> calcGrosAnt()

$ ->
  # malformations/pathologies tree
  $.each ['malformations', 'pathologies'], (index, val) ->
    addTree(val)
    $button = $("#show_#{val}_tree")
    $button.bind 'click', (event) -> 
      assignDivToggle($("##{val}"), "clicked button##{$button.attr('id')}")

  # tabs
  $("#tabs").tabs()

  # datepicker elements
  $("#dossier_ddr").datepicker()
  $("#dossier_dra").datepicker()
  $("#dossier_date_appel").datepicker()
  $("#dossier_date_naissance").datepicker {minDate: '-50y', maxDate: '-10y'}

  # autocomplete elements
  $("#dossier_correspondant_name").autocomplete({
    source: '/correspondants/names.js',
    minLength: 2
  })

  $(".produit_autocomplete").autocomplete({
    source: '/produits/names.js',
    minLength: 2
  })
  add_produit_autocomplete()
  add_malformation_autocomplete()
  add_malformation_autocomplete()
  calcGrosAnt()
  assign_calcGrosAnt()

  # grossesse calc
  $('#calc').bind 'click', (event) -> calc1()
  $('#reset').bind 'click', (event) -> reset()
  $('#calc2').bind 'click', (event) -> calc2()
