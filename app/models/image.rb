class Image < ActiveRecord::Base
  belongs_to :gadget
  mount_uploader :file, GadgetImagesUploader
end
