class AddReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference(:selected_tests, :user, foreign_key: true)
    change_column_null(:selected_tests, :user_id, false)

    add_reference(:selected_tests, :test, foreign_key: true)
    change_column_null(:selected_tests, :test_id, false)

    add_reference(:tests, :category, foreign_key: true)
    change_column_null(:tests, :category_id, false)

    add_reference(:questions, :test, foreign_key: true)
    change_column_null(:questions, :test_id, false)

    add_reference(:answers, :question, foreign_key: true)
    change_column_null(:answers, :question_id, false)

    add_reference(:tests, :user, foreign_key: true)
    change_column_null(:tests, :user_id, false)
  end
end
