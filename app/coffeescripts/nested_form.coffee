jQuery ->
  $('form a.add_nested_fields').live 'click', ->
    # Setup
    assoc   = $(this).attr('data-association')       # Name of child
    content = $("##{assoc}_fields_blueprint").html() # Fields template

    # Make the context correct by replacing new_<parents> with the generated ID
    # of each of the parent objects
    context = ($(this).closest('.fields').find('input:first').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '')

    # context will be something like this for a brand new form:
    # project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
    # or for an edit form:
    # project[tasks_attributes][0][assignments_attributes][1]
    if context
      parent_names = context.match(/[a-z_]+_attributes/g) || []
      parent_ids   = context.match(/(new_)?[0-9]+/g) || []

      for i in [0..parent_names.length]
        if parent_ids[i]
          content = content.replace new RegExp("(_#{parent_names[i]})_.+?_", 'g'),
            "$1_#{parent_ids[i]}_"
          content = content.replace new RegExp("(\\[#{parent_names[i]}\\])\\[.+?\\]", 'g'),
            "$1[#{parent_ids[i]}]"

    # Make a unique ID for the new child
    regexp  = new RegExp("new_#{assoc}", 'g')
    new_id  = new Date().getTime()
    content = content.replace(regexp, "new_#{new_id}")

    $(this).before(content)
    $(this).closest("form").trigger('nested:fieldAdded')
    $(".produit_autocomplete").autocomplete({
      source: '/produits/names.js',
      minLength: 2
    })
    $(".malformation_autocomplete").autocomplete({
      source: '/malformations/libelles.js',
      minLength: 2
    })
    $(".pathologie_autocomplete").autocomplete({
      source: '/pathologies/libelles.js',
      minLength: 2
    })
    return false

  $('form a.remove_nested_fields').live 'click', ->
    hidden_field = $(this).prev('input[type=hidden]')[0]
    if hidden_field then hidden_field.value = '1'
    $(this).closest('.fields').hide()
    $(this).closest("form").trigger('nested:fieldRemoved')
    return false
