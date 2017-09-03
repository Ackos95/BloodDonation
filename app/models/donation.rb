class Donation < ApplicationRecord

  validate :new_validation_can_not_be_in_past
  validate :new_validation_must_be_in_work_hours
  validate :new_donation_must_be_in_free_schedule

  STATUS_FINISHED = 0.freeze
  STATUS_FAILED = 1.freeze
  STATUS_PENDING = 2.freeze

  belongs_to :user

  scope :ordered, -> { order(timestamp: :desc) }
  scope :older_first, -> { order(timestamp: :asc) }
  scope :finished, -> { where(checked: true).where(shown: true) }
  scope :failed, -> { where(checked: true).where(shown: false) }
  scope :pending, -> { where(checked: false) }
  scope :for_check, -> { pending.older_first }
  scope :before_now, -> { where("timestamp <= ?", DateTime.now)}

  scope :scheduled_in, -> (start_date, end_date) { where("timestamp >= ? AND timestamp <= ?", start_date, end_date )}

  def blood_type
    self.user.blood_type
  end

  def rh
    self.user.rh
  end

  def check(shown)
    self.checked = true
    self.shown = shown
  end

  def status
    return STATUS_PENDING unless self.checked

    self.shown ? STATUS_FINISHED : STATUS_FAILED
  end

  def new_validation_can_not_be_in_past
    if timestamp < DateTime.now
      errors.add(:timestamp, "Termin mora biti u buducnosti")
    end
  end

  def new_validation_must_be_in_work_hours
    customTime = DateTime.new 2000, 1, 1, timestamp.hour, timestamp.min, timestamp.sec
    checkTimeStart = DateTime.new 2000, 1, 1, 8, 0, 0
    checkTimeEnd = DateTime.new 2000, 1, 1, 16, 0, 0

    unless customTime.between?(checkTimeStart, checkTimeEnd)
      errors.add(:timestamp, "Termin mora biti izmedju 8h i 16h")
    end
  end

  def new_donation_must_be_in_free_schedule
    if Donation.scheduled_in(timestamp - 15.minutes, timestamp + 15.minutes).count > 0
      errors.add(:timestamp, "Odabrani termin je zauzet")
    end
  end

end
