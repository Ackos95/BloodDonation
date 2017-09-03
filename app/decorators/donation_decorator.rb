class DonationDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def date_to_human
    object.timestamp.strftime("%H:%M %d.%m.%Y")
  end

  def status
    { 
      Donation::STATUS_FINISHED => "Uspešno izvršeno",
      Donation::STATUS_FAILED => "Promašen termin",
      Donation::STATUS_PENDING => (object.timestamp < DateTime.now ? "U obradi" : "Zakazan termin")
    }[object.status]
  end

  def blood_type_full
    object.user.decorate.blood_type
  end

  def user_name
    object.user.decorate.full_name
  end

end
