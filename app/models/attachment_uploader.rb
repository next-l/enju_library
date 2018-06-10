class AttachmentUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :determine_mime_type
  plugin :versions

  # process(:store) do |io, context|
  #  original = io.download
  #  thumbnail = resize_to_limit(io.download, 100, 150)
  #
  #  {original: original, thumbnail: thumbnail}
  # end
end
