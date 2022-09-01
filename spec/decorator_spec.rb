require_relative '../decorators/base_decorator'
require_relative '../decorators/capitalize_decorator'
require_relative '../decorators/trimmer_decorator'
require_relative '../models/person'

describe BaseDecorator do
  before :each do
    @person = Person.new 25, 'ritobroto'
    @capitalize = CapitalizeDecorator.new(@person)
    @trimmer_decorator = TrimmerDecorator.new(@capitalize)
  end

  it 'Should display Ritoboto' do
    expect(@person.correct_name).to eq 'ritobroto'
  end

  it 'should capitalize person name' do
    expect(@capitalize.correct_name).to eq 'Ritobroto'
  end

  it 'should slice if sting is more than 10 char' do
    expect(@trimmer_decorator.correct_name).to eq 'Ritobroto'
    expect(@trimmer_decorator.correct_name.length).to be <= 10
  end
end
