require 'action_controller'
params = ActionController::Parameters.new(user: { name: 'Francesco', age: 22, role: 'admin' })
test = params.require(:user).permit(:name, :age)
p test[:user] #=> nil
p test[:name] #=> "Francesco"
p test[:age]  #=> 22
p test[:role] #=> nil 
