set :stage, :it
set :branch, :master
set :rails_env, :it
set :deploy_to, '/u01/apps/qwinix/timesheet'
set :log_level, :debug

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
role :app, %w{deploy@it.timesheet.qwinixtech.com}
role :web, %w{deploy@it.timesheet.qwinixtech.com}
role :db, %w{deploy@it.timesheet.qwinixtech.com}
server 'it.timesheet.qwinixtech.com', roles: %w{:web, :app, :db}, user: 'deploy'

set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_dsa),
   auth_methods: %w(publickey)
}