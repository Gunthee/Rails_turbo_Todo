# app/models/task.rb
class Task < ApplicationRecord
    belongs_to :category
    after_initialize :set_default_status, if: :new_record?
  
    def set_default_status
      self.status ||= 'incomplete'
    end
  end
  