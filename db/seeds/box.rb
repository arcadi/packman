BOXES = [
  ["Big Box", 1000],
  ["Small Box", 100],
  ["Tiny Box", 10],
  ["Red Box", 200],
  ["Green Packet", 500],
  ["Plastic Bag", 300]
]

BOXES.each do |param|
  box = Box.find_by_name(param[0])
  Box.create(name: param[0], volume: param[1]) unless box
end