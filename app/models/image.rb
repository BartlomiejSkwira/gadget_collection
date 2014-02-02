class Image < ActiveRecord::Base
  belongs_to :gadget
  mount_uploader :file, GadgetImagesUploader

  def file_name
    File.basename self.file.path
  end

end
