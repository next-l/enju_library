class User < ApplicationRecord
  devise :database_authenticatable, #:registerable,
    :recoverable, :rememberable, :trackable, #, :validatable
    :lockable, lock_strategy: :none, unlock_strategy: :none

  include EnjuSeed::EnjuUser
  include EnjuCirculation::EnjuUser
      has_one :profile, dependent: :nullify
end

Accept.include(EnjuCirculation::EnjuAccept)
Basket.include(EnjuCirculation::EnjuBasket)
Manifestation.include(EnjuCirculation::EnjuManifestation)
Manifestation.include(EnjuSubject::EnjuManifestation)
Item.include(EnjuCirculation::EnjuItem)
Item.include(EnjuLibrary::EnjuItem)
Withdraw.include(EnjuCirculation::EnjuWithdraw)
