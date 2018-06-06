module ProfilesHelper
  def submit_materialize(caption = 'Complete your profile')
    button_tag(type: 'submit', action: 'send', class: 'btn waves-effect waves-light') do
      content_tag(:i, class: 'material-icons right') do
        'send'
      end
      caption
    end
  end
end
