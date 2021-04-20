# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:good_params) do
    {
      user: create(:user),
      deck_category: create(:deck_category),
      name: 'Capitals of Europe',
      description: 'All the capitals of the continent',
      difficulty: 1
    }
  end

  it 'Allow a Deck to be created with good parameters' do
    object = described_class.new(good_params)
    expect do
      object.save
    end.to change(described_class, :count).by(1)
    expect(object.errors).to be_empty
  end

  it 'Does not allow a Deck to be created without a user' do
    bad_params = good_params.dup.except(:user)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:user]).not_to be_empty
  end

  it 'Does not allow a Deck to be created without a deck category' do
    bad_params = good_params.dup.except(:deck_category)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:deck_category]).not_to be_empty
  end

  it 'Does not allow a Deck to be created without a name' do
    bad_params = good_params.dup.except(:name)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:name]).not_to be_empty
  end

  it 'Does not allow a Deck to be created without an description' do
    bad_params = good_params.dup.except(:description)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:description]).not_to be_empty
  end

  it 'Does not allow a Deck to be created without a difficulty' do
    bad_params = good_params.dup.except(:difficulty)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:difficulty]).not_to be_empty
  end

  it 'Does not allow a Deck to be created with a too long name' do
    bad_params = good_params.dup
    bad_params[:name] = Faker::Lorem.characters(number: 256)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:name]).not_to be_empty
  end

  it 'Does not allow a Deck to be created with a too long description' do
    bad_params = good_params.dup
    bad_params[:description] = Faker::Lorem.characters(number: 256)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:description]).not_to be_empty
  end

  it 'Does not allow a Deck to be created with a negative difficulty' do
    bad_params = good_params.dup
    bad_params[:difficulty] = -1
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:difficulty]).not_to be_empty
  end

  it 'Does not allow a Deck to be created with a too high difficulty' do
    bad_params = good_params.dup
    bad_params[:difficulty] = 6
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:difficulty]).not_to be_empty
  end
end
