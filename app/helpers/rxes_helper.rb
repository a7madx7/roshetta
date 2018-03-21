module RxesHelper
  def rx_column_names
    if Rails.env.development?
      content_tag(:ul, class: "list") do
        Rx.column_names.collect do |column|
          concat(content_tag(:li, id: column.gsub(' ', '_').downcase.strip) do
           column
          end)
        end
     end
    end
  end
end
