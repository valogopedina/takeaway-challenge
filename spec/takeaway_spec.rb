require 'takeaway'

RSpec.describe Takeaway do

  subject(:takeaway)  {described_class.new}

    it 'sees a list of dishes with prices' do
      expect(takeaway.display_menu).to eq ({"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 })
    end

    it {is_expected.to respond_to(:select_dishes).with(2).arguments}

    it 'grows the basket after selection' do
      expect{takeaway.select_dishes('chicken', 4)}.to change{takeaway.basket.size}.by 1
    end

    it {is_expected.to respond_to(:check).with(1).argument}

    it 'raises an error if the sum of dishes is not equal to total' do
      expect{takeaway.check(14)}.to raise_error 'Total does not match!'
    end

    it 'returns if correct after one selection' do
      takeaway.select_dishes("rice", 1)
      expect(takeaway.check(1)).to eq true
    end

    it 'return if correct after more selections' do
      takeaway.select_dishes("rice", 3)
      takeaway.select_dishes("chicken", 1)
      takeaway.select_dishes("pizza", 4)
      expect(takeaway.check(30)).to eq true
    end





end