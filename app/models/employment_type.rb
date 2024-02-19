class EmploymentType < ActiveHash::Base
    self.data = [
      { id: 1, category: '正社員' },
      { id: 2, category: 'パート（アルバイトを含む）' },
      { id: 3, category: '派遣' },
      { id: 4, category: '契約' },
      { id: 5, category: '委託' },
      { id: 6, category: 'その他' }
    ]
  end