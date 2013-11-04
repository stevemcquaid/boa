module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
    <button type="button" class="close" data-dismiss="alert">&#215;</button>
    #{messages}
    </div>
    HTML
    html.html_safe
  end

  def time(d)
    d.strftime("%I:%M%p")
  end

  def date(d)
    d.strftime("%m/%d/%y")
  end

  def date_and_time(d)
    [date(d), time(d)].compact.join(" ")
  end

  def format_boolean(bool)
    bool ? "Yes" : "No"
  end
end