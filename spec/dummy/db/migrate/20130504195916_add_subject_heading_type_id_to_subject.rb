class AddSubjectHeadingTypeIdToSubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :subject_heading_type
  end
end
