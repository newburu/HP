class Contact < ApplicationRecord
  extend Enumerize

  enumerize :matter, in: %w[reserve inquiry other], i18n_scope: 'matter'
end
