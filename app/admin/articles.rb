ActiveAdmin.register Article do
  index do                            
    column :title                     
    column :excerpt
    default_actions                   
  end

  show do |article|
    attributes_table do
      row :title
      row :excerpt
      row :content
      row :image do
        image_tag(article.image)
      end
    end
    active_admin_comments
  end

  form do |f|                         
    f.inputs "Dados" do       
      f.input :title                  
      f.input :content               
      f.input :excerpt
      f.input :image  
    end                               
    f.buttons                         
  end 
end
