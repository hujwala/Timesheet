set :stage, :production
set :branch, :master
set :rails_env, :production
set :deploy_to, '/u01/apps/qwinix/timesheet'
set :log_level, :debug

role :app, %w{deploy@it.timesheet.qwinixtech.com}
role :web, %w{deploy@it.timesheet.qwinixtech.com}
role :db,  %w{deploy@it.timesheet.qwinixtech.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server 'it.timesheet.qwinixtech.com', :user => 'deploy', :roles => %w{web app db}
set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_rsa.pub),
   auth_methods: %w(publickey)
}

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :staging)
