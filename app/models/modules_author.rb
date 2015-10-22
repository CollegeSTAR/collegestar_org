class ModulesAuthor < ActiveRecord::Base
  belongs_to :author_module, class_name: 'UdlModule'
  belongs_to :author, class_name: "User"
end
