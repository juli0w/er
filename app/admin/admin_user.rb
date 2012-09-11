# encoding: UTF-8
ActiveAdmin.register AdminUser do
  menu :priority => 1, :label => 'Usuários'

  index do                            
    column :email                     
    column "Último login", :last_sign_in_at           
    column "Contador de login", :sign_in_count
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Dados" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.buttons                         
  end                                 
end                                   
