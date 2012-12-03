module ApplicationHelper
  def title
    !@title.nil? ? "Snailrazor - " + @title : "Snailrazor"
  end

  def pretty_date(date)
    case date.day
    when 1, 21, 31
      append = "st"
    when 2, 22
      append = "nd"
    when 3, 23
      append = "rd"
    else
      append = "th"
    end

    date.strftime("The %-d#{append} of %B, %Y")
  end
end
