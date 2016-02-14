class Category < ActiveRecord::Base
    has_many :recipes
    
    def self.find_all_by_query(query)
      query = query.downcase
      query = "%#{query}%"
      
      Category.where(['lower(name) like ?',
                       query])
                      
    end
end
