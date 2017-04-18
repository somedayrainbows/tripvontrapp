class AddAttachmentPhotoToExperiences < ActiveRecord::Migration
  def self.up
    change_table :experiences do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :experiences, :photo
  end
end
