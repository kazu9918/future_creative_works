class Industry < ActiveHash::Base
  self.data = [
    { id: 1, category: '運輸業' },
    { id: 2, category: '林業' },
    { id: 3, category: '建設業' },
    { id: 4, category: '製造業' },
    { id: 5, category: '小売業' },
    { id: 6, category: '医療・福祉' },
    { id: 7, category: '飲食業' },
    { id: 8, category: '保育業' }
  ]
end
