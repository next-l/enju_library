class User < ApplicationRecord
  devise :database_authenticatable, #:registerable,
    :recoverable, :rememberable, :trackable, #, :validatable
    :lockable, lock_strategy: :none, unlock_strategy: :none

  include EnjuSeed::EnjuUser
  has_one :profile, dependent: :nullify
end

Item.include(EnjuLibrary::EnjuItem)
