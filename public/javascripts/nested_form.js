/* DO NOT MODIFY. This file was compiled Wed, 01 Jun 2011 14:56:23 GMT from
 * /home/ada/rails_projects/teratox/app/coffeescripts/nested_form.coffee
 */

(function() {
  jQuery(function() {
    $('form a.add_nested_fields').live('click', function() {
      var assoc, content, context, i, new_id, parent_ids, parent_names, regexp, _ref;
      assoc = $(this).attr('data-association');
      content = $("#" + assoc + "_fields_blueprint").html();
      context = ($(this).closest('.fields').find('input:first').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '');
      if (context) {
        parent_names = context.match(/[a-z_]+_attributes/g) || [];
        parent_ids = context.match(/(new_)?[0-9]+/g) || [];
        for (i = 0, _ref = parent_names.length; 0 <= _ref ? i <= _ref : i >= _ref; 0 <= _ref ? i++ : i--) {
          if (parent_ids[i]) {
            content = content.replace(new RegExp("(_" + parent_names[i] + ")_.+?_", 'g'), "$1_" + parent_ids[i] + "_");
            content = content.replace(new RegExp("(\\[" + parent_names[i] + "\\])\\[.+?\\]", 'g'), "$1[" + parent_ids[i] + "]");
          }
        }
      }
      regexp = new RegExp("new_" + assoc, 'g');
      new_id = new Date().getTime();
      content = content.replace(regexp, "new_" + new_id);
      $(this).before(content);
      $(this).closest("form").trigger('nested:fieldAdded');
      $(".produit_autocomplete").autocomplete({
        source: '/produits/names.js',
        minLength: 2
      });
      $(".malformation_autocomplete").autocomplete({
        source: '/malformations/libelles.js',
        minLength: 2
      });
      $(".pathologie_autocomplete").autocomplete({
        source: '/pathologies/libelles.js',
        minLength: 2
      });
      return false;
    });
    return $('form a.remove_nested_fields').live('click', function() {
      var hidden_field;
      hidden_field = $(this).prev('input[type=hidden]')[0];
      if (hidden_field) {
        hidden_field.value = '1';
      }
      $(this).closest('.fields').hide();
      $(this).closest("form").trigger('nested:fieldRemoved');
      return false;
    });
  });
}).call(this);
