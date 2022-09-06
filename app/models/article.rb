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


  def self.divide_monthly
    group(:created_at)
    .order(Arel.sql("strftime('%Y%m', created_at) desc"))
    .count
  end
end
