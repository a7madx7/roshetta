module ApplicationHelper
  def model_column_names(model)
    if Rails.env.development?
      content_tag(:ul, class: "list") do
        model.column_names.collect do |column|
          concat(content_tag(:li, id: column.gsub(' ', '_').downcase.strip) do
           column
          end)
        end
     end
    end
  end

   def library(title, xAxis, yAxis)
    {
          backgroundColor: 'transparent',
          title: {text: title, x: -20},
          yAxis: {
            allowDecimals: false,
            title: {
                text: yAxis
            }
          },
          xAxis: {
            title: {
                text: xAxis
            }
          }
    }
  end
end
