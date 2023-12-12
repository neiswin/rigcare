class AddTagTypeToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :tag_type, :string, default: "tag_default"
  end
end
