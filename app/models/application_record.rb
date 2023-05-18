class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_save :generate_timestamp_created
  before_update :generate_timestamp_updated

  def generate_timestamp_created
    self.created_at = DateTime.now
  end

  def generate_timestamp_updated
    self.updated_at = DateTime.now
  end
end
