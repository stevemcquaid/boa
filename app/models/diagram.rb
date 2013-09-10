class Diagram < ActiveRecord::Base
  attr_accessible :diagram_id, :image, :name

  mount_uploader :image, MidwayDiagramUploader
end
