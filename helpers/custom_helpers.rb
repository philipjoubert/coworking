module CustomHelpers

  # Formats the page <title>
  def page_title(title = nil)
    if title.nil?
      "Coworking spaces in Cape Town, Johannesburg and Durban"
    else
      "#{title} | #{app_name}"
    end
  end

  def custom_page_classes
    if content_for?(:pageClasses)
      page_classes + " " + yield_content(:pageClasses)
    end
  end

  def split_array(space)
    amenities = space.amenities.split(',')

    length = amenities.size

    if length.odd?
      length1 = (length-1) / 2
    else
      length1 = length / 2
    end

    length2 = length1 + 1

    group_one = amenities[0..length1]
    group_two = amenities[length2..length]

    return [group_one, group_two]
  end

end

