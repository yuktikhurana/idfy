module MembersHelper
  def active_class_for_ethnicity(ethnicity = nil)
    'active' if params[:ethnicity] == ethnicity
  end

  def pagination_links
    current_page = (params[:page] || 1).to_i
    max = MemberService::MAX_PAGES 
    previous_page = (current_page - 1) >= 1 
    next_page = (current_page + 1) < max
    links = ''
    links += (content_tag(:li, class: "previous #{ 'disabled' unless previous_page }") do
      link_to("<span aria-hidden='true'>&larr;</span> Older".html_safe, root_path(ethnicity: params[:ethnicity], page: current_page - 1))
    end)
    links += (content_tag(:li, class: "next #{ 'disabled' unless next_page}") do
      link_to("Newer <span aria-hidden='true'>&rarr;</span>".html_safe, root_path(ethnicity: params[:ethnicity], page: current_page + 1))
    end)
    links.html_safe
  end

  def yes_no_icon(yes)
    yes ? 'ok' : 'remove'
  end

  def favourited?(member_id, favourites)
    member_id.to_i.in?(favourites)
  end
end
