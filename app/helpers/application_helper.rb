# frozen_string_literal: true

module ApplicationHelper
  def title(*parts)
    return if parts.empty?

    content_for :title do
      (parts << 'TicketSystem').join(' - ')
    end
  end

  def flash_class(level)
    case level
    # User strings for levels, Symbols do not work
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-danger'
    end
  end
end
