class Category < ActiveRecord::Base
    has_many :tasks

    def self.create_new(id, category)
        self.create(id: id, category: category)
    end

    def delete(id)
        self.find(id).destroy
    end



end