class Picture < ActiveRecord::Base
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  mount_uploader :image, ImageUploader

  belongs_to :word

  def _presentation
    ActionController::Base.helpers.image_tag(image.thumb.url, class: 'client_title_thumbnail').html_safe
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ],
      [ :caption , "caption", :text_field ],
      [ :image , "image", :image_field ],
      [ :description , "description", :text_area ],
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    "name"
  end


end
