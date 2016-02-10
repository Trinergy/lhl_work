
desc 'Ring the bell'
task :ring do
  puts "Bell is ringing."
end

desc 'Enter home'
task :enter do
  puts "Entering home!"
end

task :enter => :ring

file 'products.sql' => 'products.xml' do
  