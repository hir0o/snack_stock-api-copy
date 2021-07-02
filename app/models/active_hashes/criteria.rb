# お菓子購入の基準
class Criteria < ActiveHash::Base
  self.data = [
    { id: 1, name: '見た目が可愛い' },
    { id: 2, name: '商品名' },
    { id: 3, name: '製造メーカー' },
    { id: 4, name: '美味しい' },
    { id: 5, name: '新商品' },
    { id: 6, name: '手に入りやすい' },
    { id: 7, name: '期間限定' }
  ]
end
