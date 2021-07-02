Genre.delete_all

[
  [1,"チョコレート",0],
  [2, "スナック", 2],
  [3, "洋菓子", 0],
  [4, "和菓子", 0],
].each do |id, name, taste|
  Genre.create!(
    id: id,
    name: name,
    taste: taste,
  )
end