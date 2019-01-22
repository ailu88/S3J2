require_relative '../lib/event'

describe Event do

  before(:each) do
    Object.send(:remove_const, 'Event')
    load 'event.rb'
  end

	describe 'initializer' do
		it 'creates an event' do
	      test_event = Event.new("2019-04-05 10:00", 30, "teuf", ["bere", "polopogba"])

	      # test if user has been created
	      expect(test_event.class).to eq(Event)

		end
	end

end