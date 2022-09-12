class Article < ApplicationRecord
  # モジュール
  extend Enumerize


  # 定数
  enumerize :status, in: %w(draft published), default: :draft


  # フック


  # バリデーション
  validates :status,    presence: true


  validates :title,     presence: true, 
                        length: {maximum: 50}


  validates :body,      presence: true


  def created_ym
    self.created_at.strftime("%Y年%m月")
  end

end
