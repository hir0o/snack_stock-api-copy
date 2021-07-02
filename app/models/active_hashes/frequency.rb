# お菓子を食べる頻度
class Frequency < ActiveHash::Base
  self.data = [
    { id: 1, name: '毎日' },
    { id: 2, name: '2日に1回' },
    { id: 3, name: '３日に1回' },
    { id: 4, name: '4日に1回' },
    { id: 5, name: '5日に1回' },
    { id: 6, name: '6日に1回' },
    { id: 7, name: '7日に1回' },
    { id: 8, name: 'たまに食べる' }
  ]
end
