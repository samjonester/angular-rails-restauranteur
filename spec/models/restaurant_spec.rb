require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before do
    @restaurant = Restaurant.new(name: 'Momofuku')
  end

  subject { @restaurant }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "when name is not present" do
    before { @restaurant.name = " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      restaurant_with_same_name = @restaurant.dup
      restaurant_with_same_name.name = @restaurant.name.upcase
      restaurant_with_same_name.save
    end

    it { should_not be_valid }
  end
end
