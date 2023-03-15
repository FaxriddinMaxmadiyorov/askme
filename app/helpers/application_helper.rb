module ApplicationHelper
  def inclination(count, few, many)
    return few if [0, 1].include? count

    many
  end

  
end
