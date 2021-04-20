# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeckCategory, type: :model do
  let(:good_params) do
    {
      name: 'Geograph',
      description: 'Capitals, flags, etc',
    }
  end

  it 'Allow a DeckCategory to be created with good parameters' do
    object = described_class.new(good_params)
    expect do
      object.save
    end.to change(described_class, :count).by(1)
    expect(object.errors).to be_empty
  end

  it 'Does not allow a DeckCategory to be created without a name' do
    bad_params = good_params.dup.except(:name)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:name]).not_to be_empty
  end

  it 'Does not allow a DeckCategory to be created without an description' do
    bad_params = good_params.dup.except(:description)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:description]).not_to be_empty
  end

  it 'Does not allow a DeckCategory to be created with a too long name' do
    bad_params = good_params.dup
    bad_params[:name] = Faker::Lorem.characters(number: 256)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:name]).not_to be_empty
  end

  it 'Does not allow a DeckCategory to be created with a too long description' do
    bad_params = good_params.dup
    bad_params[:description] = Faker::Lorem.characters(number: 256)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:description]).not_to be_empty
  end
end
