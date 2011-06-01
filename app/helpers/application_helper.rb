# encoding: utf-8
module ApplicationHelper
  def search_results(collection, options = {})
    entry_name = options[:entry_name] ||
      (collection.empty? ?
        'résultat' :
        collection.first.class.name.underscore.sub('_', ' '))

    if collection.num_pages < 2
      case collection.length
      when 0; "Aucun #{entry_name}"
      when 1; "<b>1</b> #{entry_name}".html_safe
      else;   "<b>#{collection.length}</b> #{entry_name.pluralize} sont montrés".html_safe
      end
    else
        "Les #{entry_name.pluralize} #{collection.offset_value + 1} - #{collection.offset_value + collection.length} sur #{collection.total_count} sont montrés"
    end
  end
  def actions(instance)
    haml_tag 'ul.actions' do
      haml_tag :li do
        haml_concat(link_to t('actions.edit'), edit_polymorphic_path(instance))
      end
      haml_tag :li do
        haml_concat(link_to t('actions.destroy'), instance, :confirm => t('actions.confirm') , :method => :delete)
      end
    end
  end
end
