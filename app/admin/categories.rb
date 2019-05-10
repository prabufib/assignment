ActiveAdmin.register Category do
  permit_params :name, :alias_name, :admin_user_id

  index do
    selectable_column
    id_column
    column :name
    column :alias_name
    column :created_at
    actions
  end

  filter :name
  filter :active
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :admin_user_id, :as => :hidden, :input_html => { :value => current_admin_user.id }
    end
    f.actions
  end

end
