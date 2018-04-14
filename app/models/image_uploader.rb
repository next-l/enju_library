class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :determine_mime_type
  plugin :processing
  plugin :versions
  plugin :store_dimensions
  Attacher.default_url {
    'ninja/noimage60x80.jpg'
  }

  process(:store) do |io, context|
    original = io.download
    thumbnail = ImageProcessing::MiniMagick.source(original).auto_orient.resize_to_limit!(160, 240)
    small = ImageProcessing::MiniMagick.source(original).auto_orient.resize_to_limit!(100, 150)
    medium = ImageProcessing::MiniMagick.source(original).auto_orient.resize_to_limit!(640, 640)

    {original: original, thumbnail: thumbnail, small: small, medium: medium}
  end
end
