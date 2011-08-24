module ApplicationHelper
  def title
    !@title.nil? ? "Snailrazor - " + @title : "Snailrazor"
  end
end
