require "./JsonSerializer.cr"
include JsonSerializer

puts jsonify({
  nice: "meme",
  ayy: {
    lm: {
      "ayy": "ooo",
      "ten": 10,
      "tru": true,
      "null": nil,
      "char": 'c',
      arr: [
        "arr",
        1,
        true,
        nil,
        'm'
      ],
      range: 0..5,
      tuple: {
        "tuple",
        'o',
        'f',
        5,
        "memes"
      }
    }
  }
})
