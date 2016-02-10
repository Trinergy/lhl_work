# Homepage (Root path)

before do 
  content_type :json
end

get '/' do
  content_type :html
  erb :index
end

get '/contacts' do
  Contact.all.to_json
end

post '/contacts/new' do
  nickname = params[:nickname]
  first_name = params[:first_name]
  last_name = params[:last_name]
  phone_number = params[:phone_number]
  email = params[:email]
  results = {result: false}
  
  contact = Contact.new(nickname: nickname, 
                        first_name: first_name, 
                        last_name: last_name, 
                        phone_number: phone_number,
                        email: email)
  if contact.save
    results[:result] = true
    results[:id] = contact.id
  end
  results.to_json
end

get '/contacts/search' do
  search_id = params[:id]
  results = {result: false}

  contact = Contact.find_by(id: search_id.to_i)
  if contact.blank?
    results.to_json
  else
    contact.to_json
  end
end

get '/contacts/delete' do
  delete_id = params[:id]
  results = {result: false}

  contact = Contact.find_by(id: delete_id)
  if contact.blank?
    results.to_json
  else
    Contact.destroy(delete_id)
    results[:result] = true
    results.to_json
  end

end
