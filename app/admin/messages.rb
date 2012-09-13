# encoding: UTF-8
ActiveAdmin.register Message do
  config.filters = false

  show do |message|
    attributes_table do
      row "Título", :title
      row :email
      row "Mensagem", :content
    end
  end

  index do                            
    column "Nome", :name
    column :email
    column "Mensagem", :content
  end
end
