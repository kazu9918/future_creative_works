class Industry < ApplicationRecord
    enum industry_category: { IT: 'IT', Finance: '金融', Manufacturing: '製造業' } # 例としていくつかの業界カテゴリを定義
    has_one :company
end
