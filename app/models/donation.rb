class Donation < ApplicationRecord

  STATUS_FINISHED = 0.freeze
  STATUS_FAILED = 1.freeze
  STATUS_PENDING = 2.freeze

  belongs_to :user

  scope :ordered, -> { order(timestamp: :desc) }
  scope :older_first, -> { order(timestamp: :asc) }
  scope :finished, -> { where(checked: :true).where(shown: true) }
  scope :failed, -> { where(checked: :true).where(shown: false) }
  scope :pending, -> { where(checked: false) }
  scope :for_check, -> { pending.older_first }

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

end
