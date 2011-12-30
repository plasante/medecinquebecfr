module ApplicationHelper
  
  def title
    base_title = %(Medecin Quebec)
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def header
    if @header.nil?
      'Blank Header'
    else
      @header
    end
  end
  
  def footer
    if @footer.nil?
      'Blank Footer'
    else
      @footer
    end
  end
end
