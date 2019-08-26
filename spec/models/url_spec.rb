require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:test_url) { Url.new(original: 'test.com') }

  describe 'Should be valid with valid data' do
    it 'Should not be valid with invalid domain' do 
      invalid_url = Url.new(original: 'test./test') 
      invalid_url_two = Url.new(original: 't---est./test')
      invalid_url_three = Url.new(original: '')


      expect(invalid_url).not_to be_valid
      expect(invalid_url_two).not_to be_valid
      expect(invalid_url_three).not_to be_valid
    end

    it 'Should be valid with a valid url' do 
      expect(test_url).to be_valid
    end

    it 'Should generate a valid code when valid data entered'  do
      test_url.save
      expect(test_url.shortened).to match(/\A[0-9a-zA-Z_]{6}\z/)
    end
  end 

  describe "#search" do
    context 'when url is found' do
      it 'should increment the count' do
        test_url.save

        Url.search(test_url.shortened)
        test_url.reload

        expect(test_url.count).to eq(1)
      end
    end

    context 'when url is not found' do
      it 'should return nil' do 
        expect( Url.search('123')).to be nil

      end
    end
  end
end

       

