module ApplicationHelper
  def title
    !@title.nil? ? "Snailrazor - " + @title : "Snailrazor"
  end

  def pretty_date(date)
    date.strftime("%d. %B %Y")
  end
end
