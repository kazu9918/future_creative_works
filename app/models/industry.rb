class Industry < ActiveHash::Base
  self.data = [
    { id: 1, category: '農林・水産業' },
    { id: 2, category: '林業' },
    { id: 3, category: '漁業' },
    { id: 4, category: '鉱業' },
    { id: 5, category: '建設業' },
    { id: 6, category: '製造業' },
    { id: 7, category: '電気・ガス' },
    { id: 8, category: '運輸・通信業' },
    { id: 9, category: '卸売・小売・飲食業' },
    { id: 10, category: '金融・保険業' },
    { id: 11, category: '不動産業' },
    { id: 12, category: 'サービス業' }
  ]
end
