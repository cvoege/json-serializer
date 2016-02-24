require "./spec_helper"
include JsonSerializer

describe JsonSerializer do
  # TODO: Write tests
  it "works" do
    jsonify({nice: "meme"}).should eq("{\"nice\":\"meme\"}")
  end
  it "stringifies massive json" do
    jsonify({
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
    }).should eq("{\"nice\":\"meme\",\"ayy\":{\"lm\":{\"ayy\":\"ooo\",\"ten\":10,\"tru\":true,\"null\":null,\"char\":\"c\",\"arr\":[\"arr\",1,true,null,\"m\"],\"range\":[0,1,2,3,4,5],\"tuple\":[\"tuple\",\"o\",\"f\",5,\"memes\"]}}}")
  end
end
