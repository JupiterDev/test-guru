class Answer < ApplicationRecord
	belongs_to :question        # ответ принадлежит одному вопросу 
end
