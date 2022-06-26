class Contact < ApplicationRecord
  # モジュール


  # 定数
  VALIDATE_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  MATTER_VALUES = %w(ご予約 お問い合わせ その他)
  MENU_VALUES = %w(トータルコース パーソナルカラー診断 顔タイプ骨格診断 色見本帳購入 パーソナルカラー養成講座無料相談 講座・講演依頼)


  # アソシエーション
  belongs_to :reservation


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

  validates :discount,              presence: false
                                    #length: {maximum: 255}

  validates :payment,               presence: false
                                    #length: {maximum: 255}

  validates :content,               presence: true,
                                    length: {maximum:65535}




  # クラスメソッド


end
