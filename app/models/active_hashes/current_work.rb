# 現在の職業
class CurrentWork < ActiveHash::Base
  self.data = [
    { id: 1, name: '自営業' },
    { id: 2, name: 'フリーター' },
    { id: 3, name: 'コンビニアルバイト' },
    { id: 4, name: '地方公務員' },
    { id: 5, name: '国家公務員' },
    { id: 6, name: '会社員' },
    { id: 7, name: '製菓業界' },
    { id: 8, name: 'ケーキ販売' }
  ]
end
