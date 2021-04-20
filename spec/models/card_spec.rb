require 'rails_helper'

RSpec.fdescribe Card, type: :model do
  let(:good_params) do
    {
      deck: create(:deck),
      question: "What is the answer to the Ultimate Question of Life, the Universe, and Everything",
      answer: 42
    }

  end

  it "Allow a Card to be created with good parameters" do
    object = described_class.new(good_params)
    expect do
      object.save
    end.to change(described_class, :count).by(1)
    expect(object.errors).to be_empty
  end

  it "Does not allow a Card to be created without a deck" do
    bad_params = good_params.dup.except(:deck)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:deck]).not_to be_empty
  end

  it "Does not allow a Card to be created without a question" do
    bad_params = good_params.dup.except(:question)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:question]).not_to be_empty
  end

  it "Does not allow a Card to be created without an answer" do
    bad_params = good_params.dup.except(:answer)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:answer]).not_to be_empty
  end

  it "Does not allow a Card to be created with a too long question" do
    bad_params = good_params.dup
    bad_params[:question] = Faker::Lorem.characters(number: 256)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:question]).not_to be_empty
  end

  it "Does not allow a Card to be created with a too long answer" do
    bad_params = good_params.dup
    bad_params[:answer] = Faker::Lorem.characters(number: 256)
    object = described_class.new(bad_params)
    expect do
      object.save
    end.to change(described_class, :count).by(0)
    expect(object.errors[:answer]).not_to be_empty
  end
end
