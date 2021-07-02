# 購入場所
class WhereToBuy < ActiveHash::Base
  self.data = [
    { id: 1, name: 'コンビニ' },
    { id: 2, name: 'スーパー' },
    { id: 3, name: 'ドラッグストア' },
    { id: 4, name: '百貨店' },
    { id: 5, name: '個人店' },
    { id: 6, name: '手作り' },
    { id: 7, name: 'もらった' },
    { id: 8, name: '量販店' },
    { id: 9, name: 'その他' }
  ]
end
