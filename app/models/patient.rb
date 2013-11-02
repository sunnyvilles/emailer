class Patient < ActiveResource::Base
  


self.site = "https://patients.apiary.io/"

  #has_and_belongs_to_many :mails
  #attr_accessible :mails_attributes
  #accepts_nested_attributes_for :mails, :reject_if => lambda { |a| a[:body].blank? }

#def singularize_collection_name
 #   unless @action == :index
      
#    
#    end
#end


  def new_element_path
    super.gsub(/\.json/, "")
  end

  # def collection_path
  #   super.gsub(/\.json/, "")
  # end

  def self.collection_path(prefix_options = {}, query_options = nil)
  	check_prefix_options(prefix_options)
  	
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      "#{prefix(prefix_options)}#{collection_name}".gsub(/\.json/, "")
    end

    
    def self.element_path(id, prefix_options = {}, query_options = nil)
    check_prefix_options(prefix_options)
    self.collection_name = "patient"
    prefix_options, query_options = split_options(prefix_options) if query_options.nil?
    "#{prefix(prefix_options)}#{collection_name}/#{URI.parser.escape id.to_s}#{query_string(query_options)}"

  end
end