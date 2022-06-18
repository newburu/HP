class Contact < ApplicationRecord
  # モジュール
  extend Enumerize
  enumerize :matter, in: [:reserve, :inquiry, :other]
  enumerize :menu, in: %i(total_course personal_color_analysis face_type_skeleton_diagnosis purchase_color_sample_book
                          free_consultation_for_personal_color_training_course lecture_and_lecture_requests)
  enumerize :discount, in: %i(discounted_rates regular_rate)


  # 定数
  VALIDATE_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  MATTER_VALUES = %w(reserve inquiry other)
  MENU_VALUES = %w(total_course personal_color_analysis face_type_skeleton_diagnosis purchase_color_sample_book
                   free_consultation_for_personal_color_training_course lecture_and_lecture_requests)
  

  # バリデーション
  validates :name,                  presence: true,
                                    length: {maximum: 255}
  
  validates :name_hiragana,         presence: true,
                                    length: {maximum: 255}

  validates :email,                 presence: true,
                                    length: {maximum: 255},
                                    format: { with: VALIDATE_EMAIL }

  validates :matter,                presence: true,
                                    inclusion: { in: MATTER_VALUES }

  validates :menu,                  presence: true,
                                    inclusion: { in: MENU_VALUES }

  # validates :discount,            presence: false,
                                    #length: {maximum: 255}

  # validates :payment,             presence: false,
                                    #length: {maximum: 255}

  validates :content,               presence: true,
                                    length: {maximum:65535}




  # クラスメソッド


end
