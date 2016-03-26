require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do
    it { should respond_to :make }
    it { should respond_to :model}
    it { should respond_to :year}
    it { should respond_to :mileage}
    it { should respond_to :color}
    it { should respond_to :interior}
  end

  describe 'sorts by' do
    it 'make' do
      car1 = Car.create(make: 'Kia')
      car2 = Car.create(make: 'Buick')
      car3 = Car.create(make: 'Ford')
      cars = Car.by_make
      expect(cars.first.make).to eq('Buick')
      expect(cars[1].make).to eq('Ford')
      expect(cars.last.make).to eq('Kia')
    end

    it 'price ascending' do
      car1= Car.create(price: 25000)
      car2= Car.create(price: 500)
      car3= Car.create(price: 17000)
      cars= Car.by_price
      expect(cars.first).to eq(car2)
      expect(cars[1]).to eq(car3)
      expect(cars.last).to eq(car1)
    end

    it 'price descending' do
      car1= Car.create(price: 25000)
      car2= Car.create(price: 500)
      car3= Car.create(price: 17000)
      cars= Car.by_price(true)
      expect(cars.first).to eq(car1)
      expect(cars[1]).to eq(car3)
      expect(cars.last).to eq(car2)
    end
  end

  describe 'model methods' do

    it 'honks the horn' do
      expect(Car.create.honk).to eq("Beep")
    end

    it 'returns the info' do
      info = {make: 'Toyota', model: 'Supra', price:20000, interior: 'Leather'}
      @car = Car.create(info)
      car_info = @car.info
      expect(car_info.keys.count).to eq(4)
      expect(car_info[:make]).to eq(info[:make])
      expect(car_info[:model]).to eq(info[:model])
      expect(car_info[:price]).to eq(info[:price])
      expect(car_info[:interior]).to eq(info[:interior])
    end
  end
end
