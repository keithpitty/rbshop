module RBShop
  # An +Image+ is an abstraction of any image
  # file that GraphicsMagick can load.
  class Image
    # Lodds an image from a file.
    #
    # +nil+ is returned if the file is an
    # invalid image.
    #
    #   img = Image.load('octocat.jpg')
    #   # => <RBShop::Image:0x007fce9296d1e8>
    def self.load(path); end
  end
end
