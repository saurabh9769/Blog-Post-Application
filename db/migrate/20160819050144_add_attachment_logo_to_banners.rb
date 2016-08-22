class AddAttachmentLogoToBanners < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :banners, :logo
  end
end
