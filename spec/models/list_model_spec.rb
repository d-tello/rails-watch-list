require 'rails_helper'

RSpec.describe 'List', type: :model do
  let(:valid_attributes) do
    {
      name: 'Superhero'
    }
  end

  it 'has a name' do
    list = List.new(name: 'Superhero')
    expect(list.name).to eq('Superhero')
  end

  it 'name cannot be blank' do
    attributes = valid_attributes
    attributes.delete(:name)
    list = List.new(attributes)
    expect(list).not_to be_valid
  end

  it 'name is unique' do
    List.create!(name: 'Superhero')
    list = List.new(name: 'Superhero')
    expect(list).not_to be_valid
  end
end
