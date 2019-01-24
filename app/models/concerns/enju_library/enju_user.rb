module EnjuLibrary
  module EnjuUser
    extend ActiveSupport::Concern

    included do
      include EnjuSeed::EnjuUser
      has_many :basket, dependent: :destroy
    end
  end
end
