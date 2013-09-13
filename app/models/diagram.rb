class Diagram < ActiveRecord::Base
  attr_accessible :image, :name

  mount_uploader :image, MidwayDiagramUploader
end
