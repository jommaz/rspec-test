require 'article.rb'

describe Article do

	let(:article){Article.new}
	let(:full_article){Article.new(title:'First Article',body:'Great Body, it is so nice and sexy',author:'MJDM')}
	let(:qauthor){Article.new(author:'QRST')}

	context '#title' do

		it 'should check if #title? is empty' do
			expect(full_article.title?).to eq(true)
		end

		it 'should check if #title? is not empty'do
		expect(full_article.title?).to eq(true)
		end
	end

	context '#body' do
		it 'should check if #body? is empty' do
			expect(article.body?).to eq(false)
		end

		it 'should check if #body? is not empty'do
		expect(full_article.body?).to eq(true)
		end
	end

	context '#string' do
		it 'should check if #string is empty' do
			expect(article.string_empty?(nil)).to eq(true)
		end
		it 'should check if #string is blank' do
			expect(article.string_empty?("")).to eq(true)
		end
	end

	context '#author'  do
		it "should check if #authors_name_starts_with_q" do
		expect(qauthor.authors_name_starts_with_q?).to eq(true)
		end
		it "should check if #authors_name_does_not_starts_with_q" do
		expect(full_article.authors_name_starts_with_q?).to eq(false)
		end
	end

	context '#article_html' do

		it "checks if title_as_html is html" do
			expect(full_article.title_as_html).to eq("<h1>First Article</h1>")
		end
		it "checks if author_as_html is hshowing the author" do
			expect(full_article.author_as_html).to eq("<b>MJDM</b>")
		end
		it "checks if body_as_html is showing the body" do
			expect(full_article.body_as_html).to eq("<p>Great Body, it is so nice and sexy</p>")
		end

		it "checks if article_as_html contains title, body & author" do
			expect(full_article.article_as_html).to eq("<h1>First Article</h1>"+"<b>MJDM</b>"+"<p>Great Body, it is so nice and sexy</p>")
		end
	end

end