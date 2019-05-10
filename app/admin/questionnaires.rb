ActiveAdmin.register Questionnaire do
  permit_params :name, :description, :active, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :active
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :active
      f.input :category_id, as: :select, label: 'Category:', collection: Category.pluck(:name, :id)
    end
    f.actions
  end

  show do
    panel("Questionnaire Details") do
      attributes_table_for resource do
        row :name
        row :description
        row :active
        row :Category
      end
    end

    panel "Questions" do
      table_for resource.questions do
        column :name
        column :description
        column :actions do |question|
          raw [
                  link_to( 'View', admin_questions_path(question.id) ),
              ].join(', ')
        end
      end
    end
  end



end
