require 'spec_helper'

describe Link do
	let(:link) { Link.new }

	it 'is an object' do
		expect(link).to be_instance_of(Link)
	end

	it 'blah blah' do
		expect(link).not_to be_valid
	end
end