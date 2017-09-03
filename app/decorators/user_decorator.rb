class UserDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def donation_number
    "##{object.number_of_donations} donacija"
  end

  def blood_type
    "#{stringify_blood_type(object)}#{stringify_rh(object)}"
  end

  def blood_type_full
    "Krvna grupa: #{blood_type}"
  end

  def birth_date
    object.birth_date.strftime("%d. %m. %Y.")
  end

  def birth_date_full
    "Datum rodjenja: #{birth_date}"
  end

  def registered_since
    object.created_at.strftime("%d. %m. %Y.")
  end

  private

  def stringify_blood_type(obj)
    case obj.blood_type
    when User::BLOOD_TYPE_A
      'A'
    when User::BLOOD_TYPE_B
      'B'
    when User::BLOOD_TYPE_AB
      'AB'
    else
      '0'
    end
  end

  def stringify_rh(obj)
    obj.rh ? '+' : '-'
  end

end
