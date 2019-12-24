require 'rails_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  fixtures :all

  describe ".export" do
    it "should export all user's information" do
      lines = User.export
      CSV.parse(lines, col_sep: "\t")
      expect(lines).not_to be_empty
      expect(lines.split(/\n/).size).to eq User.count + 1
    end
  end
end
