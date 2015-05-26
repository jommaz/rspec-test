require 'transaction.rb'

describe Transaction do

	let(:newtransaction){Transaction.new(credit_account: 555, debit_account: 666, amount:777, time: Time.now)}
	# let(:invalidaccount){Transaction.new(credit_account: 6.66)}

	context 'valid_account_number' do
		it 'should check if the account number is valid' do
			expect(newtransaction.valid_account_number?(555)).to eq(true)
		end

		it 'should check if the account number is invalid' do
			expect{newtransaction.valid_account_number?(6.6)}.to raise_error(ArgumentError)
		end

	end

	context 'valid_amount? for transaction' do
		it 'should check if the amount for the transaction is a fix number' do
			expect(newtransaction.valid_amount?(666)).to eq(true)
		end

		it 'should check if the amount for the transaction is not a fix number' do
			expect{newtransaction.valid_amount?('running')}.to raise_error(ArgumentError)
		end
	end

	context 'valid_time? for transaction' do
		it 'should check if the time for the transaction is a time data type' do
			expect(newtransaction.valid_time?(Time.now)).to eq(true)
		end

		it 'should check if the time for the transaction is not in a time data type' do
			expect{newtransaction.valid_time?(808)}.to raise_error(ArgumentError)
		end
	end

	context 'amount_to_currency' do
		it 'should convert the currency to string and add $ as well as decimal point' do
			expect(newtransaction.amount_to_currency).to eq("$7.77")
		end
	end

	context 'pretty_time' do
		it 'should make the time into a string and more readable' do
			expect(newtransaction.pretty_time).to eq("Tuesday, 26 May 2015  5:36 PM")
		end
	end

end