# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  def pagination_results(collection, options = {})
    entry_name = options[:entry_name] ||
      (collection.empty?? 'résultat' : collection.first.class.name.underscore.sub('_', ' '))

    if collection.total_pages < 2
      case collection.size
      when 0; "Aucun #{entry_name}"
      when 1; "<b>1</b> #{entry_name}"
      else;   "<b>#{collection.size}</b> #{entry_name.pluralize} sont montrés"
      end
    else
        %{<b>%d&nbsp;-&nbsp;%d</b> sur <b>%d</b> #{entry_name.pluralize}} % [
          collection.offset + 1,
          collection.offset + collection.length,
          collection.total_entries
        ]
    end
  end
end
