class Test < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 616b84df785af58bcc0915d3ea9e4bf1050addad
=======

>>>>>>> 616b84df785af58bcc0915d3ea9e4bf1050addad
  def self.category_tests_titles_desc(category)

    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).order(title: :desc).pluck(:title)

  end
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 616b84df785af58bcc0915d3ea9e4bf1050addad
=======

>>>>>>> 616b84df785af58bcc0915d3ea9e4bf1050addad
end

