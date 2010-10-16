# encoding: utf-8
module ApplicationHelper
  # will_paginate custom methods
  def prev_and_next_item(ptext="préc.", sep=" ", ntext="succ.", pobject=@prev, nobject=@next, tag_options = {}, html_options = nil)
    haml_concat(link_to ptext, pobject, tag_options, html_options) if pobject
    haml_concat(sep)
    haml_concat(link_to ntext, nobject, tag_options, html_options) if nobject
  end
  def pagination_results(collection, options = {})
    entry_name = options[:entry_name] ||
      (
        collection.empty? ?
        'résultat' :
        collection.first.class.name.underscore.sub('_', ' ')
      )

    if collection.total_pages < 2
      case collection.size
      when 0; "Aucun #{entry_name}".html_safe
      when 1; "<b>1</b> #{entry_name}".html_safe
      else;   "<b>#{collection.size}</b> #{entry_name.pluralize} sont montrés".html_safe
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
